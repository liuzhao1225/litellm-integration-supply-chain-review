"""Read OCI metadata and verify fixed-key signatures; never pull or run layers."""
import base64
import datetime
import hashlib
import json
from pathlib import Path
import subprocess
import urllib.request

ROOT = Path(__file__).resolve().parent
RAW = ROOT / '.raw'
RAW.mkdir(exist_ok=True)
KEY_URL = 'https://raw.githubusercontent.com/BerriAI/litellm/0112e53046018d726492c814b3644b7d376029d0/cosign.pub'
KEY_SHA = 'ff8869bf14ba9d10af7b64b9d479543b44daec0165e715753c43ff8a998f6dd3'
BASE = 'https://ghcr.io/v2/berriai/litellm/'
TAG = 'v1.101.0-rc.1'


def sha(body):
    return hashlib.sha256(body).hexdigest()


def fetch(url, headers=None):
    started = datetime.datetime.now(datetime.timezone.utc).isoformat()
    with urllib.request.urlopen(urllib.request.Request(url, headers=headers or {}), timeout=30) as response:
        body = response.read(2_000_001)
        if len(body) > 2_000_000:
            raise ValueError('Expected bounded metadata, not image contents')
        meta = {'url': url, 'started_at_utc': started, 'http_status': response.status,
                'response_date': response.headers.get('Date'), 'bytes': len(body), 'sha256': sha(body)}
    return body, meta


def save(name, body):
    (RAW / name).write_bytes(body)


def main():
    key, key_meta = fetch(KEY_URL)
    assert sha(key) == KEY_SHA
    save('cosign.pub', key)
    token_body, _ = fetch('https://ghcr.io/token?service=ghcr.io&scope=repository:berriai/litellm:pull')
    token = json.loads(token_body)['token']
    headers = {'Authorization': 'Bearer ' + token,
               'Accept': 'application/vnd.oci.image.index.v1+json, application/vnd.oci.image.manifest.v1+json, application/vnd.docker.distribution.manifest.v2+json'}

    def record(path, name, expected=None):
        body, meta = fetch(BASE + path, headers)
        if expected is not None:
            assert 'sha256:' + sha(body) == expected, path
        save(name, body)
        return json.loads(body), meta

    index, index_meta = record('manifests/' + TAG, 'index.json')
    digest = 'sha256:' + index_meta['sha256']
    signatures_manifest, sig_meta = record('manifests/' + digest.replace(':', '-') + '.sig', 'signature-manifest.json')
    signatures = []
    for n, layer in enumerate(signatures_manifest['layers']):
        assert layer['size'] < 2_000_000
        annotations = layer.get('annotations', {})
        signature = base64.b64decode(annotations['dev.cosignproject.cosign/signature'], validate=True)
        save(f'{n}.sig', signature)
        payload, payload_meta = record('blobs/' + layer['digest'], f'{n}-payload.json', layer['digest'])
        assert payload['critical']['image']['docker-manifest-digest'] == digest
        assert payload['critical']['identity']['docker-reference'] == 'ghcr.io/berriai/litellm'
        command = ['openssl', 'dgst', '-sha256', '-verify', str(RAW / 'cosign.pub'),
                   '-signature', str(RAW / f'{n}.sig'), str(RAW / f'{n}-payload.json')]
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        signatures.append({'verified': result.stdout.strip(), 'signed_digest': digest,
                           'payload': payload, 'source': payload_meta, 'signature_base64': base64.b64encode(signature).decode(),
                           'has_bundle': 'dev.sigstore.cosign/bundle' in annotations,
                           'bundle_or_transparency_log_verified': False})
    assert signatures
    platforms = []
    attestations = []
    for entry in index['manifests']:
        annotations = entry.get('annotations', {})
        child, child_meta = record('manifests/' + entry['digest'], entry['digest'][7:] + '-manifest.json', entry['digest'])
        if annotations.get('vnd.docker.reference.type') == 'attestation-manifest':
            for layer in child['layers']:
                assert layer['mediaType'] == 'application/vnd.in-toto+json'
                assert layer['size'] < 2_000_000
                statement, statement_meta = record('blobs/' + layer['digest'], layer['digest'][7:] + '-statement.json', layer['digest'])
                target = annotations['vnd.docker.reference.digest']
                assert any(s.get('digest', {}).get('sha256') == target[7:] for s in statement['subject'])
                pred = statement['predicate']
                definition = pred['buildDefinition']
                internal = definition['internalParameters']
                metadata = pred['runDetails']['metadata']
                event = internal.get('github_event_payload', {})
                attestations.append({'signed_index_digest': digest, 'target_manifest_digest': target,
                    'attestation_manifest_digest': entry['digest'], 'manifest_source': child_meta,
                    'statement_digest': layer['digest'], 'statement_source': statement_meta,
                    'hash_chain_verified': True, 'predicate_type': statement['predicateType'],
                    'build_type': definition['buildType'], 'builder_id': pred['runDetails']['builder'].get('id'),
                    'workflow_ref_claim': internal.get('github_workflow_ref'), 'workflow_sha_claim': internal.get('github_workflow_sha'),
                    'actor_claim': internal.get('github_actor'), 'event_claim': internal.get('github_event_name'),
                    'inputs_claim': event.get('inputs'), 'vcs_claim': metadata.get('buildkit_metadata', {}).get('vcs'),
                    'started_on_claim': metadata.get('startedOn'), 'finished_on_claim': metadata.get('finishedOn'),
                    'completeness': metadata.get('buildkit_completeness'),
                    'resolved_dependencies': definition.get('resolvedDependencies'),
                    'local_contexts': definition.get('externalParameters', {}).get('request', {}).get('locals')})
        else:
            cfg = child['config']
            assert cfg['size'] < 2_000_000
            config, config_meta = record('blobs/' + cfg['digest'], cfg['digest'][7:] + '-config.json', cfg['digest'])
            labels = config.get('config', {}).get('Labels', {})
            platforms.append({'platform': entry.get('platform'), 'digest': entry['digest'],
                'manifest_source': child_meta, 'config_source': config_meta, 'created_claim': config.get('created'),
                'source_claim': labels.get('org.opencontainers.image.source'),
                'revision_claim': labels.get('org.opencontainers.image.revision')})
    output = {'tag': TAG, 'index_source': index_meta, 'digest': digest, 'key_source': key_meta,
              'signatures_manifest_source': sig_meta, 'signatures': signatures,
              'platforms': platforms, 'attestations': attestations,
              'limits': ['No image filesystem layers fetched or executed.',
                         'Publisher statements are hash-bound to the signed index; underlying CI execution is not independently verified.',
                         'The fixed key verifies signed bytes, not actual operator identity or absence of compromise.',
                         'No transparency log or certificate identity verification performed.']}
    (ROOT / 'verification.json').write_text(json.dumps(output, indent=2) + '\n')
    print(json.dumps({'digest': digest, 'verified_signatures': len(signatures), 'platforms': len(platforms),
                      'attestations': len(attestations), 'builder_ids': [a['builder_id'] for a in attestations],
                      'inputs_claim': [a['inputs_claim'] for a in attestations]}, indent=2))


if __name__ == '__main__':
    main()
