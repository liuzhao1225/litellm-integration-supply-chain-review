"""Read public HTTPS sources once, recording failures without hidden retries."""
import datetime, hashlib, json, pathlib, urllib.error, urllib.request
OUT=pathlib.Path(__file__).resolve().parent

def fetch(label,url):
    raw=OUT/'.raw';raw.mkdir(exist_ok=True)
    record=dict(label=label,url=url,checked_at_utc=datetime.datetime.now(datetime.timezone.utc).isoformat())
    request=urllib.request.Request(url,headers={'Accept':'application/vnd.github+json','User-Agent':'Static-source-review'})
    try:
        with urllib.request.urlopen(request,timeout=40) as response:
            data=response.read();record.update(http_status=response.status,headers=dict(response.headers))
    except urllib.error.HTTPError as error:
        data=error.read();record.update(http_status=error.code,error=str(error),headers=dict(error.headers))
    except Exception as error:
        record.update(http_status=None,error_type=type(error).__name__,error=str(error));data=b''
    path=raw/(label+'.body');path.write_bytes(data)
    record.update(raw_path=str(path.relative_to(OUT)),bytes=len(data),sha256=hashlib.sha256(data).hexdigest())
    (raw/(label+'.record.json')).write_text(json.dumps(record,indent=2)+'\n')
    return record,data

if __name__=='__main__':
    import sys
    record,data=fetch(sys.argv[1],sys.argv[2]);print(json.dumps(record,indent=2));print(data.decode(errors='replace')[:18000])
