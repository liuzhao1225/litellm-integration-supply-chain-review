import pathlib,json,zipfile
out=pathlib.Path(__file__).resolve().parent
wheel=pathlib.Path('/tmp/litellm-version-research-20260909/artifacts-1.100.0/litellm-1.100.0-cp310-abi3-macosx_10_12_x86_64.whl')
(out/'.js-inputs').mkdir(exist_ok=True)
records=[]
with zipfile.ZipFile(wheel) as z:
    for name in z.namelist():
        if not name.endswith('.js') or '/chunks/' not in name:continue
        target=out/'.js-inputs'/name.replace('/','__')
        target.write_bytes(z.read(name).replace(b'\r\n',b'\n'))
        records.append({'member':name,'local_file':str(target.relative_to(out))})
(out/'js-input-inventory.json').write_text(json.dumps(records,indent=2))
print('Static JS inputs:',len(records))
