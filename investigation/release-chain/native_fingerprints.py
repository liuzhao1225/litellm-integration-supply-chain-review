"""Static format headers/imports with pre-existing Apple LLVM; never load a library."""
import datetime, hashlib, json, pathlib, re, subprocess, zipfile

OUT = pathlib.Path(__file__).resolve().parent
INPUT = pathlib.Path('/tmp/litellm-version-research-20260909')
SCRATCH = OUT / '.native-inputs'
SCRATCH.mkdir(exist_ok=True)
(OUT / 'native-headers').mkdir(exist_ok=True)
meta = json.loads((OUT.parent / 'artifact-records/pypi-artifacts.json').read_text())
records = []
for version in meta['versions']:
    for artifact in version['artifacts']:
        if not artifact['filename'].endswith('.whl'):
            continue
        wheel = INPUT / ('artifacts-' + version['version']) / artifact['filename']
        with zipfile.ZipFile(wheel) as archive:
            for name in archive.namelist():
                if not re.search(r'\.(so(?:\.[\d.]+)?|pyd|dll|dylib)$', name):
                    continue
                body = archive.read(name)
                label = artifact['filename'] + '--' + pathlib.Path(name).name
                local = SCRATCH / label
                local.write_bytes(body)
                result = {'version': version['version'], 'artifact': artifact['filename'],
                          'artifact_sha256': artifact['sha256'], 'member': name,
                          'member_sha256': hashlib.sha256(body).hexdigest(), 'bytes': len(body),
                          'checked_at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
                          'format': 'ELF' if body.startswith(b'\x7fELF') else 'PE' if body.startswith(b'MZ') else 'Mach-O'}
                header = subprocess.run(['/usr/bin/objdump', '-p', '-h', str(local)], check=True, capture_output=True, text=True).stdout
                (OUT / 'native-headers' / (label + '.headers.txt')).write_text(header.replace(str(local), '<native-member>'))
                result['header_file'] = 'native-headers/' + label + '.headers.txt'
                if result['format'] in ('ELF', 'Mach-O'):
                    cmd = ['/usr/bin/nm'] + (['-D'] if result['format'] == 'ELF' else []) + ['-u', str(local)]
                    symbols = subprocess.run(cmd, check=True, capture_output=True, text=True).stdout
                    result['undefined_symbols'] = sorted(set(line.split()[-1] for line in symbols.splitlines() if line.strip()))
                else:
                    result['undefined_symbols'] = []
                printable = re.findall(rb'[\x20-\x7e]{8,}', body)
                fingerprints = []
                for raw in printable:
                    text = raw.decode()
                    if any(x in text for x in ['rustc version', 'clang version', 'GCC:', 'rustc/']):
                        fingerprints.append(text[:700])
                result['compiler_fingerprints'] = sorted(set(fingerprints))[:30]
                result['rust_version_paths'] = sorted(set(x.decode() for x in re.findall(rb'(?:[/\\]rustc[/\\])([0-9a-f]{40})', body)))
                result['rust_crate_paths'] = sorted(set(x.decode() for x in re.findall(rb'[/\\]([a-z][a-z0-9_-]+-[0-9]+\.[0-9]+\.[0-9]+)[/\\](?:src|include)[/\\]', body)))
                records.append(result)
                print(json.dumps({k: result[k] for k in ['version', 'artifact', 'member', 'format', 'bytes', 'rust_version_paths']}), flush=True)
                local.unlink()
(OUT / 'native-fingerprints.json').write_text(json.dumps(records, indent=2))
print('native_members', len(records))
