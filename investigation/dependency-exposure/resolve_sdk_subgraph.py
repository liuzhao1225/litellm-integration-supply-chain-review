"""Resolve only the LiteLLM SDK subgraph with an existing trusted uv binary.

No investigated package is installed/imported/executed; only-binary=:all:.
The interpreter probe is forced through -I -S to avoid site startup hooks.
Stops at the first failed case, preserving its real stdout/stderr and status.
"""
import datetime
import hashlib
import json
import os
from pathlib import Path
import subprocess
import urllib.request

OUT=Path(__file__).resolve().parent/'resolution'/'sdk-subgraph'
OUT.mkdir(exist_ok=True)
UV=Path('/opt/homebrew/bin/uv').resolve()
PYTHON=Path('/opt/homebrew/bin/python3').resolve()

def now():return datetime.datetime.now(datetime.timezone.utc).isoformat()
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(d):(OUT/'runs.json').write_text(json.dumps(d,indent=2)+'\n')

# uv 0.9.26 normally probes Python using -I -B, which alone does not suppress
# system site .pth files. Add -S at our explicitly selected interpreter entry.
wrapper=OUT/'python-no-site'
wrapper.write_text('#!/bin/sh\nexec '+str(PYTHON)+' -I -S "$@"\n')
wrapper.chmod(0o755)
source_records=[]
for file in ['crates/uv-python/src/interpreter.rs','crates/uv-python/python/get_interpreter_info.py']:
    url='https://raw.githubusercontent.com/astral-sh/uv/0.9.26/'+file
    with urllib.request.urlopen(url,timeout=30) as response:raw=response.read()
    p=OUT/file.rsplit('/',1)[-1];p.write_bytes(raw)
    source_records.append({'url':url,'file':p.name,'sha256':sha(p)})
for directory in ['tmp','cache','config','credentials']:(OUT/directory).mkdir(exist_ok=True)
env={'PATH':'/opt/homebrew/bin:/usr/bin:/bin','HOME':os.environ['HOME'],
     'LANG':'en_US.UTF-8','TMPDIR':str(OUT/'tmp'),'UV_CACHE_DIR':str(OUT/'cache'),
     'XDG_CONFIG_HOME':str(OUT/'config'),'UV_CREDENTIALS_DIR':str(OUT/'credentials'),
     'NETRC':'/dev/null','UV_PYTHON_DOWNLOADS':'never'}
state={'started_at_utc':now(),'scope':'LiteLLM base SDK only; all other YouDub root requirements omitted. This is not a complete YouDub solution.',
       'tool':{'uv_path':str(UV),'uv_sha256':sha(UV),'version':subprocess.run([str(UV),'--version'],capture_output=True,text=True,check=True).stdout.strip(),
               'python_path':str(PYTHON),'python_sha256':sha(PYTHON),'interpreter_wrapper_sha256':sha(wrapper),
               'probe_source_review':source_records},
       'conditions':{'python_version':'3.12','assumed_platforms':['x86_64-manylinux_2_28','aarch64-apple-darwin'],
                     'index':'https://mirrors.aliyun.com/pypi/simple/','resolution':'highest','prerelease':'disallow',
                     'fresh_cache':True,'installed_environment_consumed':False,
                     'builds_allowed':False,'source_distributions_allowed':False,'package_execution_allowed':False},
       'runs':[]}
save(state)
for platform in state['conditions']['assumed_platforms']:
    for label,requirement in [('wide','litellm>=1.89.0,<2.0.0'),('1.100.0','litellm==1.100.0'),('1.99.0','litellm==1.99.0')]:
        directory=OUT/(platform+'-'+label);directory.mkdir(exist_ok=True)
        inp=directory/'requirements.in';inp.write_text(requirement+'\n')
        lock=directory/'pylock.toml'
        assert not lock.exists(),('output already exists',lock)
        command=[str(UV),'--no-config','pip','compile',str(inp),'--python',str(wrapper),
                 '--python-version','3.12','--python-platform',platform,'--no-managed-python','--no-python-downloads',
                 '--only-binary',':all:','--no-sources','--keyring-provider','disabled',
                 '--default-index',state['conditions']['index'],'--resolution','highest','--prerelease','disallow',
                 '--format','pylock.toml','--output-file',str(lock),'--color','never','--no-progress']
        run={'label':label,'platform':platform,'input':str(inp.relative_to(OUT)),'input_sha256':sha(inp),'command':command,'started_at_utc':now()}
        print('Resolving',platform,label,flush=True)
        result=subprocess.run(command,cwd=directory,env=env,capture_output=True,text=True)
        (directory/'stdout.txt').write_text(result.stdout);(directory/'stderr.txt').write_text(result.stderr)
        run.update(completed_at_utc=now(),exit_code=result.returncode,stdout_sha256=sha(directory/'stdout.txt'),stderr_sha256=sha(directory/'stderr.txt'))
        if lock.exists():run.update(lock=str(lock.relative_to(OUT)),lock_sha256=sha(lock))
        state['runs'].append(run);save(state)
        print('Result',result.returncode,result.stderr[-1800:],flush=True)
        if result.returncode:
            state['status']='stopped_at_error';state['completed_at_utc']=now();save(state)
            raise SystemExit(result.returncode)
state['status']='complete';state['completed_at_utc']=now();save(state)
print('Completed six SDK-only resolutions',flush=True)
