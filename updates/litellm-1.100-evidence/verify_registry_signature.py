import json,pathlib,urllib.request,hashlib,base64,subprocess
p=pathlib.Path('/tmp/litellm-version-research-20260909/registry-signatures');p.mkdir(exist_ok=True)
repo='berriai/litellm'
token=json.load(urllib.request.urlopen('https://ghcr.io/token?service=ghcr.io&scope=repository:berriai/litellm:pull',timeout=30))['token']
headers={'Authorization':'Bearer '+token,'Accept':'application/vnd.oci.image.index.v1+json, application/vnd.docker.distribution.manifest.list.v2+json, application/vnd.oci.image.manifest.v1+json, application/vnd.docker.distribution.manifest.v2+json'}
def fetch(path):
    with urllib.request.urlopen(urllib.request.Request('https://ghcr.io/v2/'+repo+'/'+path,headers=headers),timeout=30) as r:
        return r.read(),dict(r.headers)
keyurl='https://raw.githubusercontent.com/BerriAI/litellm/0112e53046018d726492c814b3644b7d376029d0/cosign.pub'
key=urllib.request.urlopen(keyurl,timeout=30).read();(p/'cosign.pub').write_bytes(key)
results=[]
for version in ['1.99.0','1.100.0']:
    raw,head=fetch('manifests/v'+version);digest='sha256:'+hashlib.sha256(raw).hexdigest();manifest=json.loads(raw)
    (p/(version+'-index.json')).write_bytes(raw)
    sigtag=digest.replace(':','-')+'.sig';sigraw,_=fetch('manifests/'+sigtag);sigs=json.loads(sigraw);(p/(version+'-signature-manifest.json')).write_bytes(sigraw)
    signatures=[]
    for i,layer in enumerate(sigs['layers']):
        annotation=layer.get('annotations',{});signature=annotation.get('dev.cosignproject.cosign/signature')
        if not signature:raise ValueError('signature annotation missing')
        payload,_=fetch('blobs/'+layer['digest'])
        if 'sha256:'+hashlib.sha256(payload).hexdigest()!=layer['digest']:raise ValueError('payload digest mismatch')
        payloadfile=p/f'{version}-{i}-payload.json';payloadfile.write_bytes(payload)
        sigfile=p/f'{version}-{i}.sig';sigfile.write_bytes(base64.b64decode(signature))
        verify=subprocess.run(['openssl','dgst','-sha256','-verify',str(p/'cosign.pub'),'-signature',str(sigfile),str(payloadfile)],capture_output=True,text=True,check=True)
        claim=json.loads(payload)
        if claim['critical']['image']['docker-manifest-digest']!=digest:raise ValueError('signed image digest mismatch')
        signatures.append({'verified':verify.stdout.strip(),'signed_digest':digest,'payload':claim,'has_bundle':'dev.sigstore.cosign/bundle' in annotation})
    platforms=[]
    for entry in manifest.get('manifests',[]):
        if entry.get('platform',{}).get('os')=='unknown':continue
        body,_=fetch('manifests/'+entry['digest']);mm=json.loads(body)
        if 'sha256:'+hashlib.sha256(body).hexdigest()!=entry['digest']:raise ValueError('child manifest mismatch')
        cfg,_=fetch('blobs/'+mm['config']['digest'])
        if 'sha256:'+hashlib.sha256(cfg).hexdigest()!=mm['config']['digest']:raise ValueError('config mismatch')
        config=json.loads(cfg)
        platforms.append({'platform':entry.get('platform'),'digest':entry['digest'],'created':config.get('created'),'labels':config.get('config',{}).get('Labels',{})})
    results.append({'version':version,'digest':digest,'key_source':keyurl,'key_sha256':hashlib.sha256(key).hexdigest(),'signatures':signatures,'platforms':platforms})
    print(json.dumps(results[-1]),flush=True)
(p/'verification.json').write_text(json.dumps(results,indent=2))
