"""Read public source/metadata only. Run with trusted Python 3.12+ -I -S.

No investigated module is installed, imported or executed. Dependency floor
metadata describes possible edges, not a solver result or an installed inventory.
"""
import ast
import concurrent.futures
import datetime
import difflib
import hashlib
import json
from pathlib import Path
import re
import subprocess
import tomllib
import urllib.request
import zipfile

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[1]
ARCHIVE = Path('/tmp/litellm-version-research-20260909')
YOUDUB = Path('/Users/liuzhao/code/YouDub-webui')
HEAD = '1add1b6d90795ddc222c3f5021305a2e8d953a17'
COMMITS = {'1.99.0': 'fa647f742d7baefe8eb1181899d9c81b41559772',
           '1.100.0': 'e4f25265704e2b2c6cf6e81be2e4c5cffff896f4'}

def now():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()

def sha(data):
    return hashlib.sha256(data).hexdigest()

def save(name, obj):
    (OUT / name).write_text(json.dumps(obj, ensure_ascii=False, indent=2) + '\n')

def collect_local():
    started = now()
    scan_path = ROOT / 'investigation/runtime-paths/runtime-scan.json'
    scan = json.loads(scan_path.read_text())
    used = {r['file'] for r in scan['sensitive_call_delta']}
    used.update(['litellm/__init__.py', 'litellm/main.py',
                 'litellm/llms/anthropic/common_utils.py', 'litellm/llms/anthropic/chat/handler.py',
                 'litellm/litellm_core_utils/get_model_cost_map.py', 'litellm/proxy/types_utils/utils.py',
                 'litellm/rerank_api/main.py', 'litellm/litellm_core_utils/get_llm_provider_logic.py',
                 'litellm/secret_managers/main.py'])
    manifest, trees, sources = [], {}, {}
    for version in COMMITS:
        wheels = list((ARCHIVE / ('artifacts-' + version)).glob('*manylinux_2_28_x86_64.whl'))
        assert len(wheels) == 1
        with zipfile.ZipFile(wheels[0]) as z:
            for file in sorted(used):
                p = ARCHIVE / ('wheel-python-' + version) / file
                if not p.exists():
                    continue
                raw = p.read_bytes()
                assert z.read(file) == raw, (version, file, 'extracted source differs from wheel')
                sources[version, file] = raw.decode()
                trees[version, file] = ast.parse(raw)
                manifest.append({'version': version, 'file': file, 'sha256': sha(raw),
                                 'matched_preserved_wheel_member': True,
                                 'url': f'https://github.com/BerriAI/litellm/blob/{COMMITS[version]}/{file}'})
    records = []
    for i, r in enumerate(scan['sensitive_call_delta']):
        file = r['file']
        src = sources['1.100.0', file].splitlines()
        tree = trees['1.100.0', file]
        ancestors = [n for n in ast.walk(tree) if isinstance(n, (ast.FunctionDef, ast.AsyncFunctionDef))
                     and n.lineno <= r['line'] <= n.end_lineno]
        func = min(ancestors, key=lambda n: n.end_lineno-n.lineno) if ancestors else None
        old_src = sources.get(('1.99.0', file), '').splitlines()
        records.append(dict(r, id=i, enclosing_function=func.name if func else None,
                            source_url=f'https://github.com/BerriAI/litellm/blob/{COMMITS["1.100.0"]}/{file}#L{r["line"]}',
                            context='\n'.join(f'{n+1}: {src[n]}' for n in range(max(0,r['line']-10), min(len(src),r['end_line']+6))),
                            file_diff='\n'.join(difflib.unified_diff(old_src, src, n=3))))
    save('candidate-contexts.json', {'checked_at_utc': started, 'input_sha256': sha(scan_path.read_bytes()), 'records': records})
    public_files = ['requirements.txt', 'backend/requirements.txt', 'backend/requirements-test.txt',
                    '.github/workflows/ci.yml', 'backend/app/adapters/litellm_translate.py',
                    'backend/app/adapters/openai_translate.py', 'backend/app/adapters/openai_client.py',
                    'backend/app/database.py', 'backend/app/config.py', 'backend/app/pipeline.py',
                    'backend/app/main.py', 'backend/tests/test_litellm_translate.py']
    for file in public_files:
        raw = subprocess.run(['git','-C',str(YOUDUB),'show',HEAD+':'+file],capture_output=True,check=True).stdout
        p = OUT / 'youdub' / file
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_bytes(raw)
        manifest.append({'repository': 'liuzhao1225/YouDub-webui','commit':HEAD,'file':file,
                         'sha256':sha(raw),'url':f'https://github.com/liuzhao1225/YouDub-webui/blob/{HEAD}/{file}'})
    projects = {}
    for version in COMMITS:
        raw=(ARCHIVE / ('source-'+version) / 'pyproject.toml').read_bytes()
        d=tomllib.loads(raw.decode())
        projects[version]={'sha256':sha(raw),'project_dependencies':d['project']['dependencies'],
                           'optional_dependencies':d['project'].get('optional-dependencies',{}),
                           'build_system':d['build-system'],
                           'source':f'https://github.com/BerriAI/litellm/blob/{COMMITS[version]}/pyproject.toml'}
    save('source-manifest.json',{'checked_at_utc':started,'completed_at_utc':now(),'method':'Read fixed Git blobs and compare inspected extracted source to preserved wheel members; no package execution.',
                                  'commits':COMMITS,'youdub_head':HEAD,'files':manifest,'projects':projects})
    print('Local source evidence captured:',len(manifest),'files;',len(records),'candidate contexts')

def fetch_floor(requirement):
    name,version=re.match(r'^([A-Za-z0-9_-]+)>=(\d+(?:\.\d+)+)',requirement).groups()
    url=f'https://pypi.org/pypi/{name}/{version}/json'
    started=now()
    with urllib.request.urlopen(url,timeout=30) as response:
        raw=response.read()
    d=json.loads(raw)
    return {'declared_requirement':requirement,'name':d['info']['name'],'version':d['info']['version'],
            'captured_at_utc':started,'source':url,'response_sha256':sha(raw),
            'requires_python':d['info']['requires_python'],'requires_dist':d['info']['requires_dist'] or [],
            'artifacts':[{'filename':x['filename'],'sha256':x['digests']['sha256'],
                          'url':x['url'],'upload_time_iso_8601':x['upload_time_iso_8601'],'yanked':x['yanked']}
                         for x in d['urls']]}

def collect_dependencies():
    start=now()
    requirements=json.loads((ROOT/'investigation/runtime-paths/install-boundary.json').read_text())['1.100.0']['base_requirements']
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        rows=list(pool.map(fetch_floor,requirements))
    save('dependency-floor-metadata.json',{'started_at_utc':start,'completed_at_utc':now(),
        'scope':'Exact minimum versions declared by LiteLLM 1.99.0 and 1.100.0. Not a resolved environment. All markers and extras retained unevaluated. No packages downloaded or executed.',
        'records':rows})
    print('Dependency floor metadata captured:',len(rows),'packages')

if __name__ == '__main__':
    collect_local()
    collect_dependencies()
