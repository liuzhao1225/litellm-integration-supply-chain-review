import pathlib,json,urllib.request,concurrent.futures,hashlib,zipfile,re,difflib
p=pathlib.Path('/tmp/litellm-version-research-20260909');out=p/'frontend-git';out.mkdir(exist_ok=True)
items=json.loads((p/'frontend-git-only.json').read_text())
def get(x):
 b=urllib.request.urlopen('https://raw.githubusercontent.com/BerriAI/litellm/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/'+x['path'],timeout=30).read()
 assert hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()==x['sha']
 (out/pathlib.Path(x['path']).name).write_bytes(b)
 return x['path'],b.decode()
with concurrent.futures.ThreadPoolExecutor(max_workers=6) as ex: git=dict(ex.map(get,items))
a=json.loads((p/'frontend-audit.json').read_text())['artifacts'][0]
z=zipfile.ZipFile(p/'artifacts-1.100.0'/a['artifact']);result=[]
def norm(t):
 return re.sub(r'[a-zA-Z0-9_-]{12,22}\.js','CHUNK.js',t)
for n in a['js_git_missing']:
 t=z.read(n).decode().replace('\r\n','\n'); nt=norm(t)
 candidates=[]
 for gn,gt in git.items():
  ng=norm(gt)
  # Compare fixed 100-character blocks; character-level matching is quadratic on minified bundles.
  s=difflib.SequenceMatcher(None,[ng[i:i+100] for i in range(0,len(ng),100)],[nt[i:i+100] for i in range(0,len(nt),100)],autojunk=False)
  candidates.append((s.ratio(),gn,gt))
 ratio,gn,gt=max(candidates)
 exact=nt==norm(gt)
 record={'wheel_path':n,'git_path':gn,'normalized_chunk_names_equal':exact,'block_similarity':ratio,'wheel_bytes':len(t),'git_bytes':len(gt)}
 result.append(record)
 (out/(pathlib.Path(n).name+'.wheel.txt')).write_text(t)
 print(json.dumps(record),flush=True)
(p/'frontend-chunk-comparison.json').write_text(json.dumps(result,indent=2))
