import pathlib,json,urllib.request,hashlib,tarfile,io,tomllib,datetime,difflib,concurrent.futures
out=pathlib.Path(__file__).resolve().parent;sha=lambda b:hashlib.sha256(b).hexdigest();now=lambda:datetime.datetime.now(datetime.timezone.utc).isoformat()
def read(u):
 with urllib.request.urlopen(u,timeout=40) as r:return r.read(30_000_001)
raw=read('https://pypi.org/pypi/maturin/1.15.0/json');j=json.loads(raw);artifact=next(x for x in j['urls'] if x['packagetype']=='sdist');cache=out/'.inputs'/artifact['filename'];b=cache.read_bytes() if cache.exists() else read(artifact['url']);assert sha(b)==artifact['digests']['sha256'];cache.write_bytes(b)
with tarfile.open(fileobj=io.BytesIO(b),mode='r:gz') as t:fs={m.name.removeprefix('maturin-1.15.0/'):t.extractfile(m).read() for m in t if m.isfile()}
files=[]
for n in ['maturin/__init__.py','src/compile.rs','src/build_options.rs','src/build_context/mod.rs','src/build_context/builder.rs','src/build_context/repair.rs','src/commands/pep517.rs','src/cross_compile.rs','pyproject.toml','Cargo.toml','Cargo.lock']:
 assert n in fs,n
 dest=out/'backend/1.15.0'/(n+'.txt');dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(fs[n]);files.append({'member':n,'path':str(dest.relative_to(out)),'sha256':sha(fs[n])})
 old_name='src/build_context.rs' if n=='src/build_context/mod.rs' else n
 old=out.parents[1]/'build-time/backend'/(old_name+'.txt')
 if old.exists():
  oldb=old.read_bytes();dest=out/'backend/1.9.4'/(n+'.txt');dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(oldb)
  diff=out/'diffs/backend'/(n+'.diff');diff.parent.mkdir(parents=True,exist_ok=True);diff.write_text(''.join(difflib.unified_diff(oldb.decode().splitlines(True),fs[n].decode().splitlines(True),fromfile='maturin1.9.4/'+n,tofile='maturin1.15.0/'+n)))
record={'checked_at_utc':now(),'api_url':'https://pypi.org/pypi/maturin/1.15.0/json','api_response_sha256':sha(raw),'url':artifact['url'],'archive_sha256':sha(b),'matches_pypi':True,'files':files}
(out/'backend-analysis.json').write_text(json.dumps(record,indent=2)+'\n')
tags=(out.parent/'artifacts/tag-resolution.json').read_bytes();tag=json.loads(tags);(out/'tag-input.json').write_bytes(tags);commit=tag['commit']
a=json.loads((out/'sdist-analysis.json').read_text());paths=set(a['controls']['1.101.0rc1']);paths|={f for f in a['rust_and_build_delta'] if f.startswith('litellm-rust/crates/python-') and f.endswith('.rs') and a['rust_and_build_delta'][f]['status']!='removed'}
def compare(f):
 u=f'https://raw.githubusercontent.com/BerriAI/litellm/{commit}/{f}';b=read(u);p=out/'sources/1.101.0rc1'/(f+'.txt');same=b==p.read_bytes();q=out/'git-sources'/(f+'.txt');q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(b)
 if not same:
  q=out/'diffs/git-to-sdist'/(f+'.diff');q.parent.mkdir(parents=True,exist_ok=True);q.write_text(''.join(difflib.unified_diff(b.decode().splitlines(True),p.read_text().splitlines(True),fromfile='git/'+f,tofile='sdist/'+f)))
 return {'path':f,'url':u,'checked_at_utc':now(),'git_sha256':sha(b),'sdist_sha256':sha(p.read_bytes()),'identical':same}
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:records=list(pool.map(compare,sorted(paths)))
(out/'git-comparison.json').write_text(json.dumps({'commit':commit,'tag_snapshot_sha256':sha(tags),'files':records},indent=2)+'\n');print(json.dumps({'maturin':record,'git_count':len(records),'git_differences':[r for r in records if not r['identical']]},indent=2))
