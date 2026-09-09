# “123 个被盗账号刷屏 LiteLLM”说法核验

核验日期：2026-09-09；UTC。**未找到“恰好 123 个账号、且全部为真实被盗开发者账号”的一手依据。** 历史刷屏行为有直接记录；账号数量、控制权、操作者和意图需要分别表达。[分项证据等级](claim-index.json)、[来源及获取记录](source-index.json)。

| 待核验说法 | 结论与证据等级 |
| --- | --- |
| 恰好 123 个账号 | **未证实。** 所查原文给出 73 或约 125，尚未定位 123 的最早出处。 |
| 全部为被盗开发者账号 | **未证实。** Rami McCarthy 的[原站时间线数据](https://ramimac.me/teampcp/timeline.json)明确描述混合来源：被盗开发者凭据、购买的休眠账号；细项还包含新/假/商业账号。 |
| TeamPCP 操纵刷屏 | **有研究归因支持，逐账号操作者未独立核验。** Rami 将与 Trivy 刷屏账号重叠作为关联依据；[Datadog 的攻击链分析](https://securitylabs.datadoghq.com/articles/litellm-compromised-pypi-teampcp-supply-chain-campaign/)支持恶意制品活动的 TeamPCP 归因，但不能独立认证每个评论账号。 |
| 刷屏用于掩护攻击 | **行为支持的合理推断。** 密集无关回复及淹没技术讨论的效果可观察；[发现者记录](https://futuresearch.ai/blog/litellm-pypi-supply-chain-attack/)与[StepSecurity 分析](https://www.stepsecurity.io/blog/litellm-credential-stealer-hidden-in-pypi-wheel)支持压制披露的解释。所查资料未提供操作者任务指令或供述。 |

## 来源、数字与时间窗口

- [FutureSearch](https://futuresearch.ai/blog/litellm-pypi-supply-chain-attack/) 页面标注 2026-03-24，3 月 30 日更新；其 **13:03 UTC** 更新已记录披露 issue 被关闭、大量刷屏，并谨慎表示维护者很可能已失陷。这是本次定位的同期第一手观察，不提供 123 计数。
- [OpenHack](https://openhack.com/blog/litellm-supply-chain-compromise-teardown) 页面标注 3 月 24 日；“The Suppression Attempt”段写 **73 个账号、88 条评论、102 秒，约 12:44–12:46 UTC**，并概括为此前被盗开发者账号。该段未给逐账号受害确认、完整样本或准确采集时间；本次没有证明当前网页与首发正文完全相同。
- [Rami 的原始 JSON](https://ramimac.me/teampcp/timeline.json) 中 `items[id="spam-flood-litellm"]` 写 **约 125 个账号、约 300 条评论、约 6 小时**，事件起点标为 `2026-03-24T12:44:00Z`；其 `description` 和 `evidence[0].commit_message` 明确列出账号来源混合。JSON 于 **2026-09-09 03:49:02.796–03:49:03.587 UTC** 获取，HTTP 200；它是当前研究记录，不能当成未经修订的 3 月 24 日快照。事件没有附逐账号控制权证明或完整交集名单，操作者归属属于研究者判断。

当前可读的 Rami 数据并不支持把所有参与账号统称为真实被盗开发者账号；也不应将其约数改成 123。搜索未找到精确出处只构成检索边界，不能断言从未有人作出该统计。

## 被盗证据能覆盖谁

[维护者 krrish-berri-2 的回复](https://github.com/BerriAI/litellm/issues/24518#issuecomment-4119972374)发表于 **2026-03-24 17:16:19 UTC**，说明 CircleCI 泄漏包含 PyPI publish token 与 GitHub PAT，并描述撤销处理。这是维护者对自身事件的第一手说明，不能外推其他刷屏账号。

还定位到一条[署名 grankin_d 的原 X 链接](https://x.com/grankin_d/status/2037490645388894238)。第三方镜像呈现其自述：自身 GitHub 账号被盗、约 73 个 token 用于刷屏，之后账号及项目受平台限制。**原 X 读取未取得正文；镜像直接留存返回 HTTP 403。** 因此仅作为未完成原站核验的线索保存，不认定 GitHub 已确认该自述，更不据此证明全体账号被盗。本次没有继续查其个人信息、工单或扩大账号样本。

## 与现有 605 / 115 / 267 / 416 的关系

本次复算既有快照，结果不变：[样本对照](sample-comparison.json)。

| 数字 | 分母与范围 |
| --- | --- |
| 605 条 | 2026-09-08 **20:23:15.342–20:23:31.096 UTC** 分页取得的两条 issue 全部现存评论：#24512 为 487，#24518 为 118。包括不同日期的正常技术讨论。 |
| 115 个账号、267 条 | 在上述快照中，仅筛 3 月 24 日、去首尾空格后精确匹配八种重复文案的评论；全来自 #24512，覆盖多个评论簇。账号计数不等于被盗确认数。 |
| 416 个候选账号 | 既有跨项目集成调查的另一个用户名集合，与 115 个刷屏登录名大小写不敏感交集为零；该结果无法排除改名、控制权变化或非公开联系。 |
| 73、约 125、123 | 前两者来自不同窗口和方法的研究叙述，123 原始口径未知。不能做差推算被删除、被盗或漏采账号数量。 |

**披露 issue 中的灌水与跨项目 LiteLLM 集成贡献属于不同的行为记录。** 现有材料未建立 prodmanpd、RheagalFire 与历史刷屏操作者或恶意发布的联系。

原文响应隔离在 `local/`；公开交付仅限 [publishable.sha256](publishable.sha256)。保留 HTTP 403、X 空正文及一次无结果链接点击等限制，没有绕过访问控制。未联系作者、发评论、执行调查代码或修改主报告。来源哈希识别留存响应，不构成独立可信时间戳。
