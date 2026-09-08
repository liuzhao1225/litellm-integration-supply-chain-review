"""Attach reviewed activation conditions to the existing 76 AST leads.

This is a triage record, not a behavioral test or a whole-package safety verdict.
Run with trusted Python 3.12+ -I -S. No investigated package is imported.
"""
import ast
import collections
import copy
import datetime
import json
from pathlib import Path

OUT = Path(__file__).resolve().parent
INPUT = json.loads((OUT / 'candidate-contexts.json').read_text())
OLD = Path('/tmp/litellm-version-research-20260909/wheel-python-1.99.0')
NEW = Path('/tmp/litellm-version-research-20260909/wheel-python-1.100.0')

GROUPS = [
    ('configuration_read', list(range(9))+[11,12,13,61,66,73,74],
     'Reads named settings for formatting, polling, tracing environment, database configuration, SMTP or realtime. No outbound request follows merely from this individual read. Activation is the enclosing feature; model-specific and Proxy paths are not YouDub translation entry points.'),
    ('local_processing', [15,16,17,18,19,20,21,22,23,67,72,75],
     'Local regex compilation, URL/query construction, synthetic HTTP error object, or decoding a fixed health-check image. re.compile is not Python code execution; httpx.Request/Response construction alone does not transmit.'),
    ('server_route_registration', [32,64,65,68,69,70,71],
     'FastAPI router.post registers a Proxy endpoint. It does not send an HTTP POST. Requires Proxy startup and a request to that endpoint; authorization correctness and downstream endpoint behavior need separate review.'),
    ('configured_callback_delivery', [10,14,63],
     'Actual outbound callback or alert delivery. Requires selected/configured alerting or logging and its destination/credentials. No enabling call in the fixed YouDub translation adapter. Defaults alone do not prove that another caller never configures it.'),
    ('mcp_transport_or_oauth', [9,33,34],
     'Requires an MCP client or configured Proxy MCP OAuth flow. Uses configured/discovered server or token URL and authentication. The YouDub adapter only calls completion with text messages; it provides no MCP server/tool configuration.'),
    ('provider_operation', [24,25,26,27,28,29,30,31],
     'Outbound request for an explicitly selected provider operation: rerank, video generation or skills API. These entry points are not invoked by the fixed YouDub text completion adapter. Provider-specific credentials and api_base are still a trust boundary.'),
    ('proxy_client_operation', list(range(35,61)),
     'Requires an explicit Proxy client/CLI method invocation with its configured base URL and credentials. YouDub uses litellm.completion rather than this Proxy management client. Most leads are timeout additions to an existing outbound call.'),
    ('guardrail_authentication', [62],
     'HiddenLayer guardrail authentication sends configured API ID/key to auth_url/oauth2/token. Requires configuring and using that guardrail. The changed call adds a timeout; no such guardrail is configured by the YouDub adapter.'),
]

NOTES = {
    9: 'Adds a credential_redirect_hook for a custom credential header slot. The hook removes that header on a cross-origin request; default Authorization handling is delegated to httpx. This is conditional code protection, not proof of complete redirect safety.',
    10: 'Existing queued destination/header delivery gains MS Teams payload formatting.',
    14: 'NewRelicMetricsLogger requires an explicit newrelic_api_key, chooses US/EU Metric API by region, and emits aggregated team/model/provider/status, cost/tokens/duration. This class does not resolve a provider key from environment. Other logging classes are outside this statement.',
    18: 'Creates an exception response object with a documentation URL; no client send call here.',
    19: 'Nested constructor within candidate 18; not a second outbound request.',
    20: 'Decodes TEST_IMAGE_BASE64 into a health-check image; candidate itself performs no exec/eval.',
    24: 'Bedrock rerank POST adds logging_obj; surrounding code refactors SigV4 header construction into get_request_headers with supports_bearer_token=False.',
    25: 'Async rerank POST adds logging_obj to the existing handler call.',
    26: 'Sync skill API multipart branch factors _prepare_skill_multipart_request before POST to the operation URL.',
    27: 'Video generation gains provider-directed multipart form serialization when no explicit files are present.',
    28: 'Async counterpart of candidate 26.',
    29: 'Async counterpart of candidate 27.',
    30: 'Together rerank changes a fixed together.xyz endpoint to _rerank_url(api_base); caller/global base or default api.together.ai now selects destination. Authorization carries selected Together API key.',
    31: 'Async counterpart of candidate 30.',
    33: 'OAuth token exchange POST supplies headers produced by the configured token authentication preparation.',
    34: 'OAuth client-credentials POST likewise adds prepared token authentication headers.',
    37: 'Proxy CLI login polling helper consolidates polling and timeout logic; URL/headers are arguments. A CLI login flow must invoke it.',
    63: 'Explicit Proxy health-service test sends a test alert to configured MS Teams webhook.',
}

def without_timeout(node):
    node = copy.deepcopy(node)
    node.keywords = [k for k in node.keywords if k.arg != 'timeout']
    return ast.dump(node, include_attributes=False)

records, counts = [], collections.Counter()
mapping = {i:(group,note) for group,ids,note in GROUPS for i in ids}
assert len(mapping)==76 and set(mapping)==set(range(76))
for r in INPUT['records']:
    group,note=mapping[r['id']]
    item={k:v for k,v in r.items() if k not in ['file_diff','context']}
    item.update(category=group,classification='fact: static call and activation conditions; inference: scoped reachability',
                activation_and_boundary=note,review_note=NOTES.get(r['id'],note),
                limitation='No runtime execution, no observed credential leak, no inference of intent. Dynamic/native/transitive behavior and other call paths remain outside this lead-level review.')
    if 35<=r['id']<=60 or r['id']==62:
        old_tree=ast.parse((OLD/r['file']).read_bytes())
        new_tree=ast.parse((NEW/r['file']).read_bytes())
        call=next(n for n in ast.walk(new_tree) if isinstance(n,ast.Call) and n.lineno==r['line'] and ast.unparse(n.func)==r['call'])
        item['old_call_lines_matching_after_removing_timeout']=[n.lineno for n in ast.walk(old_tree) if isinstance(n,ast.Call) and without_timeout(n)==without_timeout(call)]
    counts[group]+=1
    records.append(item)
(OUT/'reviewed-candidates.json').write_text(json.dumps({'reviewed_at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
    'input':'../runtime-paths/runtime-scan.json','scope':'Human triage of all 76 leads using public source contexts and selected diffs; no full call graph or behavior proof.',
    'counts':dict(counts),'records':records},ensure_ascii=False,indent=2)+'\n')
print(json.dumps(dict(counts)))
