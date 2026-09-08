import pathlib,zipfile,hashlib,json,re,collections
p=pathlib.Path('/tmp/litellm-version-research-20260909')
tree={x['path']:x['sha'] for x in json.loads((p/'tree-1.100.0.json').read_text())['tree'] if x['type']=='blob'}
out=[]
for f in sorted((p/'artifacts-1.100.0').glob('*.whl')):
    result={'artifact':f.name,'js_count':0,'js_git_match':0,'js_line_endings_only':0,'js_git_missing':[],'js_git_changed':[],'js_hashes':{},'hosts':[],'other_unexplained':[]}
    hosts=set()
    with zipfile.ZipFile(f) as z:
        for n in z.namelist():
            if not n.endswith('.js'):continue
            raw=z.read(n);norm=raw.replace(b'\r\n',b'\n')
            result['js_count']+=1
            h=lambda b:hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()
            if tree.get(n)==h(raw):result['js_git_match']+=1
            elif tree.get(n)==h(norm):result['js_line_endings_only']+=1
            elif n not in tree:result['js_git_missing'].append(n)
            else:result['js_git_changed'].append(n)
            result['js_hashes'][n]=hashlib.sha256(norm).hexdigest()
            hosts.update(s.decode() for s in re.findall(rb'https?://([a-zA-Z0-9.-]+)',norm))
        result['hosts']=sorted(hosts)
    out.append(result)
    print(json.dumps({k:v for k,v in result.items() if k not in ['js_hashes','hosts','js_git_missing','js_git_changed']}))
groups=collections.defaultdict(list)
for r in out:groups[hashlib.sha256(json.dumps(r['js_hashes'],sort_keys=True).encode()).hexdigest()].append(r['artifact'])
print('JS_VARIANT_GROUPS',list(groups.values()))
(p/'frontend-audit.json').write_text(json.dumps({'artifacts':out,'variant_groups':list(groups.values())},indent=2))
