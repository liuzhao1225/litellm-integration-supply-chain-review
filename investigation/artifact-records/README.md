# Wheel inventory and artifact preservation

Checked September 8, 2026, 19:57–20:00 UTC. The seven LiteLLM 1.100.0 platform wheels and the 1.99.0 manylinux x86_64 comparison wheel have internally consistent file inventories. This check found no unexplained file, invalid recorded hash, archive path traversal, symlink or duplicate path. Results are in [wheel-records.json](wheel-records.json), produced by [audit_wheel_records.py](audit_wheel_records.py).

| Scope | Result |
| --- | --- |
| Wheels read | 7 for 1.100.0; 1 for 1.99.0 |
| Per-file hashes verified against each wheel's RECORD | 27,165 |
| Missing, unrecorded or incorrectly hashed payload files | 0 |
| Unexpected unhashed files | 0; each wheel's RECORD itself is unhashed |
| Duplicate archive/RECORD paths, unsafe archive paths, symlinks | 0 |
| `.pth`, `sitecustomize.py`, `usercustomize.py` files | 0 |

These results cover every file in these eight wheels, including compiled extensions and bundled frontend output. Matching RECORD entries establish internal consistency. They do not prove that those files are benign or were built from the published source. An attacker who controls a build can generate a matching RECORD. This check does not evaluate JavaScript semantics, compiled machine code, transitive packages, source-distribution build behavior or runtime activity.

Separately, ten preserved archives—the eight wheels above and one source distribution for each version—match the SHA-256 values returned by fresh [1.100.0 PyPI metadata](https://pypi.org/pypi/litellm/1.100.0/json) and [1.99.0 PyPI metadata](https://pypi.org/pypi/litellm/1.99.0/json) at September 8, 20:00 UTC. [pypi-artifacts.json](pypi-artifacts.json) records filenames, download URLs, hashes, sizes, upload times and yank state. The artifacts total 224,706,133 bytes. Copies are retained locally outside temporary storage and outside this Git repository; source and copy hashes were compared. Public metadata is a current observation, not an independent historical attestation.

The checker uses an isolated Python standard-library interpreter to read archives. It performs no extraction, installation or import of LiteLLM. Run it with paths to already-downloaded wheel directories:

```sh
python3 -I -S audit_wheel_records.py /path/to/artifacts-1.100.0 /path/to/artifacts-1.99.0 --output wheel-records.json
```

The source distributions are preserved and matched to PyPI here; they are outside the wheel RECORD check. The separate source/Git comparison and release-chain investigation have additional scope and limitations.

[Source comparison records](source-comparison.json) preserve the seven-wheel and source-distribution Python comparisons with fixed upstream commit `e4f25265704e2b2c6cf6e81be2e4c5cffff896f4`. Each contains 2,280 Python files; six wheels and the sdist match without normalization. The Windows wheel has 2,202 raw differences, all explained by CRLF normalization. The summary also retains Rust source counts and input-result hashes. Its collation timestamp does not replace the original observation times.
