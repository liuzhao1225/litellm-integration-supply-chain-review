"""Assemble bounded public evidence from saved data; never execute package code."""
import hashlib, json, pathlib

OUT = pathlib.Path(__file__).resolve().parent
ROOT = OUT.parent.parent
def read(path):
    return json.loads((ROOT/path).read_text())
def dump(name, value):
    (OUT/name).write_text(json.dumps(value, indent=2, ensure_ascii=False)+'\n')
def sha(data):
    return hashlib.sha256(data).hexdigest()
def raw(label):
    return json.loads((OUT/'.raw'/f'{label}.body').read_text())

records = [json.loads(p.read_text()) for p in sorted((OUT/'.raw').glob('*.record.json'))]
dump('fetch-index.json', [{k:v for k,v in r.items() if k!='headers'} for r in records])
old = read('investigation/version-1.101/availability.json')
old_files = next(x['files'] for x in old if x.get('version')=='1.101.0rc1')
current = raw('pypi-1.101.0rc1')
current_files = [{'filename':x['filename'],'sha256':x['digests']['sha256'], 'upload_time':x['upload_time_iso_8601'],'size':x['size'],'yanked':x['yanked']} for x in current['urls']]
status = [{k:r[k] for k in ('label','url','checked_at_utc','http_status','sha256')} for r in records if r['label'] in ('pypi-1.101.0','pypi-1.101.0rc1','github-1.101.0','github-1.101.0rc1')]
dump('version-status.json', {'observations':status,'candidate_files':current_files,'candidate_filename_sha_map_unchanged':{x['filename']:x['sha256'] for x in current_files}=={x['filename']:x['sha256'] for x in old_files},'earlier_observation':'investigation/version-1.101/availability.json','formal_404_scope':'No record obtained at these exact endpoints at the recorded observation times; no claim about all historical availability.'})

source_index=[]
(OUT/'sources').mkdir(exist_ok=True)
def copy_source(label, input_path, url, first, last, expected_blob=None):
    data=input_path.read_bytes()
    blob=hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest()
    if expected_blob is not None and blob!=expected_blob:
        raise ValueError(f'Git blob mismatch for {label}: {blob} != {expected_blob}')
    output='sources/'+label+'.txt'
    (OUT/output).write_bytes(data)
    lines=data.decode().splitlines()
    entry={'path':output,'source_url':url,'input_path':str(input_path.relative_to(ROOT)),'bytes':len(data),'sha256':sha(data),'git_blob_sha1':blob,'expected_git_blob_sha1':expected_blob,'git_blob_verified':expected_blob is not None,'excerpt_start_line':first,'excerpt_end_line':last,'excerpt':'\n'.join(lines[first-1:last])}
    source_index.append(entry)
    return entry
head='ad4dff15f060201c0ca0efa97cc786a177de8902'
for label, repo_path, first,last in [('pr-31267-fixed-circleci','.circleci/config.yml',200,259),('pr-31267-fixed-pyproject','pyproject.toml',235,249)]:
    expected=next(x['sha'] for x in raw('pr-31267-files') if x['filename']==repo_path)
    copy_source(label,OUT/'.raw'/f'{label}.body',f'https://github.com/BerriAI/litellm/blob/{head}/{repo_path}',first,last,expected)
commit='eeb7732fc11fd47762ca84cc3fb7cc74235d7097'
expected=next(x['sha'] for x in read('investigation/version-1.101/artifacts/fixed-tree.json')['tree'] if x['path']=='.github/workflows/test-rust.yml')
copy_source('candidate-test-rust',ROOT/'investigation/version-1.101/release-context/local/blob-test-rust.yml.txt',f'https://github.com/BerriAI/litellm/blob/{commit}/.github/workflows/test-rust.yml',105,139,expected)
copy_source('maturin-1.9.4-cli',ROOT/'investigation/version-1.101/build/backend/1.9.4/src/main.rs.txt','https://github.com/PyO3/maturin/blob/52dc989a9b3f86ce040be9c9037ca34038367559/src/main.rs',362,385)
copy_source('maturin-1.15.0-generator',ROOT/'investigation/version-1.101/build/backend/1.15.0/src/module_writer/mod.rs.txt','https://files.pythonhosted.org/packages/b9/c8/22e5e21b2679c9bce6415ca578034ca2cc9316be0642ae21e051a2d5198c/maturin-1.15.0.tar.gz',531,542)
dump('public-commands.json',{'sources':source_index,'interpretation':{'observed_project_commands':['uv sync --frozen --group dev --python 3.11','uv build --wheel --out-dir dist','uv build --wheel --out-dir panic-dist --config-setting "maturin.build-args=--features panic-test,extension-module"'],'observed_release_command_for_audited_wheel':None,'observed_external_old_maturin_release_command':None,'observed_abi3_injection_command':None,'direct_cli_source':'maturin 1.9.4 Command::Build calls its own build context and build_wheels; this supports an external CLI explanation as a possibility, without demonstrating release use or compatibility with all newer project inputs.'}})

issue=raw('issue-31261'); pr=raw('pr-31267')
dump('discussion-index.json',{'issue':{k:issue.get(k) for k in ('number','html_url','title','created_at','updated_at','state','comments')},'issue_comments':[{k:c.get(k) for k in ('html_url','created_at','updated_at')}|{'author':c['user']['login']} for c in raw('issue-31261-comments')],'issue_timeline_event_count':len(raw('issue-31261-timeline')),'direct_pr':{k:pr.get(k) for k in ('number','html_url','title','merged_at','merge_commit_sha')}|{'head_sha':pr['head']['sha']},'pr_comments':[{k:c.get(k) for k in ('html_url','created_at','updated_at')}|{'author':c['user']['login']} for c in raw('pr-31267-comments')],'finding':'Historical platform-wheel availability discussion and public test build setup. No SHA-bound publication build command found in checked bodies, comments, directly related PR files or selected fixed scripts.'})

baseline=read('investigation/artifact-records/pypi-artifacts.json')
native=read('investigation/release-chain/native-fingerprints.json')
download=read('investigation/version-1.101/artifacts/download-summary.json')
commits={'1.99.0':'fa647f742d7baefe8eb1181899d9c81b41559772','1.100.0':'e4f25265704e2b2c6cf6e81be2e4c5cffff896f4','1.101.0rc1':commit}
matrix=[]
for version in commits:
    files=next(x['artifacts'] for x in baseline['versions'] if x['version']==version) if version!='1.101.0rc1' else download
    wheels=[]
    for f in files:
        if not f['filename'].endswith('.whl'): continue
        fingerprints=sorted({s for n in native if n['artifact']==f['filename'] for s in n['rust_version_paths']}) if version!='1.101.0rc1' else ['88d9e12ae178fab0fb5cc050a94da85685d449ea']
        wheels.append({'filename':f['filename'],'sha256':f['sha256'],'upload_time_utc':f.get('upload_time_iso_8601',f.get('upload_time')),'artifact_url':f['url'],'wheel_generator_self_report':'maturin (1.9.4)','rust_revision_embedded_self_report':fingerprints})
    matrix.append({'version':version,'reference_git_commit':commits[version],'reference_commit_is_cryptographically_bound_to_wheel_build':False,'source_build_requirement':'maturin==1.15.0' if version=='1.101.0rc1' else 'maturin==1.9.4','wheels_with_actual_hash_evidence':wheels,'actual_wheel_build_run':None,'abi_source_state':{'1.99.0':'Fixed Git bridge lacks abi3-py310; sdist adds it to pyo3 dependency features.','1.100.0':'Fixed Git and sdist omit explicit abi3-py310; wheels still cp310-abi3.','1.101.0rc1':'Default bridge feature abi3 enables pyo3/abi3-py310; tool.maturin enables extension-module.'}[version]})
release=read('investigation/version-1.101/release-context/release-summary.json')
public_run={k:release['public_run'][k] for k in ('id','html_url','head_sha','path','actor_login','triggering_actor_login','created_at','run_started_at','conclusion')}
dump('source-matrix.json',{'versions':matrix,'scope':'One actually audited 1.99 Linux x86_64 wheel, all seven audited 1.100 wheels, all seven audited rc1 wheels. Other 1.99 platform artifacts are outside this matrix.','public_github_release_run_rc1':public_run,'public_run_scope':'GitHub release creation; starts after PyPI uploads. No binding to an actual wheel build.','evidence_layers':{'wheel_hash':'Locally computed artifact SHA matches PyPI-listed SHA in prior audit; identifies bytes, not builder.','git_blob_hash':'Checks source bytes against a Git blob identifier, not wheel origin.','WHEEL_generator_and_rust_strings':'Artifact-contained self-reports; no cryptographic authentication of real tools.','trusted_publishing':'Observed PyPI upload authentication field; no wheel build inputs binding.','image_signatures':'Previously verified signed image digest and image provenance; subjects are images, not these PyPI wheels.'}})

inputs=['investigation/artifact-records/pypi-artifacts.json','investigation/abi-compatibility/git-vs-sdist-1.99.0-Cargo.json','investigation/release-chain/rust-compiler-revisions.json','investigation/version-1.101/artifacts/download-summary.json','investigation/version-1.101/artifacts/metadata-comparison.json','investigation/version-1.101/artifacts/wheel-audit-summary.json','investigation/version-1.101/build/wheel-generator-source.json','investigation/version-1.101/build/backend-extra-sources.json','investigation/version-1.101/build/backend-analysis.json','investigation/version-1.101/release-context/release-summary.json','investigation/version-1.101/release-context/workflow-summary.json']
dump('reused-evidence-index.json',[{'path':p,'bytes':len((ROOT/p).read_bytes()),'sha256':sha((ROOT/p).read_bytes())} for p in inputs])
dump('read-errors.json',{'http_observations':[{'label':r['label'],'url':r['url'],'http_status':r['http_status'],'error':r.get('error')} for r in records if r['http_status']!=200],'local_errors':[{'operation':'Lookup of investigation/version-1.101/release-context/workflows/*','error':'zsh: no matches found','effect':'No content read from that nonexistent directory. Located existing local/blob-test-rust.yml.txt by filename inventory; no network request retried.'}],'network_retries':0})
print(json.dumps({'records':len(records),'rc1_hashes_unchanged':{x['filename']:x['sha256'] for x in current_files}=={x['filename']:x['sha256'] for x in old_files},'matrix_wheels':[len(x['wheels_with_actual_hash_evidence']) for x in matrix],'fixed_sources':len(source_index)}))
