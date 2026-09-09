# LiteLLM 历史攻击说法核验

2026-09-09 核验结果：**LiteLLM 的具体入口有较强公开证据支持 CircleCI 中通过 apt 安装的未固定版本 Trivy scanner；“Trivy GitHub Action 直接进入 LiteLLM”缺少对应证据。历史下载统计应采用 PyPI 4 月 2 日报告的超过 11.9 万次、暴露 2 小时 32 分钟，同时保留早期 46,996 次/46 分钟统计的来源与冲突。** 以下均针对 2026 年 3 月的恶意 1.82.7/1.82.8，不能据此定性 1.100 或 1.101 候选版。

## CI 入口：三层证据对账

| 一手来源 | 可确认内容 | 边界 |
| --- | --- | --- |
| [3/24 维护者评论](https://github.com/BerriAI/litellm/issues/24518#issuecomment-4119972374) | `krrish-berri-2` 明确称 Trivy 事件导致 CircleCI 凭据泄漏，包括 PyPI publish token 和 GitHub PAT。评论创建 17:16:19 UTC，编辑 17:20:39 UTC | 评论未指定 apt 或 GitHub Action |
| [3/27 LiteLLM 官方 Townhall](https://docs.litellm.ai/blog/security-townhall-updates#how-did-this-happen) | 共用 CircleCI 环境、静态发布密钥、未固定的 Trivy package 在扫描时访问环境凭据 | 官方仍以当前理解描述归因，未提供完整被入侵运行日志 |
| [3/24 JFrog 原始技术分析](https://research.jfrog.com/post/litellm-compromised-teampcp/)及其固定源码链接 | [CircleCI 第719—720行](https://github.com/BerriAI/litellm/blob/9343aeefca37aa49a6ea54397d7615adae5c72c9/.circleci/config.yml#L719)调用扫描脚本；[脚本第18行](https://github.com/BerriAI/litellm/blob/9343aeefca37aa49a6ea54397d7615adae5c72c9/ci_cd/security_scans.sh#L18)运行 `sudo apt-get install trivy`，第246行调用安装函数 | 固定源码证明配置路径；本次未独立核验事故运行拿到的 scanner 哈希 |

[LiteLLM 官方事件页](https://docs.litellm.ai/blog/security-update-march-2026)目前仍将来源表述为 CI/CD 中的 Trivy 扫描依赖，并保留调查措辞。综合上述材料，推荐表述为：**“根据维护者说明及固定 CI 配置，LiteLLM 在 CircleCI 的扫描步骤通过 apt 安装未固定版本的 Trivy；被污染的扫描器被认为窃取了可访问的发布凭据。”** [结构化结论](claims.json)、[固定代码行号与完整源文件 SHA](fixed-source-excerpts.json)。

[Trivy 官方 #10462](https://github.com/aquasecurity/trivy/discussions/10462)确为 `itaysk` 于 **2026-03-30 15:12:53 UTC** 发表的结案说明。它将 Trivy 自身最初入口定位到 `pull_request_target`，描述跨账号凭据残留和 3/19 借 GitHub Actions release workflow 构建恶意 Trivy。Aqua 的[持续更新页](https://www.aquasec.com/blog/trivy-supply-chain-attack-what-you-need-to-know/)还列出 `trivy-action`、`setup-trivy` 标签被改写。**整场攻击确实涉及 GitHub Actions；这些记录未认定 LiteLLM 是通过该 Action 接入。** #10462 创建时间已从 HTML 时间属性核对，正文最后编辑时间未独立取得；本次读到当前正文，不声称拥有 3/30 当日不可变快照。

## 下载数字：早期研究与后续平台统计存在冲突

| 来源与发布日期 | 报告数字/窗口 | 应如何引用 |
| --- | --- | --- |
| [Daniel Hnyk / FutureSearch，3/25](https://futuresearch.ai/blog/litellm-hack-were-you-one-of-the-47000/) | 46,996 次，3/24 10:39—11:25 UTC，46 分钟；1.82.7 为 14,532，1.82.8 为 32,464，其中 pip 为 23,142、uv 为 8,901 | 本次定位到最早的精确数字一手分析。文章称查询 BigQuery PyPI 日志，但未提供完整下载 SQL、查询执行时间或原始事件表；本次未复算 |
| [PyPI 官方，4/2](https://blog.pypi.org/posts/2026-04-02-incident-report-litellm-telnyx-supply-chain-attack/) | 超过 119,000 次；上传至隔离 2 小时 32 分钟 | 采用更晚的平台方报告作为当前历史统计；没有把“over 119k”改为精确总数 |
| [LiteLLM 官方 Townhall，3/27](https://docs.litellm.ai/blog/security-townhall-updates#what-happened)及目前事件页 | 仍写约 40 分钟后隔离，并称到 16:00 UTC 已删除版本 | 与后续 PyPI 隔离时长冲突。删除与隔离分别记录；不能用16:00作为下载暴露窗口终点 |

PyPI 文中分段为上传至首报 1h19m、首报至隔离 1h12m，总时长写 2h32m。分段相加为2h31m，可能涉及分钟取整；保留原文数值及差异，不伪造秒级端点或推定精确隔离时间。两份统计的完整 SQL 均未取得，无法独立重建全部过滤条件来解释差额。

**所有数字均按下载事件引用，不能推出独立机器、用户、公司或成功执行次数。** PyPA [数据说明](https://packaging.python.org/en/latest/guides/analyzing-pypi-package-downloads/)明确其表按文件下载记事件，并说明缓存、镜像和脚本等影响计数。FutureSearch 将 pip 数量直接描述为对应受害环境的推断不纳入本报告结论。

## “GitHub 没有对应 tag”的来源

[FutureSearch 原始披露页](https://futuresearch.ai/blog/litellm-pypi-supply-chain-attack/)标注发表于 3/24，当前页描述 1.82.8 没有对应 GitHub tag/release；HTML 同时记录最后编辑为 3/30。因此，能确认它是早期披露来源，无法仅凭当前页确定该句首次出现的准确时刻。[3/25 后续分析](https://futuresearch.ai/blog/litellm-hack-were-you-one-of-the-47000/)明确将无对应 tag/release 的说法扩展至两个恶意版本。

推荐保留归属：**“发现者当时报告，这两个恶意 PyPI 版本没有对应 GitHub tag/release。”** 尚未取得完整历史 tag 事件日志或当日不可变快照，不能升级为全历史不存在证明。本次没有请求当前 tag/release 的404接口来推导历史状态。

## 证据交付与限制

[sources.json](sources.json)保留每个来源 URL、采集 UTC、状态、原始字节/SHA、发布日期及证据边界；原始网页、评论正文、HTTP头保存在忽略的 `.raw/`，不进入公开白名单。[read-errors.json](read-errors.json)记录两个 GitHub contents API 的403限流；该补充 blob 对照已停止，未重试。固定 raw 文件读取均成功，但不声明通过了独立 API blob 对照。没有下载恶意包、执行目标代码、提交或推送代码、发送外部评论。

[公开文件白名单](public-allowlist.json)列出逐文件字节与 SHA，排除清单自身和原文目录；清单自身 SHA 单独交付总管。
