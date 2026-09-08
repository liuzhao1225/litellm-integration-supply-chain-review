"""Read verified wheel ELF bytes as data; never import or load target libraries."""
import datetime, hashlib, json, pathlib, struct, subprocess, zipfile

OUT = pathlib.Path(__file__).resolve().parent
BASE = pathlib.Path('/tmp/litellm-version-research-20260909')
EXPECTED = {
    '1.99.0': ('1c45097e426fed2ae7fbd38b5404c3addeb203d0e1148c0a59848aabd5fe83c6', '2345a380bce52f040ff2ea0a7b1988e8f682a40e63bcb3b8ac822c53149e09a6'),
    '1.100.0': ('8224c8eed9cab3319a88e6665d1275ad8faf21d353b1b22223a6d6115a302ea2', 'c6992e805578007dc61f872127fb164490751adc6556c6b37e58f550a0f23951'),
}

class ELF:
    def __init__(self, data):
        self.data = data
        assert data[:6] == b'\x7fELF\x02\x01'
        h = struct.unpack_from('<HHIQQQIHHHHHH', data, 16)
        assert h[1] == 62
        shoff, shsize, shnum, shstr = h[5], h[10], h[11], h[12]
        raw = [struct.unpack_from('<IIQQQQIIQQ', data, shoff+i*shsize) for i in range(shnum)]
        names = data[raw[shstr][4]:raw[shstr][4]+raw[shstr][5]]
        self.sections = [dict(zip(('nameoff','type','flags','addr','offset','size','link','info','align','entsize'), s), name=self.cstr(names,s[0])) for s in raw]
        self.symbols = []
        for sec in self.sections:
            if sec['type'] != 11: continue
            strings = self.body(self.sections[sec['link']])
            for pos in range(sec['offset'], sec['offset']+sec['size'],sec['entsize']):
                name, info, other, index, value, size = struct.unpack_from('<IBBHQQ',data,pos)
                self.symbols.append(dict(name=self.cstr(strings,name),info=info,section=index,value=value,size=size))
        self.relocs = []
        for sec in self.sections:
            if sec['type'] != 4: continue
            for pos in range(sec['offset'],sec['offset']+sec['size'],sec['entsize']):
                offset, info, addend = struct.unpack_from('<QQq',data,pos)
                sym = info >> 32
                self.relocs.append(dict(section=sec['name'],offset=offset,type=info & 0xffffffff,addend=addend,symbol=self.symbols[sym]['name'] if sym else None))
        self.byrel = {r['offset']:r for r in self.relocs}

    @staticmethod
    def cstr(data, pos): return data[pos:data.index(0,pos)].decode('utf8',errors='replace')
    def body(self, sec): return self.data[sec['offset']:sec['offset']+sec['size']]
    def fileoff(self, addr):
        for s in self.sections:
            if s['type'] != 8 and s['addr'] <= addr < s['addr']+s['size']: return s['offset']+addr-s['addr']
        raise ValueError(hex(addr))
    def pointer(self, addr):
        r = self.byrel.get(addr)
        if r and r['type'] == 8: return r['addend']
        return struct.unpack_from('<Q',self.data,self.fileoff(addr))[0]

def disasm(path, start, end, out):
    result = subprocess.run(['/usr/bin/objdump','-d','--demangle',f'--start-address={start}',f'--stop-address={end}',str(path)],check=True,capture_output=True,text=True)
    out.write_text(result.stdout.replace(str(path),'<native-member>'))

def main():
    (OUT/'.inputs').mkdir(exist_ok=True)
    records=[]
    for ver, expected in EXPECTED.items():
        wheel=BASE/f'artifacts-{ver}'/f'litellm-{ver}-cp310-abi3-manylinux_2_28_x86_64.whl'
        assert hashlib.sha256(wheel.read_bytes()).hexdigest()==expected[0]
        with zipfile.ZipFile(wheel) as z: data=z.read('litellm/rust_bridge/_native.abi3.so')
        assert hashlib.sha256(data).hexdigest()==expected[1]
        path=OUT/'.inputs'/f'{ver}.so'; path.write_bytes(data)
        elf=ELF(data)
        dest=OUT/ver; dest.mkdir(exist_ok=True)
        arrays={}
        for s in elf.sections:
            if s['name'] in ('.init_array','.fini_array'):
                arrays[s['name']]=[dict(slot=hex(a),target=hex(elf.pointer(a)),file_offset=hex(elf.fileoff(elf.pointer(a)))) for a in range(s['addr'],s['addr']+s['size'],8)]
                for i,e in enumerate(arrays[s['name']]):
                    start=int(e['target'],16)
                    disasm(path,start,start+512,dest/f'{s["name"][1:]}-{i}.asm')
        init=[s for s in elf.symbols if s['name'].startswith('PyInit')]
        for s in init: disasm(path,s['value'],s['value']+s['size'],dest/f'{s["name"]}.asm')
        for s in elf.sections:
            if s['name'] in ('.init','.fini','.plt'): disasm(path,s['addr'],s['addr']+s['size'],dest/f'{s["name"][1:]}.asm')
        record=dict(version=ver,checked_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),wheel_sha256=expected[0],native_sha256=expected[1],arrays=arrays,pyinit=init,sections=elf.sections,dynsymbols=elf.symbols,relocations=elf.relocs)
        (dest/'elf.json').write_text(json.dumps(record,indent=2)+'\n')
        records.append({k:record[k] for k in ('version','checked_at_utc','wheel_sha256','native_sha256','arrays','pyinit')})
    (OUT/'entry-summary.json').write_text(json.dumps(records,indent=2)+'\n')
    print(json.dumps(records,indent=2))

if __name__=='__main__': main()
