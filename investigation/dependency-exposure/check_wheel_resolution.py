"""Establish wheel-only resolver feasibility without running a Python resolver.

Read public PEP 691 index metadata with trusted stdlib Python -I -S. Never
download/import/install an investigated package or invoke a build backend.
"""
import concurrent.futures
import datetime
import hashlib
import json
from pathlib import Path
import subprocess
import urllib.request

OUT = Path(__file__).resolve().parent / 'resolution'
OUT.mkdir(exist_ok=True)

def now():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()

def read_index(name):
    url=f'https://pypi.org/simple/{name}/'
    request=urllib.request.Request(url,headers={'Accept':'application/vnd.pypi.simple.v1+json'})
    start=now()
    with urllib.request.urlopen(request,timeout=30) as response:
        raw=response.read()
        content_type=response.headers.get('Content-Type')
    d=json.loads(raw)
    files=[{k:f.get(k) for k in ['filename','url','hashes','requires-python','yanked','upload-time','core-metadata','dist-info-metadata']} for f in d['files']]
    return {'project':name,'captured_at_utc':start,'source':url,'response_sha256':hashlib.sha256(raw).hexdigest(),
            'content_type':content_type,'index_meta':d.get('meta'), 'files':files,
            'wheel_count':sum(f['filename'].endswith('.whl') for f in files),
            'file_count':len(files)}

start=now()
uv=Path('/opt/homebrew/bin/uv').resolve()
version=subprocess.run([str(uv),'--version'],capture_output=True,text=True,check=True).stdout.strip()
help_text=subprocess.run([str(uv),'pip','compile','--help'],capture_output=True,text=True,check=True).stdout
(OUT/'uv-pip-compile-help.txt').write_text(help_text)
required=['--no-build','--only-binary','--no-sources','--no-python-downloads','--python-platform','--python-version','--generate-hashes']
assert all(flag in help_text for flag in required)
readme=subprocess.run(['git','-C','/Users/liuzhao/code/YouDub-webui','show','1add1b6d90795ddc222c3f5021305a2e8d953a17:README.md'],capture_output=True,check=True).stdout
(OUT/'youdub-fixed-readme.md').write_bytes(readme)
requirements=(OUT.parent/'youdub/requirements.txt').read_bytes()
(OUT/'requirements-wide.txt').write_bytes(requirements)
assert requirements.count(b'litellm>=1.89.0,<2.0.0')==1
(OUT/'requirements-litellm-1.100.0.txt').write_bytes(requirements.replace(b'litellm>=1.89.0,<2.0.0',b'litellm==1.100.0'))
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
    indices=list(pool.map(read_index,['dora-search','diffq','julius','openai-whisper']))
result={'started_at_utc':start,'completed_at_utc':now(),
        'method':'Only installed uv --version/--help and trusted stdlib PEP 691 reads. No dependency resolution subprocess, package download, import, install or build executed.',
        'tool':{'path':str(uv),'version':version,'sha256':hashlib.sha256(uv.read_bytes()).hexdigest(),
                'required_flags_available':required,'homebrew_receipt':'/opt/homebrew/Cellar/uv/0.9.26/INSTALL_RECEIPT.json'},
        'supported_python':'3.12','documented_platform_families':['Windows 10/11','Linux','WSL2','macOS'],
        'architecture_condition':'README does not fully specify architectures, OS floors, CUDA/PyTorch preinstalls or exact Python patch. A zero-wheel root blocks all wheel-only targets independently of these unknowns.',
        'head':'1add1b6d90795ddc222c3f5021305a2e8d953a17','readme_sha256':hashlib.sha256(readme).hexdigest(),
        'indices':indices,
        'zero_wheel_roots':[r['project'] for r in indices if r['wheel_count']==0],
        'inputs':[{'file':p.name,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in sorted(OUT.glob('requirements-*.txt'))]}
(OUT/'wheel-feasibility.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'completed_at_utc':result['completed_at_utc'],'tool':version,
                  'counts':[{k:r[k] for k in ['project','file_count','wheel_count']} for r in indices],
                  'zero_wheel_roots':result['zero_wheel_roots']},ensure_ascii=False))
