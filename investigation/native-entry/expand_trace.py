"""Expand one call level and locate sensitive imported functions, statically."""
import bisect, hashlib, importlib.util, json, pathlib, re, subprocess, sys
sys.dont_write_bytecode = True
OUT=pathlib.Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('local_trace',OUT/'trace_entries.py')
trace=importlib.util.module_from_spec(spec);spec.loader.exec_module(trace)
VERSIONS=['1.99.0','1.100.0']

def normalized(path):
    lines=[]
    for line in path.read_text().splitlines():
        match=re.match(r'\s*([0-9a-f]+):\s+(?:[0-9a-f]{2} )+\s*\t(.*)',line)
        if not match: continue
        op=match[2].split('#')[0].split(';')[0].strip()
        op=re.sub(r'<[^>]+>','',op)
        op=re.sub(r'-?0x[0-9a-f]+\(%rip\)','RIP(%rip)',op)
        op=re.sub(r'(?<=\s)0x[0-9a-f]+\s*$','TARGET',op)
        lines.append(op.strip())
    return '\n'.join(lines)+'\n'

def main():
    calls=[re.findall(r'callq\s+(0x[0-9a-f]+)',(OUT/v/'module-exec.asm').read_text()) for v in VERSIONS]
    assert len(calls[0])==len(calls[1])
    pairs=list(dict.fromkeys(zip(*calls)))
    hooks=[]
    for index,ver in enumerate(VERSIONS):
        path=OUT/'.inputs'/f'{ver}.so';elf=trace.audit.ELF(path.read_bytes());ranges=trace.bounds(elf);records=[]
        for i,pair in enumerate(pairs):
            addr=int(pair[index],16)
            if addr in ranges:records.append(trace.dump(elf,path,ver,f'module-callee-{i:02}',addr,ranges[addr]))
        for i,addr in enumerate(re.findall(r'callq\s+(0x[0-9a-f]+)',(OUT/ver/'crypto-constructor.asm').read_text())):
            addr=int(addr,16)
            if addr in ranges:records.append(trace.dump(elf,path,ver,f'cpu-callee-{i:02}',addr,ranges[addr]))
        full=OUT/'.inputs'/f'{ver}-full.asm'
        with full.open('w') as output: subprocess.run(['/usr/bin/objdump','-d','--no-show-raw-insn',str(path)],stdout=output,check=True)
        interesting={r['offset']:r for r in elf.relocs if r['symbol'] and re.search(r'^(dlopen|dlsym|dladdr|dlclose|getenv|secure_getenv|system|popen|exec.*|posix_spawn.*|fork|vfork)$',r['symbol'])}
        starts=sorted(ranges);sites=[]
        for line in full.read_text().splitlines():
            match=re.search(r'# (0x[0-9a-f]+)',line)
            if not match or int(match[1],16) not in interesting:continue
            ins=int(line.split(':',1)[0].strip(),16);idx=bisect.bisect_right(starts,ins)-1;fn=starts[idx] if idx>=0 else None
            if fn is not None and ins>=fn+ranges[fn]:fn=None
            sites.append(dict(instruction=line.strip(),import_symbol=interesting[int(match[1],16)]['symbol'],function_va=hex(fn) if fn is not None else None))
        for fn in sorted(set(int(x['function_va'],16) for x in sites if x['function_va'] and x['import_symbol'].startswith('dl'))):
            records.append(trace.dump(elf,path,ver,f'dynamic-loader-{fn:x}',fn,ranges[fn]))
        (OUT/ver/'callee-records.json').write_text(json.dumps(records,indent=2)+'\n')
        (OUT/ver/'sensitive-import-sites.json').write_text(json.dumps(sites,indent=2)+'\n')
        definitions=[]
        for line in (OUT/ver/'module-exec.asm').read_text().splitlines():
            if 'leaq' not in line or '%rdx' not in line or 'ELF relocation: local pointer' not in line:continue
            addr=int(re.search(r'# (0x[0-9a-f]+)',line)[1],16)
            definitions.append(dict(instruction=line.strip(),definition_va=hex(addr),name=elf.cstr(elf.data,elf.fileoff(elf.pointer(addr))),python_callback_va=hex(elf.pointer(addr+8))))
        additional=[]
        for symbol in elf.symbols:
            if not symbol['name'].startswith('PyInit_') or symbol['name']=='PyInit__native':continue
            pc=symbol['value'];off=elf.fileoff(pc);module=pc+7+int.from_bytes(elf.data[off+3:off+7],'little',signed=True);slots=elf.pointer(module+72);callback=elf.pointer(slots+8)
            additional.append(trace.dump(elf,path,ver,'async-module-exec',callback,ranges[callback]))
        hooks.append(dict(version=ver,function_definitions=definitions,additional_entry=additional,weak_hooks=[r for r in elf.relocs if r['symbol'] in ['__gmon_start__','_ITM_registerTMCloneTable','_ITM_deregisterTMCloneTable']],irelative_relocations=[r for r in elf.relocs if r['type']==37],ifunc_symbols=[s for s in elf.symbols if s['info']&15==10]))
    (OUT/'direct-call-pairs.json').write_text(json.dumps(pairs,indent=2)+'\n')
    (OUT/'registration-and-hooks.json').write_text(json.dumps(hooks,indent=2)+'\n')
    comparisons=[]
    for name in ['module-exec.asm','crypto-constructor.asm']+[p.name for p in sorted((OUT/VERSIONS[0]).glob('module-callee-*.asm'))]:
        values=[normalized(OUT/v/name) for v in VERSIONS]
        for v,text in zip(VERSIONS,values):(OUT/v/name.replace('.asm','.normalized.txt')).write_text(text)
        comparisons.append(dict(file=name,instructions_equal_ignoring_pc_relative_addresses=values[0]==values[1],sha256_a=hashlib.sha256(values[0].encode()).hexdigest(),sha256_b=hashlib.sha256(values[1].encode()).hexdigest(),lines_a=len(values[0].splitlines()),lines_b=len(values[1].splitlines())))
    (OUT/'normalized-comparison.json').write_text(json.dumps(comparisons,indent=2)+'\n')

if __name__=='__main__':main()
