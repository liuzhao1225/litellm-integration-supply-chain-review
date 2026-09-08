# LiteLLM integration supply-chain review

Public technical review, snapshot **2026-09-09**. This record begins with [YouDub-webui PR #130](https://github.com/liuzhao1225/YouDub-webui/pull/130) and documents related integration proposals so maintainers can assess dependency and credential boundaries. It does **not establish malicious intent, participation in a compromise, or an undisclosed affiliation** by any contributor.

[Published notices](NOTICES.md) / [中文调查记录](REPORT.zh-CN.md) · [All 49 PRs and fixed revisions](PR-INDEX.md) · [Dependency constraints](data/version-constraint-audit.json) · [Lockfile checks](data/lock-audit.json)

## Confirmed upstream incident and recent release

LiteLLM's [official March 2026 incident update](https://docs.litellm.ai/blog/security-update-march-2026) documents compromised PyPI releases **1.82.7 and 1.82.8** on March 24. The malicious releases were removed. [Datadog's analysis](https://securitylabs.datadoghq.com/articles/litellm-compromised-pypi-teampcp-supply-chain-campaign/) describes a `.pth` execution path in 1.82.8: an application feature flag or delayed `import litellm` does not prevent this class of Python-startup payload once installed.

The latest stable release at collection is **1.100.0**, uploaded September 6, 2026: [PyPI](https://pypi.org/project/litellm/1.100.0/) / [upstream release](https://github.com/BerriAI/litellm/releases/tag/v1.100.0). The historical incident does not establish that this later version is compromised. A [static sample check](data/litellm-1.100.0-static-audit.json) found matching Python files and no historical indicators in one wheel; native binaries and transitive dependencies were not fully audited.

## Observable integration pattern and timeline

The [public PR search](https://github.com/search?q=is%3Apr+author%3Aprodmanpd&type=pullrequests) returned 49 PRs across 49 projects, all concerning LiteLLM integration. The [per-PR snapshots](data/prs.json) preserve GitHub creation times and head revisions. Search visibility is a limitation: this is not a lifetime history and excludes private, deleted, unreachable and unindexed activity.

The first observed PR was [llm-for-zotero #316](https://github.com/yilewang/llm-for-zotero/pull/316), created **2026-07-17 18:49:48 UTC / July 18 02:49:48 Beijing time**. Five PRs appeared within roughly 28 minutes, including [TinyTroupe #160](https://github.com/microsoft/TinyTroupe/pull/160), [docutranslate #53](https://github.com/xunbu/docutranslate/pull/53), [hacker-news-digest #47](https://github.com/polyrabbit/hacker-news-digest/pull/47), and [FunClip #178](https://github.com/modelscope/FunClip/pull/178).

The [author's Chartbrew reply](https://github.com/chartbrew/chartbrew/pull/365#issuecomment-5207856315) explicitly acknowledges submitting LiteLLM integrations across open-source projects and explains the intended benefit as supporting teams with existing model gateways. That reply does not establish compensation or affiliation. These are appropriate clarification questions, not findings.

The [49-PR index](PR-INDEX.md) distinguishes 22 PRs with new Python SDK calls from 27 with proxy-compatible integration. Proxy configuration alone does not install the PyPI SDK into the application. Of 20 PRs with explicit numeric dependency additions/changes, all use an upper limit equivalent to `<2`; 8 spell it `<2.0.0`. This is a common compatibility boundary and is insufficient evidence of malicious intent.

There are material counterexamples to broader claims: six PRs carry [specific locked versions with matching PyPI artifact URLs/hashes](data/lock-audit.json), and an [AI-Youtube-Shorts-Generator fork commit](https://github.com/prodmanpd/AI-Youtube-Shorts-Generator/commit/6bdf862985ea9bfad5cc4ddd14c89047067e12ce) uses a narrower `>=1.85,<1.96` constraint. Therefore, neither “every contribution uses <2” nor “every install selects the newest release” is supported.

## Specific concerns in YouDub #130

Review revision: [`1add1b6d90795ddc222c3f5021305a2e8d953a17`](https://github.com/liuzhao1225/YouDub-webui/commit/1add1b6d90795ddc222c3f5021305a2e8d953a17).

- The [dependency change](https://github.com/liuzhao1225/YouDub-webui/commit/1add1b6d90795ddc222c3f5021305a2e8d953a17) adds `litellm>=1.89.0,<2.0.0` to default requirements after the separate optional requirements file was removed. The [PR description](https://github.com/liuzhao1225/YouDub-webui/pull/130) still describes an optional dependency. Installation scope needs clarification.
- The range excludes the known compromised 1.82.7/1.82.8 releases, but permits later compatible 1.x releases beyond the author's stated 1.99.0 test version. Fresh resolution or an upgrade can select a later release depending on index availability, Python/platform and other constraints. An already-satisfied environment does not necessarily upgrade on every install.
- The [unit test helper](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/tests/test_litellm_translate.py#L17) creates a fake LiteLLM module and inserts it into `sys.modules`. The test named `test_translate_batch_routes_through_litellm_end_to_end` also uses that helper. This validates application wiring and response parsing, without exercising the real package. Mocking is conventional; passing these tests does not establish package compatibility or supply-chain safety.
- The author separately reports live tests against real endpoints in the PR description. This review has not independently reproduced those results. Request reproducible commands, exact package/artifact versions and an integration-test boundary alongside unit tests.

[Existing version-drift discussion](https://github.com/liuzhao1225/YouDub-webui/pull/130#issuecomment-5590586641) records the concern. #130 remains open pending clarification, without code modifications or merging by this review.

## Questions for authors and maintainers

Explain the intended use case and any affiliation, sponsorship or commissioned integration work relevant to this batch. Document whether the application installs a Python package or talks to an independently operated proxy; specify tested versions, artifact provenance and update review. For proxy integrations, document the operator trust boundary and ensure credentials for a different provider are not implicitly forwarded.

These questions apply to technical review. Neither a broad version range, a mock-based test, a recent release, nor repeated integration work proves an attack.

## Evidence scope and corrections

This repository preserves selected public technical facts, PR and commit references, exact revisions, file blob identifiers and hashes of collected diff text. It includes 85 repository metadata records and 122 unique commit SHA records; merge/squash duplication means this is not 122 independent features. Diff hashes do not reconstruct deleted content or provide independent trusted timestamps. Full raw collection is retained locally; this public repository is a curated record, not a full mirror of source code and discussions.

No private email contents, private contact details or nationality speculation belong in this record. Please provide corrections and author responses through an issue with a source. Keep discussion specific and respectful; do not harass contributors or repeat-post allegations.

## Follow-up observed during notification

[OpenExecutive #98](https://github.com/SenteLabsAI/OpenExecutive/pull/98) advanced to an upstream synchronization commit while notices were being prepared. Its optional extra remains in place, and the current lock fixes LiteLLM 1.100.0. All 8 LiteLLM artifact URLs/hashes match PyPI metadata. The [updated snapshot](updates/OpenExecutive-98.json) supplements the original six-lockfile baseline; the new lock is an additional reproducibility control.
