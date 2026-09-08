import pathlib,json,hashlib,re,datetime,subprocess,tomllib
out=pathlib.Path(__file__).resolve().parent;sha=lambda b:hashlib.sha256(b).hexdigest()
a=json.loads((out/'sdist-analysis.json').read_text());c=json.loads((out/'crate-analysis.json').read_text());g=json.loads((out/'git-comparison.json').read_text());backend=json.loads((out/'backend-analysis.json').read_text())
assert len(c)==26 and len(g['files'])==28 and sum(f['identical'] for f in g['files'])==25
for r in c:
 assert sha((out/'.inputs'/f"{r['name']}-{r['version']}.crate").read_bytes())==r['sha256']
 for f in r['files']:assert sha((out/f['path']).read_bytes())==f['sha256']
for f in backend['files']:assert sha((out/f['path']).read_bytes())==f['sha256']
assert sha((out/'.inputs/maturin-1.15.0.tar.gz').read_bytes())==backend['archive_sha256']
for r in json.loads((out/'backend-extra-sources.json').read_text()):
 if 'path' in r:assert sha((out/r['path']).read_bytes())==r['sha256']
for r in json.loads((out/'rustc-version-source.json').read_text())['files']:assert sha((out/r['path']).read_bytes())==r['sha256']
for r in json.loads((out/'wheel-generator-source.json').read_text())['files']:assert sha((out/r['path']).read_bytes())==r['sha256']
for v in a['inventory']:
 for f in a['controls'][v]:
  entry=next(x for x in a['inventory'][v]['files'] if x['path']==f);assert sha((out/'sources'/v/(f+'.txt')).read_bytes())==entry['sha256']
for f in g['files']:
 assert sha((out/'git-sources'/(f['path']+'.txt')).read_bytes())==f['git_sha256']
 assert sha((out/'sources/1.101.0rc1'/(f['path']+'.txt')).read_bytes())==f['sdist_sha256']
for link in re.findall(r'\]\(([^)]+)\)',(out/'README.md').read_text()):
 if link.startswith('https://') or link in ['publication-manifest.json','delivery.json']:continue
 assert (out/link).exists(),link
candidate=tomllib.loads((out/'sources/1.101.0rc1/pyproject.toml.txt').read_text());assert 'pgo-command' not in candidate['tool']['maturin']
assert tomllib.loads((out/'backend/1.15.0/Cargo.toml.txt').read_text())['package']['version']=='1.15.0'
subprocess.run(['git','check-ignore','--quiet','investigation/version-1.101/build/.inputs/litellm-1.101.0rc1.tar.gz'],cwd=out.parents[2],check=True)
files=[{'path':str(p.relative_to(out)),'bytes':p.stat().st_size,'sha256':sha(p.read_bytes())} for p in sorted(out.rglob('*')) if p.is_file() and '.inputs' not in p.relative_to(out).parts and p.name not in ['publication-manifest.json','delivery.json']]
manifest={'scope':'Only investigation/version-1.101/build; textual evidence and analysis. Raw archives under .inputs excluded. Manifest and delivery listed separately to avoid recursive hashes. No stage/commit/push.','files':files,'file_count':len(files),'bytes':sum(p['bytes'] for p in files)}
(out/'publication-manifest.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')
d={'completed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'report_sha256':sha((out/'README.md').read_bytes()),'manifest_sha256':sha((out/'publication-manifest.json').read_bytes()),'publishable_files':len(files),'publishable_bytes':manifest['bytes'],'candidate':'1.101.0rc1','candidate_sdist_sha256':a['candidate']['sha256'],'git_commit':g['commit'],'checks':{'crate_archives_matching_lock':27,'git_files_compared':28,'git_byte_identical':25,'all_recorded_snapshot_hashes_checked':True,'readme_links_checked':True,'raw_archive_gitignore_checked':True,'candidate_pgo_command_absent':True},'findings':{'maturin':['1.9.4','1.15.0'],'pyo3':['0.29.0','0.29.2'],'cargo_packages':[295,313],'new_registry_names':16,'upgraded_pyo3_crates':5,'new_local_crates':2,'own_build_rs_unchanged':True,'abi3':'candidate default abi3 -> pyo3/abi3-py310, explicit maturin extension-module','new_build_script_crates':['mime_guess 2.0.5 normal multipart dependency','rstest_macros 0.26.1 development dependency'],'pgo':'New backend can install instrumentation dependencies and execute shell command only when enabled plus nonempty pgo-command; absent from candidate config','wheel_generator':'All 7 wheels self-report maturin1.9.4 per reused artifact evidence. Source build requirement1.15.0; source Generator uses compiled CARGO_PKG_VERSION; original publication command missing.'},'limits':['No installation/import/compilation/execution of any target, Cargo resolver, test or PEP517 hook','No full runtime/whole-backend dependency audit or binary-to-source equivalence proof','No wheels downloaded by this task','No staging, commit, push, old-report or root-file edits','Formal1.101.0 unavailable in input snapshot; conclusions apply to rc1'],'tool_errors':['Backend old src/build_context.rs absent in1.15; assertion stopped, corrected to observed split paths using same archive','One helper rg glob typo rejected by zsh, corrected to concrete source paths','Initial old-crate cache path one level too high, causing five baseline crate downloads from official source; hashes verified and script path corrected']}
(out/'delivery.json').write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n');print(json.dumps(d,ensure_ascii=False,indent=2))
