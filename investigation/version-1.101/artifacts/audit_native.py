"""Static candidate ELF entry/ABI comparison; only imports our prior audit helpers."""
import datetime, hashlib, importlib.util, json, pathlib, re, struct, subprocess, sys
sys.dont_write_bytecode=True
OUT=pathlib.Path(__file__).resolve().parent
INV=OUT.parent.parent
def helper(name,path):
    spec=importlib.util.spec_from_file_location(name,path);mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod);return mod
trace=helper('our_trace',INV/'native-entry/trace_entries.py')
expand=helper('our_expand',INV/'native-entry/expand_trace.py')
abi=helper('our_abi',INV/'abi-compatibility/check_abi.py')

def main():
    path=OUT/'.inputs/native-linux-x86_64.so';data=path.read_bytes();elf=trace.audit.ELF(data);bounds=trace.bounds(elf)
    trace.OUT=OUT/'native';ver='1.101.0rc1';dest=trace.OUT/ver;dest.mkdir(parents=True,exist_ok=True)
    entry=next(s for s in elf.symbols if s['name']=='PyInit__native');pc=entry['value'];off=elf.fileoff(pc)
    assert data[off:off+3]==bytes.fromhex('488d3d') and data[off+7:off+9]==bytes.fromhex('ff25')
    module=pc+7+struct.unpack_from('<i',data,off+3)[0];got=pc+13+struct.unpack_from('<i',data,off+9)[0];slots=elf.pointer(module+72);callback=elf.pointer(slots+8)
    assert elf.pointer(slots)==2 and elf.pointer(slots+16)==0
    records=[trace.dump(elf,path,ver,'module-exec',callback,bounds[callback])]
    arrays={}
    for sec in elf.sections:
        if sec['name'] in ['.init_array','.fini_array']:
            arrays[sec['name']]=[dict(slot=hex(a),target=hex(elf.pointer(a))) for a in range(sec['addr'],sec['addr']+sec['size'],8)]
        if sec['name'] in ['.init','.fini','.plt']:
            trace.dump(elf,path,ver,sec['name'][1:],sec['addr'],sec['size'])
    for i,item in enumerate(arrays['.init_array']):
        start=int(item['target'],16);trace.dump(elf,path,ver,f'init-array-{i}',start,16)
    ctor=int(arrays['.init_array'][2]['target'],16);assert data[elf.fileoff(ctor)]==0xe9
    cpuid=ctor+5+struct.unpack_from('<i',data,elf.fileoff(ctor)+1)[0];records.append(trace.dump(elf,path,ver,'crypto-constructor',cpuid,bounds[cpuid]))
    baseline=INV/'native-entry/1.100.0'
    calls=[re.findall(r'callq\s+(0x[0-9a-f]+)',p.read_text()) for p in [baseline/'module-exec.asm',dest/'module-exec.asm']]
    pairs=list(dict.fromkeys(zip(*calls))) if len(calls[0])==len(calls[1]) else []
    for i,(old,new) in enumerate(pairs):
        addr=int(new,16)
        if addr in bounds:records.append(trace.dump(elf,path,ver,f'module-callee-{i:02}',addr,bounds[addr]))
    candidate_callees=[]
    for target in dict.fromkeys(calls[1]):
        addr=int(target,16)
        if addr in bounds:candidate_callees.append(trace.dump(elf,path,ver,f'candidate-callee-{addr:x}',addr,bounds[addr]))
    definitions=[]
    for line in (dest/'module-exec.asm').read_text().splitlines():
        if 'leaq' not in line or '%rdx' not in line or '# 0x' not in line:continue
        addr=int(re.search(r'# (0x[0-9a-f]+)',line)[1],16)
        if addr not in elf.byrel:continue
        value=elf.pointer(addr)
        try:name=elf.cstr(elf.data,elf.fileoff(value))
        except ValueError:continue
        if name and name.isascii() and name.isprintable():definitions.append(dict(va=hex(addr),name=name,callback=hex(elf.pointer(addr+8))))
    (OUT/'native-registration.json').write_text(json.dumps(dict(definitions=definitions,callees=candidate_callees),indent=2)+'\n')
    comparisons=[]
    for name in ['module-exec.asm','crypto-constructor.asm']+[p.name for p in sorted(dest.glob('module-callee-*.asm'))]:
        before=expand.normalized(baseline/name);after=expand.normalized(dest/name)
        comparisons.append(dict(file=name,instructions_equal_ignoring_pc_relative_addresses=before==after,sha256_1_100=hashlib.sha256(before.encode()).hexdigest(),sha256_candidate=hashlib.sha256(after.encode()).hexdigest(),import_reference_sequence_1_100=re.findall(r'ELF relocation: ((?!local pointer)[^\n]+)',(baseline/name).read_text()),import_reference_sequence_candidate=re.findall(r'ELF relocation: ((?!local pointer)[^\n]+)',(dest/name).read_text())))
        (dest/name.replace('.asm','.normalized.txt')).write_text(after)
    symbols=[s for s in elf.symbols if not s['section']];old=json.loads((baseline/'elf.json').read_text())
    python=sorted(s['name'] for s in symbols if s['name'].startswith(('Py','_Py')))
    abis=abi.records(INV/'abi-compatibility/v3.10.0/Misc/stable_abi.txt',False)
    abirows=[dict(name=n,entry=abis.get(n),within_3_10=bool(abis.get(n) and tuple(map(int,abis[n]['added'].split('.')))<=(3,10))) for n in python]
    oldnames=set(s['name'] for s in old['dynsymbols'] if not s['section'])
    textsec=next(s for s in elf.sections if s['name']=='.text');trace.dump(elf,path,ver,'crt-start',textsec['addr'],pc-textsec['addr'])
    trace.dump(elf,path,ver,'PyInit__native',pc,entry['size'])
    header=subprocess.run(['/usr/bin/objdump','-p','-h',str(path)],check=True,capture_output=True,text=True).stdout.replace(str(path),'<candidate-native>');(dest/'headers.txt').write_text(header)
    result=dict(checked_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),native_sha256=hashlib.sha256(data).hexdigest(),bytes=len(data),arrays=arrays,pyinit=entry,module_def_va=hex(module),got_va=hex(got),got_relocation=elf.byrel[got],slots_va=hex(slots),callback_va=hex(callback),functions=records,direct_call_counts=[len(x) for x in calls],direct_call_pairs=pairs,comparisons=comparisons,python_symbols=python,stable_abi=abirows,undefined_added=sorted(set(s['name'] for s in symbols)-oldnames),undefined_removed=sorted(oldnames-set(s['name'] for s in symbols)),compiler_revisions=sorted(set(x.decode() for x in re.findall(rb'/rustc/([0-9a-f]{40})',data))),ifunc_symbols=[s for s in elf.symbols if s['info']&15==10],irelative_relocations=[r for r in elf.relocs if r['type']==37])
    (OUT/'native-summary.json').write_text(json.dumps(result,indent=2)+'\n')
    (dest/'elf.json').write_text(json.dumps(dict(sections=elf.sections,dynsymbols=elf.symbols,relocations=elf.relocs),indent=2)+'\n')
    print(json.dumps({k:result[k] for k in ['native_sha256','bytes','arrays','pyinit','callback_va','undefined_added','undefined_removed','compiler_revisions']},indent=2))
    print('normalized_equal',sum(x['instructions_equal_ignoring_pc_relative_addresses'] for x in comparisons),'/',len(comparisons),'abi compatible',sum(x['within_3_10'] for x in abirows),'/',len(abirows))

if __name__=='__main__':main()
