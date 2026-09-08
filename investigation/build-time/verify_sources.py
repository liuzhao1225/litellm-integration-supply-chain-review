import pathlib,urllib.request,json,hashlib,datetime,concurrent.futures
out=pathlib.Path(__file__).resolve().parent

def read(url):
 with urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'Static-build-source-review/1.0'}),timeout=40) as r:return r.read()
rec=json.loads((out/'backend-sources.json').read_text());meta=json.loads(read('https://api.github.com/repos/PyO3/maturin/commits/v1.9.4'));sha=meta['sha']
for r in rec:
 u=r['url'].replace('/v1.9.4/',f'/{sha}/');b=read(u);assert hashlib.sha256(b).hexdigest()==r['sha256'];r['fixed_commit_url']=u;r['commit']=sha
(out/'backend-sources.json').write_text(json.dumps(rec,indent=2)+'\n')
a=json.loads((out/'archive-analysis.json').read_text());pub=[]
for p in a['artifacts']:
 u=f"https://pypi.org/pypi/litellm/{p['version']}/json";raw=read(u);j=json.loads(raw);s=next(x for x in j['urls'] if x['filename']==f"litellm-{p['version']}.tar.gz");assert s['digests']['sha256']==p['sha256'];pub.append({'api_url':u,'response_sha256':hashlib.sha256(raw).hexdigest(),'checked_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'filename':s['filename'],'url':s['url'],'sha256':s['digests']['sha256'],'upload_time_iso_8601':s['upload_time_iso_8601'],'size':s['size']})
(out/'public-source-check.json').write_text(json.dumps({'maturin_commit':sha,'sdists':pub},indent=2)+'\n');print(json.dumps({'maturin_commit':sha,'sdists':pub},indent=2))
