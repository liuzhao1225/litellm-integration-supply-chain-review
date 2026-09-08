"""Resolve ELF entry pointers, unwind-bounded functions and static references."""
import importlib.util, json, pathlib, re, struct

OUT = pathlib.Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('local_elf_auditor', OUT/'inspect_elf.py')
audit = importlib.util.module_from_spec(spec)
spec.loader.exec_module(audit)  # Our audit helper only, never target code.

def bounds(elf):
    s = next(s for s in elf.sections if s['name']=='.eh_frame_hdr')
    b=elf.body(s); assert b[:4]==bytes.fromhex('011b033b')
    count=struct.unpack_from('<I',b,8)[0]
    result={}
    for i in range(count):
        pc,fde=struct.unpack_from('<ii',b,12+i*8);pc+=s['addr'];fde+=s['addr']
        off=elf.fileoff(fde)
        fpc, size=struct.unpack_from('<iI',elf.data,off+8)
        assert fde+8+fpc==pc
        result[pc]=size
    return result

def dump(elf,path,ver,label,start,size):
    dest=OUT/ver/f'{label}.asm';audit.disasm(path,start,start+size,dest)
    annotated=[];refs=[]
    for line in dest.read_text().splitlines():
        match=re.search(r'# (0x[0-9a-f]+)',line)
        if match:
            addr=int(match[1],16);rel=elf.byrel.get(addr)
            if rel:
                note=rel['symbol'] or ('local pointer '+hex(rel['addend']))
                line+=' ; ELF relocation: '+note
                refs.append(dict(instruction=line.strip(),reference=hex(addr),relocation=rel))
            else:
                section=next((s for s in elf.sections if s['flags']&2 and s['addr']<=addr<s['addr']+s['size']),None)
                if section and section['name']=='.rodata':
                    text=elf.cstr(elf.data,elf.fileoff(addr))[:180]
                    if text and text.isascii() and all(c.isprintable() or c in '\n\t' for c in text):
                        line+=' ; rodata: '+repr(text)
        annotated.append(line)
    dest.write_text('\n'.join(annotated)+'\n')
    return dict(label=label,va=hex(start),file_offset=hex(elf.fileoff(start)),size=size,refs=refs)

def main():
    records=[]
    for ver in audit.EXPECTED:
        path=OUT/'.inputs'/f'{ver}.so';elf=audit.ELF(path.read_bytes());fdes=bounds(elf)
        py=next(s for s in elf.symbols if s['name']=='PyInit__native');pc=py['value'];off=elf.fileoff(pc)
        module=pc+7+struct.unpack_from('<i',elf.data,off+3)[0]
        got=pc+13+struct.unpack_from('<i',elf.data,off+9)[0]
        assert elf.byrel[got]['symbol']=='PyModuleDef_Init'
        slots=elf.pointer(module+72)
        assert elf.pointer(slots)==2 and elf.pointer(slots+16)==0 and elf.pointer(slots+24)==0
        execute=elf.pointer(slots+8)
        entry=json.loads((OUT/ver/'elf.json').read_text())
        ctor=int(entry['arrays']['.init_array'][2]['target'],16)
        assert elf.data[elf.fileoff(ctor)]==0xe9
        cpuid=ctor+5+struct.unpack_from('<i',elf.data,elf.fileoff(ctor)+1)[0]
        function_records=[]
        for label,addr in [('module-exec',execute),('crypto-constructor',cpuid)]:
            function_records.append(dump(elf,path,ver,label,addr,fdes[addr]))
        # Audit-chosen immediate callees; all addresses are taken from generated disassembly.
        targets={'1.99.0':[], '1.100.0':[]}
        for label,addr in targets[ver]: function_records.append(dump(elf,path,ver,label,addr,fdes[addr]))
        (OUT/ver/'fde-ranges.json').write_text(json.dumps({hex(k):v for k,v in fdes.items()},indent=2)+'\n')
        records.append(dict(version=ver,pyinit_va=hex(pc),pyinit_size=py['size'],module_def_va=hex(module),module_name=elf.cstr(elf.data,elf.fileoff(elf.pointer(module+40))),got_va=hex(got),got_symbol=elf.byrel[got]['symbol'],slots_va=hex(slots),slots=[dict(id=2,callback=hex(execute))],functions=function_records))
    (OUT/'resolved-entries.json').write_text(json.dumps(records,indent=2)+'\n')
    print(json.dumps([{k:v for k,v in r.items() if k!='functions'} for r in records],indent=2))

if __name__=='__main__': main()
