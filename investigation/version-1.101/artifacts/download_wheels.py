"""Download PyPI wheels as inert data and check published SHA256; never install."""
import concurrent.futures, datetime, hashlib, json, pathlib, urllib.request, zipfile
OUT=pathlib.Path(__file__).resolve().parent

def fetch(item):
    path=OUT/'.inputs'/item['filename']
    with urllib.request.urlopen(item['url'],timeout=60) as response, path.open('wb') as output:
        while True:
            block=response.read(1024*1024)
            if not block:break
            output.write(block)
    sha=hashlib.sha256(path.read_bytes()).hexdigest()
    if sha!=item['sha256'] or path.stat().st_size!=item['size']:
        raise ValueError(f'PyPI hash or size mismatch: {item["filename"]}')
    result=dict(item,checked_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),actual_sha256=sha)
    (OUT/(item['filename']+'.download.json')).write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(dict(filename=item['filename'],sha256=sha,bytes=path.stat().st_size)),flush=True)
    return result

def main():
    (OUT/'.inputs').mkdir(exist_ok=True)
    available=json.loads((OUT.parent/'availability.json').read_text())
    files=next(x['files'] for x in available if x.get('version')=='1.101.0rc1')
    wheels=[x for x in files if x['filename'].endswith('.whl')]
    first=next(x for x in wheels if 'manylinux_2_28_x86_64' in x['filename'])
    results=[fetch(first)]
    with zipfile.ZipFile(OUT/'.inputs'/first['filename']) as archive:
        (OUT/'.inputs/native-linux-x86_64.so').write_bytes(archive.read('litellm/rust_bridge/_native.abi3.so'))
    with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:
        results.extend(pool.map(fetch,[x for x in wheels if x!=first]))
    (OUT/'download-summary.json').write_text(json.dumps(results,indent=2)+'\n')

if __name__=='__main__':main()
