"""Read six SDK-only locks, compare versions, and verify index artifact metadata.

Trusted stdlib Python -I -S only. No package archives downloaded or executed.
"""
import concurrent.futures
import datetime
import hashlib
import json
from pathlib import Path
import tomllib
import urllib.parse
import urllib.request

OUT=Path(__file__).resolve().parent/'resolution'/'sdk-subgraph'
def now():return datetime.datetime.now(datetime.timezone.utc).isoformat()
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
runs=json.loads((OUT/'runs.json').read_text())
assert runs['status']=='complete' and len(runs['runs'])==6
cases={}
artifacts={}
for run in runs['runs']:
    p=OUT/run['lock'];assert sha(p)==run['lock_sha256']
    d=tomllib.loads(p.read_text());pk=d['packages']
    assert len(pk)==55 and all(x.get('wheels') and not x.get('sdist') for x in pk)
    cases[run['platform'],run['label']]={x['name']:x for x in pk}
    for package in pk:
        for wheel in package['wheels']:
            filename=urllib.parse.unquote(urllib.parse.urlsplit(wheel['url']).path.rsplit('/',1)[-1])
            artifacts[package['name'],package['version'],filename]={'name':package['name'],'version':package['version'],'filename':filename,**wheel}

def fetch(key):
    name,version=key;url=f'https://pypi.org/pypi/{name}/{version}/json';started=now()
    with urllib.request.urlopen(url,timeout=30) as response:raw=response.read()
    d=json.loads(raw)
    return key,{'source':url,'captured_at_utc':started,'response_sha256':hashlib.sha256(raw).hexdigest(),
                'requires_python':d['info'].get('requires_python'),'requires_dist':d['info'].get('requires_dist') or [],
                'artifacts':[{k:x.get(k) for k in ['filename','url','digests','upload_time_iso_8601','yanked','requires_python']} for x in d['urls']]}
start=now()
with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
    metadata=dict(pool.map(fetch,sorted({(n,v) for n,v,_ in artifacts})))
checks=[]
for (name,version,filename),a in sorted(artifacts.items()):
    refs=[f for f in metadata[name,version]['artifacts'] if f['filename']==filename]
    assert len(refs)==1,(name,version,filename,'missing or duplicate PyPI filename')
    ref=refs[0]
    assert a['hashes']['sha256']==ref['digests']['sha256'],(name,version,filename,'hash mismatch')
    checks.append({'name':name,'version':version,'filename':filename,'mirror_url':a['url'],'pypi_url':ref['url'],
                   'sha256':a['hashes']['sha256'],'upload_time_iso_8601':ref['upload_time_iso_8601'],'yanked':ref['yanked']})
(OUT/'artifact-index-check.json').write_text(json.dumps({'started_at_utc':start,'completed_at_utc':now(),
    'method':'Compare every unique wheel URL filename/hash from six uv locks with fresh official PyPI version JSON. Index correspondence only; no wheel bytes or package behavior verified here.',
    'checked_unique_artifacts':len(checks),'metadata':[{ 'name':n,'version':v,**d} for (n,v),d in sorted(metadata.items())],
    'checks':checks},indent=2)+'\n')
comparisons=[]
for platform in runs['conditions']['assumed_platforms']:
    for left,right in [('wide','1.100.0'),('1.100.0','1.99.0')]:
        a=cases[platform,left];b=cases[platform,right]
        comparisons.append({'platform':platform,'left':left,'right':right,
                            'version_changes':[{'name':n,'left':a.get(n,{}).get('version'),'right':b.get(n,{}).get('version')} for n in sorted(a.keys()|b.keys()) if a.get(n,{}).get('version')!=b.get(n,{}).get('version')],
                            'non_litellm_changed_wheelsets':[n for n in sorted(a.keys()&b.keys()) if n!='litellm' and a[n]['wheels']!=b[n]['wheels']]})
a=cases['x86_64-manylinux_2_28','wide'];b=cases['aarch64-apple-darwin','wide']
summary={'summarized_at_utc':now(),'scope':runs['scope'],'conditions':runs['conditions'],
         'cases':[{'platform':p,'input':l,'package_count':len(pk),'litellm_version':pk['litellm']['version'],
                   'wheel_candidate_count':sum(len(x['wheels']) for x in pk.values()),'packages':list(pk.values())} for (p,l),pk in cases.items()],
         'comparisons':comparisons,'platform_version_changes':[n for n in a if a[n]['version']!=b[n]['version']],
         'platform_changed_wheelsets':[n for n in a if a[n]['wheels']!=b[n]['wheels']],
         'verified_unique_wheel_index_records':len(checks),
         'limitations':['Not the full YouDub dependency graph.','Platform tuples are stated assumptions, not a deployment inventory.','Same-time selected versions do not establish stability across time.','Multiple wheel candidates can remain per package; this is not an installed-artifact report.','Hashes match live index metadata; wheel content and native behavior were not verified in this check.']}
(OUT/'comparison.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({'comparisons':comparisons,'verified_unique_artifacts':len(checks),'metadata_versions':len(metadata),'platform_changed_wheelsets':summary['platform_changed_wheelsets']},indent=2))
