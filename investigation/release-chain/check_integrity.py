"""Query public PEP 740 evidence for the eight already-hash-verified 1.100 artifacts."""
import concurrent.futures
import datetime
import json
import pathlib
import urllib.error
import urllib.request

OUT = pathlib.Path(__file__).resolve().parent
metadata = json.loads((OUT.parent / 'artifact-records/pypi-artifacts.json').read_text())
artifacts = next(x['artifacts'] for x in metadata['versions'] if x['version'] == '1.100.0')
assert len(artifacts) == 8

def query(artifact):
    url = 'https://pypi.org/integrity/litellm/1.100.0/' + artifact['filename'] + '/provenance'
    started = datetime.datetime.now(datetime.timezone.utc).isoformat()
    request = urllib.request.Request(url, headers={'Accept': 'application/vnd.pypi.integrity.v1+json'})
    try:
        with urllib.request.urlopen(request, timeout=30) as response:
            status, body = response.status, response.read().decode()
            headers = {k: v for k, v in response.headers.items() if k.lower() in ('date', 'content-type', 'etag')}
    except urllib.error.HTTPError as error:
        if error.code != 404:
            raise
        status, body = error.code, error.read().decode()
        headers = {k: v for k, v in error.headers.items() if k.lower() in ('date', 'content-type', 'etag')}
    result = {'filename': artifact['filename'], 'artifact_sha256': artifact['sha256'],
              'upload_time_utc': artifact['upload_time_iso_8601'], 'source_url': url,
              'checked_at_utc': started, 'http_status': status, 'headers': headers,
              'response': json.loads(body)}
    (OUT / 'integrity-responses').mkdir(exist_ok=True)
    (OUT / 'integrity-responses' / (artifact['filename'] + '.json')).write_text(json.dumps(result, indent=2))
    return result

with concurrent.futures.ThreadPoolExecutor(max_workers=4) as executor:
    results = list(executor.map(query, artifacts))
(OUT / 'integrity-all8.json').write_text(json.dumps(results, indent=2))
print(json.dumps([{'filename': x['filename'], 'status': x['http_status'], 'response': x['response']} for x in results], indent=2))
