import tarfile,pathlib,hashlib,json,difflib,tomllib,datetime
out=pathlib.Path(__file__).resolve().parent; base=pathlib.Path('/Users/liuzhao/code/litellm-integration-review-evidence-20260909/round-1'); versions=['1.99.0','1.100.0']; data={}; report={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'artifacts':[],'inventory':{},'controls':{},'rust_delta':{},'lock_delta':{}}
for v in versions:
 p=base/f'artifacts-{v}'/f'litellm-{v}.tar.gz'; files={}; special=[]
 with tarfile.open(p) as t:
  for m in t:
   name=m.name.removeprefix(f'litellm-{v}/')
   if m.isfile():
    assert name not in files, name
    assert not pathlib.PurePosixPath(name).is_absolute() and '..' not in pathlib.PurePosixPath(name).parts
    files[name]=t.extractfile(m).read()
   else: special.append({'name':name,'type':repr(m.type),'link':m.linkname})
 data[v]=files
 report['artifacts'].append({'version':v,'path':str(p),'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'bytes':p.stat().st_size})
 report['inventory'][v]={'members':[{'path':n,'sha256':hashlib.sha256(b).hexdigest(),'bytes':len(b)} for n,b in sorted(files.items())],'special':special}
 controls=[n for n in files if pathlib.PurePosixPath(n).name in ['Cargo.toml','Cargo.lock','build.rs','pyproject.toml','setup.py','setup.cfg','MANIFEST.in','Makefile'] or '.cargo/' in n]
 report['controls'][v]=controls
 for n in controls:
  q=out/'sources'/v/(n+'.txt');q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(files[n])
a,b=[data[v] for v in versions]
for n in sorted(set(a)|set(b)):
 if (n.startswith('litellm-rust/') or n=='pyproject.toml') and a.get(n)!=b.get(n):
  report['rust_delta'][n]={'status':'added' if n not in a else 'removed' if n not in b else 'changed'}
  q=out/'diffs'/(n+'.diff');q.parent.mkdir(parents=True,exist_ok=True);q.write_text(''.join(difflib.unified_diff(a.get(n,b'').decode().splitlines(True),b.get(n,b'').decode().splitlines(True),fromfile=versions[0]+'/'+n,tofile=versions[1]+'/'+n)))
  if n.endswith('.rs'):
   for v in versions:
    if n in data[v]:
     q=out/'sources'/v/(n+'.txt');q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(data[v][n])
locks=[tomllib.loads(d['litellm-rust/Cargo.lock'].decode())['package'] for d in [a,b]]
idx=[{(p['name'],p['version'],p.get('source')):p for p in lock} for lock in locks]
key=lambda k:(k[0],k[1],k[2] or '')
report['lock_delta']={'counts':[len(x) for x in locks],'added':[idx[1][k] for k in sorted(idx[1].keys()-idx[0].keys(),key=key)],'removed':[idx[0][k] for k in sorted(idx[0].keys()-idx[1].keys(),key=key)],'changed':[{'before':idx[0][k],'after':idx[1][k]} for k in sorted(idx[0].keys()&idx[1].keys(),key=key) if idx[0][k]!=idx[1][k]]}
(out/'archive-analysis.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({k:report[k] for k in ['utc','controls','rust_delta','lock_delta']},indent=2))
