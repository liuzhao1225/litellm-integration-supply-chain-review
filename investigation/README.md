# Investigation evidence index

The [complete investigation report](../REPORT.zh-CN.md) examines LiteLLM artifacts, publishing, dependencies and runtime behavior, with [YouDub #130](https://github.com/liuzhao1225/YouDub-webui/pull/130) as the discovery point and a downstream case. This directory organizes the supporting evidence by subject. Collection times belong to individual observations; each subject report is maintained as one continuous analysis.

| Evidence subject | Materials | What they establish |
| --- | --- | --- |
| Starting PR | [Fixed PR state](youdub-state.json), [application and dependency analysis](dependency-exposure/README.md) | Installation paths, test boundaries and the conditions under which a saved provider key can be reused for another provider. No actual leak has been demonstrated. |
| Contribution network | [49-PR index](../PR-INDEX.md), [account comparison index](../OTHER-ACCOUNTS.zh-CN.md), [attribution analysis](identity-network/README.md), [version constraints](../data/version-constraint-audit.json), [lockfile audit](../data/lock-audit.json) | Located public activity and fixed-version counterexamples. Search coverage and account attribution remain explicit limitations. |
| Maintainer responses | [Discussion timeline](contribution-followup/README.md), [49-PR state snapshot](contribution-followup/snapshot.json), [Webclaw code review](contribution-followup/webclaw-123.json) | Attributed replies, closure times and a conditional HTTP credential transport issue. |
| Downloaded artifacts | [Archive and RECORD audit](artifact-records/README.md), [PyPI artifact identities](artifact-records/pypi-artifacts.json) | Ten preserved archives match index hashes; eight wheel inventories pass 27,165 file-hash checks. These checks do not certify benign behavior. |
| Source and release chain | [Build provenance, native and JS analysis](release-chain/README.md), [image signatures, frontend sources and SSO](../updates/litellm-1.100-deep-audit-20260909.md) | Artifact-specific observations, source comparisons, signature scope and remaining build-source gaps. |
| Runtime and dependencies | [Condition-by-condition analysis](dependency-exposure/README.md), [source identities](dependency-exposure/source-manifest.json), [reviewed sensitive operations](dependency-exposure/reviewed-candidates.json) | Fixed-source call paths, activation conditions, version differences and test limitations. |
| Notification phishing comparison | [Accounts and shared redirect source](identity-network/phishing-link/README.md), [timing and downstream comparison](notification-analysis/README.md) | A separate observed phishing cluster; no established connection to LiteLLM integration authors. |
| Investigation responsibilities | [Directions and evidence standards](../INVESTIGATION-PLAN.zh-CN.md) | Ownership of unresolved questions and the evidence needed to distinguish explanations. |

The investigation has not established malicious content in LiteLLM 1.100.0 or contributor participation in an attack. The March 2026 compromise is documented in the [complete report](../REPORT.zh-CN.md), with first-party sources and uncertainty retained.

The local YouDub virtual environment was inspected without importing packages and showed no LiteLLM-named installation entry. That observation covers one local environment. Global installations, containers and production were not checked. The investigation has made no code changes to #130 and has not merged it.

Raw API responses, public source snapshots and the ten downloaded package archives are retained in persistent local evidence storage. Published material is selected for technical relevance. Original hashes and capture times identify observations; they do not reconstruct omitted content or provide an independent trusted timestamp. No investigated package or container has been installed or executed.
