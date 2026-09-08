import pathlib,json,tomllib,urllib.request,hashlib,tarfile,io,datetime,concurrent.futures
out=pathlib.Path(__file__).resolve().parent
analysis=json.loads((out/'archive-analysis.json').read_text())
lock=tomllib.loads((out/'sources/1.100.0/litellm-rust/Cargo.lock.txt').read_text())['package']
selected=analysis['lock_delta']['added']+[p for p in lock if p['name'] in ['pyo3','pyo3-ffi','pyo3-build-config','cc']]
(out/'.inputs').mkdir(exist_ok=True)
def fetch(p):
 n,v=p['name'],p['version']; url=f'https://static.crates.io/crates/{n}/{n}-{v}.crate'; started=datetime.datetime.now(datetime.timezone.utc).isoformat()
 req=urllib.request.Request(url,headers={'User-Agent':'Static-build-source-review/1.0'})
 with urllib.request.urlopen(req,timeout=45) as r:
  b=r.read(30_000_001); final=r.url
 assert len(b)<=30_000_000, (n,'size limit')
 digest=hashlib.sha256(b).hexdigest(); assert digest==p['checksum'],(n,digest,p['checksum'])
 (out/'.inputs'/f'{n}-{v}.crate').write_bytes(b)
 with tarfile.open(fileobj=io.BytesIO(b),mode='r:gz') as t:
  fs={m.name.removeprefix(f'{n}-{v}/'):t.extractfile(m).read() for m in t if m.isfile()}
 manifest=tomllib.loads(fs['Cargo.toml'].decode()); build=manifest.get('package',{}).get('build','build.rs' if 'build.rs' in fs else False)
 controls=[x for x in fs if x in ['Cargo.toml','Cargo.toml.orig','build.rs',build] or '.cargo/' in x]
 if n in ['pyo3-build-config','cc']: controls+= [x for x in fs if x.endswith('.rs') and x.startswith('src/')]
 if build: controls += [x for x in fs if x.startswith('build/') or x.startswith('build_script')]
 records=[]
 for x in sorted(set(controls)):
  assert '..' not in pathlib.PurePosixPath(x).parts and not pathlib.PurePosixPath(x).is_absolute()
  target=out/'crates'/f'{n}-{v}'/(x+'.txt');target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(fs[x]);records.append({'path':str(target.relative_to(out)),'member':x,'sha256':hashlib.sha256(fs[x]).hexdigest()})
 return {'name':n,'version':v,'url':url,'final_url':final,'utc':started,'sha256':digest,'lock_checksum_matches':True,'bytes':len(b),'build_script':build,'proc_macro':manifest.get('lib',{}).get('proc-macro',False),'build_dependencies':manifest.get('build-dependencies',{}),'features':manifest.get('features',{}),'files':records,'archive_members':list(fs)}
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool: records=list(pool.map(fetch,selected))
(out/'crate-analysis.json').write_text(json.dumps(records,indent=2)+'\n')
print(json.dumps([{'name':p['name'],'build':p['build_script'],'proc_macro':p['proc_macro'],'bytes':p['bytes'],'build_dependencies':p['build_dependencies']} for p in records],indent=2))
