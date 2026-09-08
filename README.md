# LiteLLM integration supply-chain investigation

This investigation examines LiteLLM 1.100 artifacts, publishing, runtime behavior and supply-chain relationships. [YouDub-webui PR #130](https://github.com/liuzhao1225/YouDub-webui/pull/130) is the discovery point and one downstream case. The [complete report](REPORT.zh-CN.md) is maintained as one account, with findings revised and reordered as evidence changes. Collection date: **September 9, 2026**; individual records retain UTC timestamps.

**The investigation has not established poisoning of LiteLLM 1.100.0 or contributor participation in an attack.** Confirmed installation and testing concerns, conditional credential-routing risks, source matches and unresolved build-provenance gaps are documented together.

[完整调查报告](REPORT.zh-CN.md) · [Evidence index](investigation/README.md) · [49-PR index](PR-INDEX.md) · [Investigation responsibilities](INVESTIGATION-PLAN.zh-CN.md) · [Published notices](NOTICES.md)

## Specific concerns in YouDub #130

At fixed head [1add1b6d90795ddc222c3f5021305a2e8d953a17](https://github.com/liuzhao1225/YouDub-webui/commit/1add1b6d90795ddc222c3f5021305a2e8d953a17):

- Default requirements add `litellm>=1.89.0,<2.0.0` after removing the optional requirements file; the [PR description](https://github.com/liuzhao1225/YouDub-webui/pull/130) still describes an optional dependency.
- The range excludes the known malicious 1.82.7/1.82.8 versions but admits versions beyond the author's stated 1.99.0 tests, including 1.100.0. Resolution depends on the environment, index and other constraints.
- The [unit tests](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/tests/test_litellm_translate.py#L17), including the test named end-to-end, replace LiteLLM in `sys.modules`. They check adapter behavior. The author's separate claim of live endpoint tests has not been independently reproduced.
- Keeping a saved OpenAI key while switching only the model/provider can cause the adapter to pass that key explicitly to another provider. This conditional path follows the [settings code](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/database.py#L710) and LiteLLM's provider key precedence, which also exists in 1.99. Correctly replacing or clearing the key changes the result. No real credential leak has been demonstrated.

The [dependency and credential analysis](investigation/dependency-exposure/README.md) records activation conditions, counterexamples and test gaps. [Captured PR state](investigation/youdub-state.json): open and unmerged. This investigation has not changed #130's code or merged it.

## Historical attack and current artifacts

The [official March incident report](https://docs.litellm.ai/blog/security-update-march-2026) confirms malicious PyPI releases 1.82.7 and 1.82.8. Public accounts trace the incident through compromised Trivy scanning infrastructure and stolen publishing access. Version 1.82.8 included a Python-startup `.pth` payload; delaying the application import would not prevent that trigger after installation. The [historical account](REPORT.zh-CN.md) distinguishes confirmed payload behavior from qualified statements about the intrusion chain.

LiteLLM [1.100.0](https://pypi.org/project/litellm/1.100.0/) was uploaded September 6. Current checks cover:

| Evidence | Finding and limit |
| --- | --- |
| [Artifact inventories](investigation/artifact-records/README.md) | Ten archived files match PyPI hashes; eight wheels pass 27,165 file-hash checks. Internal consistency does not establish benign content. |
| [Source comparison](investigation/artifact-records/source-comparison.json) | Seven-platform Python content matches the fixed source after Windows CRLF normalization. Machine code requires separate analysis. |
| [Image signatures](updates/litellm-1.100-deep-audit-20260909.md) | Fixed-public-key verification succeeds for the 1.99/1.100 GHCR digests. This does not establish reproducible builds or PyPI publisher identity. |
| [Release-chain analysis](investigation/release-chain/README.md) | All eight 1.100 PyPI Integrity requests return no provenance available. Native compiler fingerprints differ by platform; generated JS feature changes map to fixed source, and 13 other modules match after binding-name normalization without changing import order. Full compiled equivalence and native build provenance remain open. |

## Contributor activity and downstream responses

The [located prodmanpd sample](PR-INDEX.md) contains 49 PRs across 49 projects: 22 with new Python SDK calls and 27 with proxy-compatible integration. The earliest located PR is [llm-for-zotero #316](https://github.com/yilewang/llm-for-zotero/pull/316), created July 17 at 18:49:48 UTC. The [Chartbrew reply](https://github.com/chartbrew/chartbrew/pull/365#issuecomment-5207856315) acknowledges cross-project integration work and describes support for existing gateways; it does not establish employment or sponsorship.

Of 20 explicit numeric dependency changes, all use an upper bound equivalent to `<2`, with eight spelling `<2.0.0`. [Narrower constraints](data/version-constraint-audit.json), [six specific lockfiles](data/lock-audit.json), and [OpenExecutive's 1.100 lock](updates/OpenExecutive-98.json) are material counterexamples to claims that every contribution always selects the newest package. Proxy-only clients do not automatically install the Python SDK.

An [additional account sample](OTHER-ACCOUNTS.zh-CN.md) documents RheagalFire's public integrations. Account-control relationships remain unproven. The [response timeline](investigation/contribution-followup/README.md) records 28 open, 17 merged and four closed PRs at its capture time. Webclaw's owner cited HTTP credential transport and missing CI when closing its PR; the relevant review predated our notices.

## Evidence and unresolved questions

The [evidence index](investigation/README.md) links exact revisions, source identities, hashes and collection limits. Full original collection and package archives are retained locally. Public records include 85 repository metadata records and 122 unique commit SHAs; inherited history and merge/squash duplication prevent treating that total as independent features.

Outstanding questions concern artifact-specific build origins, remaining generated/native behavior, complete environment-specific dependency resolution, actual credential transmission and attributable author explanations. Broad constraints, conventional test doubles and repeated integration work do not settle these questions.

Corrections and author explanations are welcome through issues with supporting sources. Private email content, secrets and nationality speculation are excluded from this record.

## Phishing notifications observed during the investigation

[Archived notification evidence](investigation/notification-analysis/README.md) documents 14 independently retrieved issues, 11 issue authors and four Pages entry points with identical decoded redirect code. Warnings to the two maintainers identified by the user were posted and read back. No control relationship with the LiteLLM contributors has been established. The original email and notification tokens are excluded from the public record.
