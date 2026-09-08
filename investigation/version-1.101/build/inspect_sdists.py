import pathlib,json,urllib.request,hashlib,datetime,tarfile,difflib,tomllib
out=pathlib.Path(__file__).resolve().parent
sha=lambda b:hashlib.sha256(b).hexdigest()
metadata=out.parent/'availability.json';raw=metadata.read_bytes();records=json.loads(raw)
release=next(r for r in records if r.get('version')=='1.101.0rc1');artifact=next(f for f in release['files'] if f['filename'].endswith('.tar.gz'))
p=out/'.inputs'/artifact['filename'];start=datetime.datetime.now(datetime.timezone.utc).isoformat()
if p.exists():
 b=p.read_bytes();assert sha(b)==artifact['sha256'];origin='reused verified local archive'
else:
 with urllib.request.urlopen(artifact['url'],timeout=60) as response:
  b=response.read(30_000_001);assert len(b)<=30_000_000
 assert sha(b)==artifact['sha256'];assert len(b)==artifact['size'];p.write_bytes(b);origin='downloaded from recorded PyPI artifact URL'
report={'started_at_utc':start,'sdist_verified_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'availability_snapshot_sha256':sha(raw),'candidate':dict(artifact,local_path=str(p),origin=origin),'artifacts':{},'inventory':{},'controls':{},'rust_and_build_delta':{},'lock_delta':{},'pyproject_delta':{}}
(out/'availability-input.json').write_bytes(raw)
base=pathlib.Path('/Users/liuzhao/code/litellm-integration-review-evidence-20260909/round-1/artifacts-1.100.0/litellm-1.100.0.tar.gz')
assert sha(base.read_bytes())=='ece94e817a453a5b3a9517c03547c428d501cea719edb728c1b260e53f78ea35'
data={}
for v,path in [('1.100.0',base),('1.101.0rc1',p)]:
 fs={};special=[]
 with tarfile.open(path) as t:
  for m in t:
   n=m.name.removeprefix(f'litellm-{v}/');assert not pathlib.PurePosixPath(n).is_absolute() and '..' not in pathlib.PurePosixPath(n).parts
   if m.isfile():assert n not in fs;fs[n]=t.extractfile(m).read()
   else:special.append({'path':n,'type':repr(m.type),'link':m.linkname})
 data[v]=fs;report['artifacts'][v]={'path':str(path),'sha256':sha(path.read_bytes()),'bytes':path.stat().st_size}
 report['inventory'][v]={'files':[{'path':n,'bytes':len(b),'sha256':sha(b)} for n,b in sorted(fs.items())],'special':special}
 controls=[n for n in fs if pathlib.PurePosixPath(n).name in ['Cargo.toml','Cargo.lock','build.rs','pyproject.toml','setup.py','setup.cfg','MANIFEST.in','Makefile'] or '.cargo/' in n]
 report['controls'][v]=controls
 for n in controls:
  q=out/'sources'/v/(n+'.txt');q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(fs[n])
a,b=data.values()
for n in sorted(set(a)|set(b)):
 if (n.startswith('litellm-rust/') or n in set(report['controls']['1.100.0'])|set(report['controls']['1.101.0rc1'])) and a.get(n)!=b.get(n):
  report['rust_and_build_delta'][n]={'status':'added' if n not in a else 'removed' if n not in b else 'changed','before_sha256':sha(a[n]) if n in a else None,'after_sha256':sha(b[n]) if n in b else None}
  q=out/'diffs'/(n+'.diff');q.parent.mkdir(parents=True,exist_ok=True);q.write_text(''.join(difflib.unified_diff(a.get(n,b'').decode().splitlines(True),b.get(n,b'').decode().splitlines(True),fromfile='1.100.0/'+n,tofile='1.101.0rc1/'+n)))
  if n.endswith('.rs'):
   for v,fs in data.items():
    if n in fs:
     q=out/'sources'/v/(n+'.txt');q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(fs[n])
locks=[tomllib.loads(fs['litellm-rust/Cargo.lock'].decode())['package'] for fs in data.values()];idx=[{(p['name'],p['version'],p.get('source','')):p for p in l} for l in locks]
report['lock_delta']={'counts':[len(l) for l in locks],'identical_bytes':a['litellm-rust/Cargo.lock']==b['litellm-rust/Cargo.lock'],'added':[idx[1][k] for k in sorted(idx[1].keys()-idx[0].keys())],'removed':[idx[0][k] for k in sorted(idx[0].keys()-idx[1].keys())],'changed':[{'before':idx[0][k],'after':idx[1][k]} for k in sorted(idx[0].keys()&idx[1].keys()) if idx[0][k]!=idx[1][k]]}
py=[tomllib.loads(fs['pyproject.toml'].decode()) for fs in data.values()]
report['pyproject_delta']={'build_system_identical':py[0].get('build-system')==py[1].get('build-system'),'maturin_identical':py[0].get('tool',{}).get('maturin')==py[1].get('tool',{}).get('maturin'),'base_dependencies_identical':py[0]['project'].get('dependencies')==py[1]['project'].get('dependencies'),'scripts_identical':py[0]['project'].get('scripts')==py[1]['project'].get('scripts'),'build_system':py[1].get('build-system'),'maturin':py[1].get('tool',{}).get('maturin')}
(out/'sdist-analysis.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({k:v for k,v in report.items() if k not in ['inventory']},indent=2))
