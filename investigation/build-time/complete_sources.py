import pathlib,tarfile,json,hashlib,re,tomllib
out=pathlib.Path(__file__).resolve().parent
records=json.loads((out/'crate-analysis.json').read_text());extra=[]
for rec in records:
 n,v=rec['name'],rec['version'];p=out/'.inputs'/f'{n}-{v}.crate'
 with tarfile.open(p) as t: fs={m.name.removeprefix(f'{n}-{v}/'):t.extractfile(m).read() for m in t if m.isfile()}
 wanted=set()
 if rec['build_script']:
  for f in fs:
   if '/' not in f and f.endswith(('.rs','.c','.h')): wanted.add(f)
 if n=='pythonize': wanted.update(f for f in fs if f.startswith('src/') and f.endswith('.rs'))
 for f in sorted(wanted):
  q=out/'crates'/f'{n}-{v}'/(f+'.txt');q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(fs[f]);extra.append({'crate':n,'version':v,'member':f,'path':str(q.relative_to(out)),'sha256':hashlib.sha256(fs[f]).hexdigest()})
(out/'additional-source-members.json').write_text(json.dumps(extra,indent=2)+'\n')
a=json.loads((out/'archive-analysis.json').read_text());lock=tomllib.loads((out/'sources/1.100.0/litellm-rust/Cargo.lock.txt').read_text())['package'];idx={}
for p in lock:idx.setdefault(p['name'],[]).append(p)
def resolve(d):
 x=d.split();c=idx[x[0]]
 if len(x)>1:c=[p for p in c if p['version']==x[1]]
 assert len(c)==1,d
 return c[0]
def closure(n):
 seen={};todo=[resolve(n)]
 while todo:
  p=todo.pop();k=p['name']+' '+p['version']
  if k in seen:continue
  seen[k]=p;todo.extend(resolve(x) for x in p.get('dependencies',[]))
 return set(seen)
new={p['name']+' '+p['version'] for p in a['lock_delta']['added']}
res={'note':'Lock-graph reachability only; lock merges targets/features/development edges; not cargo feature resolution or execution proof.','new_count':len(new),'pythonize_new':sorted(new&closure('pythonize')),'criterion_new':sorted(new&closure('criterion')),'outside_these':sorted(new-(closure('pythonize')|closure('criterion'))),'new_build_scripts':[{'name':r['name'],'version':r['version'],'build':r['build_script']} for r in records if r['name']+' '+r['version'] in new and r['build_script']]}
(out/'reachability.json').write_text(json.dumps(res,indent=2)+'\n');print(json.dumps(res,indent=2))
