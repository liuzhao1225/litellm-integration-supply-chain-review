import pathlib,tarfile,json,difflib,hashlib
out=pathlib.Path(__file__).resolve().parent;records=[]
for name in ['pyo3','pyo3-build-config','pyo3-ffi','pyo3-macros','pyo3-macros-backend']:
 data=[]
 for v in ['0.29.0','0.29.2']:
  with tarfile.open(out/'.inputs'/f'{name}-{v}.crate') as t:data.append({m.name.removeprefix(f'{name}-{v}/'):t.extractfile(m).read() for m in t if m.isfile()})
 a,b=data
 for n in sorted(a.keys()|b.keys()):
  if (n.endswith('.rs') or n in ['Cargo.toml','Cargo.toml.orig']) and a.get(n)!=b.get(n):
   rec={'crate':name,'path':n,'status':'added' if n not in a else 'removed' if n not in b else 'changed'};records.append(rec)
   p=out/'diffs/crates'/name/(n+'.diff');p.parent.mkdir(parents=True,exist_ok=True);p.write_text(''.join(difflib.unified_diff(a.get(n,b'').decode().splitlines(True),b.get(n,b'').decode().splitlines(True),fromfile=name+'0.29.0/'+n,tofile=name+'0.29.2/'+n)))
(out/'pyo3-diff-index.json').write_text(json.dumps(records,indent=2)+'\n');print(json.dumps(records,indent=2))
