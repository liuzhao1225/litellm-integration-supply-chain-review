"""Static RECORD, path inventory, dependency and fixed Git/Python comparisons."""
import concurrent.futures, datetime, difflib, email.parser, hashlib, importlib.util, json, pathlib, re, sys, zipfile
sys.dont_write_bytecode=True
OUT=pathlib.Path(__file__).resolve().parent;INV=OUT.parent.parent
spec=importlib.util.spec_from_file_location('our_record_auditor',INV/'artifact-records/audit_wheel_records.py');audit=importlib.util.module_from_spec(spec);spec.loader.exec_module(audit)
BASE=pathlib.Path('/tmp/litellm-version-research-20260909/artifacts-1.100.0')
def sha(data):return hashlib.sha256(data).hexdigest()
def blob(data):return hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).hexdigest()

def inspect(item):
    path=OUT/'.inputs'/item['filename'];assert sha(path.read_bytes())==item['sha256']
    result=audit.audit(path);assert not result['internal_integrity_anomaly'],result
    oldpath=BASE/item['filename'].replace('1.101.0rc1','1.100.0')
    tree={x['path']:x['sha'] for x in json.loads((OUT/'fixed-tree.json').read_text())['tree'] if x['type']=='blob'}
    inventory=[];python=[];natives=[]
    with zipfile.ZipFile(path) as z,zipfile.ZipFile(oldpath) as old:
        newpy={n:z.read(n) for n in z.namelist() if n.endswith('.py')};oldpy={n:old.read(n) for n in old.namelist() if n.endswith('.py')}
        for info in z.infolist():
            if info.is_dir():continue
            data=z.read(info.filename);inventory.append(dict(path=info.filename,bytes=len(data),sha256=sha(data)))
            if re.search(r'\.(so(?:\.[0-9.]+)?|pyd|dylib|dll)$',info.filename):
                prior=old.read(info.filename) if info.filename in old.namelist() else None
                natives.append(dict(path=info.filename,bytes=len(data),sha256=sha(data),sha256_1_100=sha(prior) if prior is not None else None,same_as_1_100=prior==data,compiler_revisions=sorted(set(x.decode() for x in re.findall(rb'[/\\]rustc[/\\]([0-9a-f]{40})',data)))))
        for name,data in sorted(newpy.items()):
            expected=tree.get(name);exact=blob(data)==expected;normalized=blob(data.replace(b'\r\n',b'\n'))==expected
            previous=oldpy.get(name)
            python.append(dict(path=name,bytes=len(data),sha256=sha(data),git_blob_expected=expected,git_blob_actual=blob(data),exact_git_match=exact,git_match_after_crlf_normalization=normalized,accepted_git_match=exact or normalized,change_from_1_100='added' if previous is None else 'identical' if previous==data else 'newline_only' if previous.replace(b'\r\n',b'\n')==data.replace(b'\r\n',b'\n') else 'changed',sha256_1_100=sha(previous) if previous is not None else None))
        def metadata(archive):
            name=next(n for n in archive.namelist() if n.endswith('.dist-info/METADATA'));data=archive.read(name);message=email.parser.Parser().parsestr(data.decode())
            return dict(path=name,sha256=sha(data),requires_dist=message.get_all('Requires-Dist',[]),requires_python=message.get('Requires-Python'),version=message.get('Version'))
        newmeta=metadata(z);oldmeta=metadata(old)
        result.update(metadata=newmeta,requires_dist_added=sorted(set(newmeta['requires_dist'])-set(oldmeta['requires_dist'])),requires_dist_removed=sorted(set(oldmeta['requires_dist'])-set(newmeta['requires_dist'])),requires_python_before=oldmeta['requires_python'],python_file_count=len(python),python_exact_git_matches=sum(x['exact_git_match'] for x in python),python_normalized_git_matches=sum(x['git_match_after_crlf_normalization'] for x in python),python_accepted_git_matches=sum(x['accepted_git_match'] for x in python),python_git_mismatches=[x['path'] for x in python if not x['accepted_git_match']],python_added=[x['path'] for x in python if x['change_from_1_100']=='added'],python_changed=[x['path'] for x in python if x['change_from_1_100']=='changed'],python_removed=sorted(set(oldpy)-set(newpy)),native_members=natives,entry_points={n:z.read(n).decode() for n in z.namelist() if n.endswith('.dist-info/entry_points.txt')})
        if 'manylinux_2_28_x86_64' in path.name:
            dest=OUT/'python-diffs';dest.mkdir(exist_ok=True)
            for row in python:
                if row['change_from_1_100'] in ['added','changed']:
                    name=row['path'];text=''.join(difflib.unified_diff(oldpy.get(name,b'').decode().splitlines(True),newpy[name].decode().splitlines(True),fromfile='1.100.0/'+name,tofile='1.101.0rc1/'+name));(dest/(name.replace('/','__')+'.diff')).write_text(text)
    (OUT/(path.name+'.inventory.json')).write_text(json.dumps(inventory,indent=2)+'\n')
    (OUT/(path.name+'.python.json')).write_text(json.dumps(python,indent=2)+'\n')
    (OUT/(path.name+'.audit.json')).write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:result[k] for k in ['filename','verified_file_hashes','startup_hook_files','python_file_count','python_exact_git_matches','python_normalized_git_matches','python_git_mismatches','requires_dist_added','requires_dist_removed']}),flush=True)
    return result

def main():
    items=json.loads((OUT/'download-summary.json').read_text());first=next(x for x in items if 'manylinux_2_28_x86_64' in x['filename'])
    results=[inspect(first)]
    with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:results.extend(pool.map(inspect,[x for x in items if x!=first]))
    (OUT/'wheel-audit-summary.json').write_text(json.dumps(dict(checked_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),wheels=results),indent=2)+'\n')

if __name__=='__main__':main()
