# Contribution states and maintainer responses

The captured discussion timeline contains two maintainer responses following our notices and one subsequent PR closure. No new response from `prodmanpd` appeared in the issue comments, submitted reviews, or inline review comments of the 49 previously catalogued PRs. All 49 current heads match the catalogue after applying the already-recorded [OpenExecutive #98 supplement](../../updates/OpenExecutive-98.json). All 49 fork branches still resolve to those heads. These observations cover **2026-09-08 19:47:36–19:48:08 UTC** (2026-09-09 03:47:36–03:48:08 in Asia/Shanghai), with follow-up branch and Webclaw checks performed immediately afterward. See the [49-PR snapshot](snapshot.json) and [machine-readable summary](summary.json).

## New maintainer responses

| PR | Observed response and state | Timeline |
| --- | --- | --- |
| [0xMassi/webclaw #123](https://github.com/0xMassi/webclaw/pull/123) | The repository owner said they reviewed the implementation and security discussion, declined to merge, and cited unresolved remote HTTP credential exposure and missing required CI runs. The PR is closed without merging. | [Our notice](https://github.com/0xMassi/webclaw/pull/123#issuecomment-5590740681): September 8, 19:35:39 UTC. [Owner reply](https://github.com/0xMassi/webclaw/pull/123#issuecomment-5590829715): 19:42:45 UTC. PR metadata `closed_at`: 19:42:52 UTC; the timeline closure event is timestamped 19:42:53 UTC. |
| [TIGER-AI-Lab/ClawBench #288](https://github.com/TIGER-AI-Lab/ClawBench/pull/288) | A collaborator acknowledged the notice, said the PR had already been closed as unnecessary, and said they would watch the pattern. | The PR was closed **August 30, 20:21:39 UTC**, before [our September 8, 19:34:22 UTC notice](https://github.com/TIGER-AI-Lab/ClawBench/pull/288#issuecomment-5590722797). The [new reply](https://github.com/TIGER-AI-Lab/ClawBench/pull/288#issuecomment-5590794523) arrived at 19:39:51 UTC. |

Webclaw's response explicitly mentions reviewing the security discussion. The available record does not isolate how much each consideration influenced the owner's decision. ClawBench's closure predates our notice by more than a week and must not be represented as a closure caused by this investigation. Current aggregate state is **28 open, 17 merged, and 4 closed without merging**. Individual metadata and source endpoints are recorded in the [snapshot](snapshot.json).

## Webclaw credential concern: code checked at the unchanged head

At head `345422db95377c8ee2a3ad46392419fd3c7e4d73`, [the LiteLLM wrapper](https://github.com/0xMassi/webclaw/blob/345422db95377c8ee2a3ad46392419fd3c7e4d73/crates/webclaw-llm/src/providers/litellm.rs#L25) reads its dedicated `LITELLM_API_KEY`, accepts `LITELLM_BASE_URL`, and passes both to the existing OpenAI transport. The default endpoint is local HTTP. The constructor permits a user-configured remote HTTP endpoint without enforcing HTTPS. [The reused transport](https://github.com/0xMassi/webclaw/blob/345422db95377c8ee2a3ad46392419fd3c7e4d73/crates/webclaw-llm/src/providers/openai.rs#L129) attaches the selected key as a bearer credential to completion requests. Static inspection therefore supports a conditional cleartext-transport concern when a user configures remote HTTP. No credential transmission or runtime reproduction was performed.

A [CodeRabbit security comment](https://github.com/0xMassi/webclaw/pull/123#discussion_r3896273905) had raised this issue on **August 31 at 16:16:41 UTC**, eight days before our notice. The current PR head still has the relevant behavior. The redirect concerns also mentioned by that review were not independently evaluated in this code review.

The [current head's check-runs endpoint](https://api.github.com/repos/0xMassi/webclaw/commits/345422db95377c8ee2a3ad46392419fd3c7e4d73/check-runs) returns zero check runs. Its [combined commit status](https://api.github.com/repos/0xMassi/webclaw/commits/345422db95377c8ee2a3ad46392419fd3c7e4d73/status) is successful with one CodeRabbit review status. This observation supplies no evidence that the project's required CI jobs ran; the owner's statement about required checks remains attributed to the owner because branch-protection requirements were not queried.

This [seven-file Rust proxy integration](https://github.com/0xMassi/webclaw/pull/123/files) adds no PyPI LiteLLM dependency. The inspected record does not establish a real credential leak, an attacker-controlled destination, malicious intent, or poisoning of LiteLLM 1.100.0. Additional source links and scope limits are in [webclaw-123.json](webclaw-123.json).

## Scope, unchanged observations, and limits

- Read the metadata, all paginated issue comments, submitted reviews, and inline review comments of all 49 PRs: 196 endpoint collections. Compared them to the existing archived responses and notice timestamps. Queried all 49 live fork branch references.
- No new PR-author reply or new affiliation disclosure appeared in these discussion surfaces. Silence is not evidence of motive or compromise.
- No head, PR title, PR body, or discussion-lock flag change was found after accounting for the already-recorded OpenExecutive update. No dependency/default-versus-optional change is established by this refresh.
- No previously archived discussion item was missing, and no previously archived discussion body or review state differed. This is a comparison of two retained snapshots, so a transient edit between them could be invisible.
- All 49 currently referenced branches were present at query time. This does not establish whether any branch was temporarily removed and restored between observations.
- The scope is the existing 49 PRs. New contributions elsewhere, deleted material absent from both snapshots, private activity, package artifacts, and runtime behavior were outside this refresh.
- Raw full API responses remain outside the public repository. Public snapshots preserve source URLs, public logins, timestamps, states, heads, counts, and hashes, with concise paraphrases of new replies. No private email or inferred nationality is included.
- This refresh performed no remote writes, installations, or execution of the contribution code.
