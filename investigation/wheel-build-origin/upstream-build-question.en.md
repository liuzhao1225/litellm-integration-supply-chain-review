Title: Build provenance clarification for LiteLLM 1.99.0, 1.100.0 and 1.101.0rc1 wheels

We are reviewing the build origin of the published native wheels. Could you share the original build record or provenance that binds the following PyPI wheel SHA-256 values to their actual source checkout, build commands, effective Cargo features, maturin binary/version, Rust toolchain and build environment?

| Wheel | SHA-256 |
| --- | --- |
| litellm-1.99.0-cp310-abi3-manylinux_2_28_x86_64.whl | `1c45097e426fed2ae7fbd38b5404c3addeb203d0e1148c0a59848aabd5fe83c6` |
| litellm-1.100.0-cp310-abi3-manylinux_2_28_x86_64.whl | `8224c8eed9cab3319a88e6665d1275ad8faf21d353b1b22223a6d6115a302ea2` |
| litellm-1.101.0rc1-cp310-abi3-manylinux_2_28_x86_64.whl | `38273b92727303fd6e759fa9306b47c43e52a57c3ce583b239457c7dd5b8e598` |

We found three details that this record would help explain:

1. The [1.99 reference Git bridge manifest](https://github.com/BerriAI/litellm/blob/fa647f742d7baefe8eb1181899d9c81b41559772/litellm-rust/crates/python-bridge/Cargo.toml) lists `extension-module` for pyo3, while the published sdist adds `abi3-py310`. Was that change an intentional packaging preparation step?
2. The [1.100 reference manifest](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm-rust/crates/python-bridge/Cargo.toml) and published sdist do not explicitly enable `abi3-py310`; the published wheels are tagged `cp310-abi3`. Which effective build parameter or source preparation enabled ABI3?
3. The [1.101.0rc1 reference pyproject](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/pyproject.toml) and sdist require `maturin==1.15.0`, while all seven published wheels contain `Generator: maturin (1.9.4)`. Was an externally installed 1.9.4 CLI intentionally used, or is there another explanation for that field?

We read [#31261](https://github.com/BerriAI/litellm/issues/31261), the directly linked [#31267](https://github.com/BerriAI/litellm/pull/31267), its fixed Windows `uv build` test configuration, and the candidate's public Rust wheel test workflow. These clarify historical platform support and test builds; we could not connect them to the published wheel hashes. The public candidate GitHub release creation run also starts after the PyPI uploads.

These observations do not establish compromise. An intentional external build setup could explain the differences. A hash-bound build record would allow us to distinguish the declared source configuration from the inputs actually used to produce the published wheels. A public, appropriately redacted record is sufficient; please omit secrets and credentials.
