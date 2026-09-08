"""Read selected TypeScript files at the fixed release commit and verify Git blob IDs."""
import concurrent.futures,datetime,hashlib,json,pathlib,urllib.parse,urllib.request
OUT=pathlib.Path(__file__).resolve().parent
BASE=pathlib.Path('/tmp/litellm-version-research-20260909')
COMMIT='e4f25265704e2b2c6cf6e81be2e4c5cffff896f4'
tree=json.loads((BASE/'tree-1.100.0.json').read_text())['tree']
selected=[]
for item in tree:
    n=item['path']
    if item['type']!='blob' or not n.endswith(('.ts','.tsx')) or '.test.' in n:continue
    if (n.endswith('/components/add_model/AddModelForm.tsx') or '/hooks/modelAccessGroups/' in n or '/models-and-endpoints/' in n and ('AccessGroupBudget' in n or n.endswith(('/page.tsx','/AllModelsTab.tsx','/AllModelsTable.tsx')))
        or n.endswith(('/mcp-servers/_components/ImportMCPServers.tsx','/mcp-servers/_components/importConnectorConfig.ts','/mcp-servers/_components/index.tsx','/mcp-servers/_components/mcp_servers.tsx','/mcp-servers/page.tsx','/components/networking.tsx','/models-and-endpoints/components/accessGroupBudgetPayload.ts','/lib/http/api.ts','/lib/http/client.ts','/components/model_info_view.tsx','/ModelSettingsModal/ModelSettingsModal.tsx','/panels/LlmCredentialsPanel.tsx','/panels/AllModelsPanel.tsx'))):selected.append(item)
(OUT/'upstream-ts').mkdir(exist_ok=True)
def fetch(item):
    url='https://raw.githubusercontent.com/BerriAI/litellm/'+COMMIT+'/'+urllib.parse.quote(item['path'])
    old=next((x for x in previous if x['path']==item['path'] and x['git_blob_sha1']==item['sha']),None)
    if old and (OUT/old['local_file']).is_file():return old
    with urllib.request.urlopen(url,timeout=30) as r:body=r.read()
    blob=hashlib.sha1(b'blob '+str(len(body)).encode()+b'\0'+body).hexdigest()
    assert blob==item['sha'],item['path']
    filename=item['path'].replace('/','__')
    (OUT/'upstream-ts'/filename).write_bytes(body)
    return {'path':item['path'],'commit':COMMIT,'git_blob_sha1':blob,'sha256':hashlib.sha256(body).hexdigest(),'source_url':url,'local_file':'upstream-ts/'+filename,'checked_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
previous=json.loads((OUT/'ts-source-inventory.json').read_text()) if (OUT/'ts-source-inventory.json').exists() else []
with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:records=list(executor.map(fetch,selected))
(OUT/'ts-source-inventory.json').write_text(json.dumps(records,indent=2))
print(json.dumps([x['path'] for x in records],indent=2))
