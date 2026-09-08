import pathlib,json,urllib.request,hashlib,tarfile,io,datetime,tomllib,concurrent.futures
out=pathlib.Path(__file__).resolve().parent;root=out.parents[1]
a=json.loads((out/'sdist-analysis.json').read_text());selected=[p for p in a['lock_delta']['added']+a['lock_delta']['removed'] if p.get('source','').startswith('registry+')]
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(p):
 n,v=p['name'],p['version'];url=f'https://static.crates.io/crates/{n}/{n}-{v}.crate';cache=out/'.inputs'/f'{n}-{v}.crate';cache=cache if cache.exists() else root/'build-time/.inputs'/f'{n}-{v}.crate';start=datetime.datetime.now(datetime.timezone.utc).isoformat()
 if cache.exists(): b=cache.read_bytes();origin=str(cache)
 else:
  with urllib.request.urlopen(url,timeout=40) as r:b=r.read(20_000_001)
  assert len(b)<=20_000_000
  origin=url
 assert sha(b)==p['checksum'],(n,v,sha(b),p['checksum'])
 (out/'.inputs'/f'{n}-{v}.crate').write_bytes(b)
 with tarfile.open(fileobj=io.BytesIO(b),mode='r:gz') as t:fs={m.name.removeprefix(f'{n}-{v}/'):t.extractfile(m).read() for m in t if m.isfile()}
 m=tomllib.loads(fs['Cargo.toml'].decode());build=m.get('package',{}).get('build','build.rs' if 'build.rs' in fs else False);proc=m.get('lib',{}).get('proc-macro',False)
 wanted=[x for x in fs if x in ['Cargo.toml','Cargo.toml.orig','build.rs',build] or '.cargo/' in x]
 if build or proc or n.startswith('pyo3') or n in ['proc-macro-crate','rstest_macros']:
  wanted += [x for x in fs if x.endswith(('.rs','.py'))]
 files=[]
 for f in sorted(set(wanted)):
  assert '..' not in pathlib.PurePosixPath(f).parts and not pathlib.PurePosixPath(f).is_absolute()
  dest=out/'crates'/f'{n}-{v}'/(f+'.txt');dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(fs[f]);files.append({'member':f,'path':str(dest.relative_to(out)),'sha256':sha(fs[f])})
 return {'name':n,'version':v,'url':url,'origin':origin,'request_start_utc':start,'verified_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'sha256':sha(b),'bytes':len(b),'matches_lock':True,'build_script':build,'proc_macro':proc,'build_dependencies':m.get('build-dependencies',{}),'files':files,'members':list(fs)}
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:r=list(pool.map(fetch,selected))
(out/'crate-analysis.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps([{k:p[k] for k in ['name','version','build_script','proc_macro','build_dependencies']} for p in r],indent=2))
