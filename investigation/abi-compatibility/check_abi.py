"""Static comparison of prior ELF evidence with fixed CPython ABI manifests.

Parses the specific simple function/data records needed here, retaining raw blocks.
Does not import, install, or execute target packages.
"""
import collections, datetime, hashlib, json, pathlib, re
ROOT=pathlib.Path(__file__).resolve().parent

def records(path, modern):
    lines=path.read_text().splitlines();result={};current=None
    header=re.compile(r'^\[(function|data)\.([^\]]+)\]$' if modern else r'^(function|data) (\S+)$')
    for number,line in enumerate(lines,1):
        match=header.match(line)
        if match:
            current=dict(kind=match[1],name=match[2],line=number,raw_lines=[line]);result[match[2]]=current
        elif line and not line[0].isspace() and not line.startswith('#'):
            current=None
        elif current is not None:
            current['raw_lines'].append(line)
    for value in result.values():
        block='\n'.join(value['raw_lines'])
        added=re.search(r"^\s+added\s*(?:=\s*['\"])?([0-9]+\.[0-9]+)",block,re.M)
        if added:value['added']=added[1]
        value['abi_only']=bool(re.search(r'^\s+abi_only(?:\s*=\s*true)?\s*$',block,re.M))
        value['conditions']=[line.strip() for line in value['raw_lines'] if re.match(r'\s+(?:ifdef|feature_macro|limited_api|windows|removed)',line)]
    return result

def main():
    old=records(ROOT/'v3.10.0/Misc/stable_abi.txt',False)
    new=records(ROOT/'v3.14.0/Misc/stable_abi.toml',True)
    refs={v:json.loads((ROOT.parent/'native-entry'/v/'elf.json').read_text()) for v in ['1.99.0','1.100.0']}
    names={v:{s['name']:s for s in r['dynsymbols'] if s['section']==0 and s['name'].startswith(('Py','_Py'))} for v,r in refs.items()}
    rows=[]
    for name in sorted(set(names['1.99.0'])|set(names['1.100.0'])):
        a,b=old.get(name),new.get(name)
        rows.append(dict(symbol=name,new_in_1_100=name not in names['1.99.0'],present_versions=[v for v in names if name in names[v]],elf_symbols={v:names[v][name] for v in names if name in names[v]},cpython_3_10=a,cpython_3_14=b,declared_since_at_most_3_10=bool(a and a.get('added') and tuple(map(int,a['added'].split('.')))<=(3,10)),manifests_agree_on_kind_since_and_abi_only=bool(a and b and all(a.get(k)==b.get(k) for k in ['kind','added','abi_only']))))
    output=dict(checked_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),method='ELF SHN_UNDEF symbols beginning Py or _Py; function/data records in pinned official manifests; no target execution',source_evidence=[dict(path=str((ROOT.parent/'native-entry'/v/'elf.json').relative_to(ROOT.parent)),sha256=hashlib.sha256((ROOT.parent/'native-entry'/v/'elf.json').read_bytes()).hexdigest(),wheel_sha256=refs[v]['wheel_sha256'],native_sha256=refs[v]['native_sha256']) for v in refs],counts={v:len(n) for v,n in names.items()},added_count=sum(r['new_in_1_100'] for r in rows),removed=sorted(set(names['1.99.0'])-set(names['1.100.0'])),unlisted_in_3_10=[r['symbol'] for r in rows if not r['cpython_3_10']],requires_after_3_10=[r['symbol'] for r in rows if r['cpython_3_10'] and not r['declared_since_at_most_3_10']],rows=rows)
    (ROOT/'symbol-audit.json').write_text(json.dumps(output,indent=2)+'\n')
    table=['| 新增符号 | 种类 | Stable ABI 起始版本 | ABI-only | 3.10 清单行 |','|---|---|---|---|---|']
    for row in rows:
        if row['new_in_1_100']:
            a=row['cpython_3_10'];table.append(f'| `{row["symbol"]}` | {a["kind"] if a else "unlisted"} | {a.get("added", "unknown") if a else "unknown"} | {a["abi_only"] if a else "unknown"} | {a["line"] if a else "unknown"} |')
    (ROOT/'added-symbols.md').write_text('\n'.join(table)+'\n')
    print(json.dumps({k:v for k,v in output.items() if k not in ['rows','source_evidence']},indent=2))
    print('agreement',sum(r['manifests_agree_on_kind_since_and_abi_only'] for r in rows),'/',len(rows))
    print('new kinds',dict(collections.Counter(r['cpython_3_10']['kind'] for r in rows if r['new_in_1_100'])))

if __name__=='__main__':main()
