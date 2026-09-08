import pathlib,json,hashlib,datetime,re,tomllib,subprocess
out=pathlib.Path(__file__).resolve().parent
sha=lambda b:hashlib.sha256(b).hexdigest()
a=json.loads((out/'archive-analysis.json').read_text());c=json.loads((out/'crate-analysis.json').read_text());r=json.loads((out/'reachability.json').read_text());p=json.loads((out/'public-source-check.json').read_text())
for v in ['1.99.0','1.100.0']:
 for f in a['controls'][v]:
  b=(out/'sources'/v/(f+'.txt')).read_bytes();source=next(x for x in a['inventory'][v]['members'] if x['path']==f);assert sha(b)==source['sha256']
for rec in c:
 assert sha((out/'.inputs'/f"{rec['name']}-{rec['version']}.crate").read_bytes())==rec['sha256']
 for f in rec['files']: assert sha((out/f['path']).read_bytes())==f['sha256']
for f in json.loads((out/'additional-source-members.json').read_text()):assert sha((out/f['path']).read_bytes())==f['sha256']
for f in json.loads((out/'backend-sources.json').read_text()):assert sha((out/f['path']).read_bytes())==f['sha256']
for f in a['artifacts']:
 pub=next(x for x in p['sdists'] if x['filename']==pathlib.Path(f['path']).name);assert f['bytes']==pub['size'] and f['sha256']==pub['sha256']
md=(out/'README.md').read_text()
for target in re.findall(r'\]\(([^)]+)\)',md):
 if target.startswith('https://') or target in ['publication-manifest.json','delivery.json']:continue
 assert (out/target.split('#')[0]).exists(),target
old=tomllib.loads((out/'sources/1.99.0/pyproject.toml.txt').read_text());new=tomllib.loads((out/'sources/1.100.0/pyproject.toml.txt').read_text());assert old['build-system']==new['build-system'] and old['tool']['maturin']==new['tool']['maturin']
assert len(c)==41 and len(r['new_build_scripts'])==9 and len(r['criterion_new'])==36
subprocess.run(['git','check-ignore','--quiet','investigation/build-time/.inputs/alloca-0.4.0.crate'],check=True,cwd=out.parents[1])
files=[{'path':str(f.relative_to(out)),'bytes':f.stat().st_size,'sha256':sha(f.read_bytes())} for f in sorted(out.rglob('*')) if f.is_file() and '.inputs' not in f.relative_to(out).parts and f.name not in ['publication-manifest.json','delivery.json']]
manifest={'scope':'Only investigation/build-time; no raw crate archives, binaries, secrets or other investigations. Manifest and delivery listed separately to avoid recursive hashing. No stage/commit/push performed.','files':files,'file_count':len(files),'bytes':sum(x['bytes'] for x in files)}
(out/'publication-manifest.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')
d={'completed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'report':'README.md','report_sha256':sha((out/'README.md').read_bytes()),'publication_manifest_sha256':sha((out/'publication-manifest.json').read_bytes()),'publishable_file_count':len(files),'publishable_bytes':manifest['bytes'],'checks':{'control_snapshots':14,'crate_archive_hash_matches':41,'crate_saved_members_hash_checked':True,'backend_fixed_commit_and_hash_checked':True,'readme_local_links_checked':True,'raw_archives_gitignored':True,'build_system_and_maturin_unchanged':True},'findings':{'cargo_packages':[258,295],'new_registry_packages':37,'removed_registry_packages':0,'existing_registry_records_changed':0,'new_normal_dependency':'pythonize 0.29.0; build=false, no build-dependencies, no proc-macro','new_dev_tree_packages':36,'new_dev_tree_build_scripts':9,'own_build_rs':'unchanged, macOS linker directives only'},'unknowns':['Original PyPI publication effective ABI3 feature/CLI/environment configuration','Actual source build executions and host configurations','Behavioral audit of all unchanged third-party build dependencies and proc-macros','Identity/equivalence of backend binaries actually used; conditional puccinialin version and execution'],'boundaries':['Archive/source reads only; no target installation, import, compilation or execution','No Cargo metadata/tree/build or PEP517 hook executed','No staging, commits, pushes or edits to other investigations'],'tool_errors':['Default python3 lacked tomllib; stopped at import, corrected explicitly to installed Python3.14 -I -S','Other investigation preserved selected pyo3 sources only; missing build source reads failed, then this investigation fetched matching official crate archives']}
(out/'delivery.json').write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n');print(json.dumps(d,ensure_ascii=False,indent=2))
