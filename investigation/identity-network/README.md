# LiteLLM 账号、集成路径与历史攻击关联调查

更新：2026-09-09，北京时间。调查主体是 LiteLLM 及其供应链，YouDub #130 是入口案例；本文按线索持续维护。原始响应保留 UTC 查询时间、来源端点及 SHA-256；只做公开资料和静态代码检查。

## 当前结论

- `RheagalFire` 的可定位集成 PR 共 **45 个不同上游仓库的 45 个 PR**：其中 **22 个有 PR REST 元数据和固定 base/head 比较证据**，其余 23 个目前只有 GitHub Search 元数据，仍待文件核验。最早为 [kotaemon #830](https://github.com/Cinnamon/kotaemon/pull/830)，创建时间 **2026-04-20T17:09:33Z**；最晚为 [open-code-review #385](https://github.com/alibaba/open-code-review/pull/385)，创建时间 **2026-07-16T16:52:20Z**。计数和时间范围仅限已定位样本。详见 [索引](account-expansion/rheagal-pr-index.json)、[固定提交快照](account-expansion/pr-snapshot.json)和[深入核对安装路径的 12 个目标](targets.json)。
- 新候选 `binyangzhu000-sudo` 在 [PageIndex #356](https://github.com/VectifyAI/PageIndex/pull/356) 与 [LycheeMem #14](https://github.com/LycheeMem/LycheeMem/pull/14) 添加 Atlas Cloud 路由。固定提交证明两者使用已有 LiteLLM 调用路径；未新增 LiteLLM 依赖声明。将它归为跨项目 provider 推广的相邻模式。
- 扩展搜索和重点样本中，尚未确认第三个达到 `prodmanpd`、`RheagalFire` 这种跨大量独立项目引入 LiteLLM 的账号。搜索覆盖有限，不能据此排除其他账号。
- 已读 [LiteLLM #24512](https://github.com/BerriAI/litellm/issues/24512) 和 [#24518](https://github.com/BerriAI/litellm/issues/24518) 全部 **605 条现存评论**。2026-03-24 当天，有 **115 个账号的 267 条评论**精确匹配八种重复感谢文案，全部来自 #24512。这些账号与本次候选作者集合（连同两个原调查账号共 416 个登录名）无大小写不敏感的用户名交集；两个原调查账号也未在全部 605 条评论中发言。[可复算记录](account-expansion/incident-comment-patterns.json)、[交集结果](account-expansion/summary.json)。
- 现有证据未建立这两个集成账号与 TeamPCP、历史恶意 PyPI 发布者或刷屏账号控制者的关联。账号缺席、创建日期和代码模板相似性均不能确定实际控制关系。

## 新增候选的区别

| 账号 | 可核验行为 | 分类依据 |
| --- | --- | --- |
| binyangzhu000-sudo | 2026-07-16 [PageIndex #356](https://github.com/VectifyAI/PageIndex/pull/356)、07-22 [LycheeMem #14](https://github.com/LycheeMem/LycheeMem/pull/14) | Atlas Cloud 的 `atlascloud/` 别名转换为 OpenAI 兼容模型名；仅选用该别名时应用专用凭据与端点，沿用已有 LiteLLM。账号 [created_at](https://api.github.com/users/binyangzhu000-sudo) 为 2025-08-06T08:20:01Z。未据此确认雇佣关系。 |
| luismalves | 06-03 同日提交 [core #172960](https://github.com/home-assistant/core/pull/172960)、[文档 #45740](https://github.com/home-assistant/home-assistant.io/pull/45740)、[图标 #10439](https://github.com/home-assistant/brands/pull/10439) | Home Assistant 同一集成的代码、文档和图标配套；core 通过 OpenAI 客户端对接 proxy。三个仓库共同服务一个产品功能。 |
| Cody-SSC | 09-01～02 [ssc-assistant #948](https://github.com/dto-btn/ssc-assistant/pull/948)、[ssca-mcp-server #13](https://github.com/dto-btn/ssca-mcp-server/pull/13) | 同一组织已有 LiteLLM proxy 的 MSAL/Entra 鉴权配套，PR 作者关联为 COLLABORATOR。 |
| aasmall | [上游 #162](https://github.com/balcsida/pi-provider-litellm/pull/162)、[另一个仓库 #22](https://github.com/penumbral-labs/pi-provider-litellm/pull/22) | 两条 PR 涉及同一个 pi-provider-litellm 项目；上游 PR 的 head.repo 就是 penumbral-labs/pi-provider-litellm。重复标题不足以算两套独立项目推广。 |
| cipher813 | [krepis #46](https://github.com/nousergon/krepis/pull/46)、[symposion #80](https://github.com/nousergon/symposion/pull/80) | 同一 nousergon 项目组的本地 proxy 配置及路由迁移，端点为 127.0.0.1:8980。 |

以上 11 个对照 PR 的元数据与固定提交差异均保存在 [快照](account-expansion/pr-snapshot.json)。没有复现作者声称的测试或真实网络请求。

## RheagalFire 的新增证据与反例

新增固定提交包括 [Haystack #3257](https://github.com/deepset-ai/haystack-core-integrations/pull/3257)、[OpenCode #29937](https://github.com/anomalyco/opencode/pull/29937)、[NextChat #6856](https://github.com/ChatGPTNextWeb/NextChat/pull/6856)、[CodeGPT #268](https://github.com/appleboy/CodeGPT/pull/268)、[open-code-review #385](https://github.com/alibaba/open-code-review/pull/385)、[vellum-assistant #38207](https://github.com/vellum-ai/vellum-assistant/pull/38207)、[mobilerun #384](https://github.com/droidrun/mobilerun/pull/384)、[hound #56](https://github.com/scabench-org/hound/pull/56)、[tgpt #435](https://github.com/aandrew-me/tgpt/pull/435) 和 [aisuite #349](https://github.com/andrewyng/aisuite/pull/349)。这十项中，Haystack、open-code-review、hound、tgpt 的元数据有 merged_at。

具有区分力的事实：

- Haystack 在固定 head `1af2c6606191a137ca924a8e72beeb8afb760131` 的 [新集成清单](https://github.com/deepset-ai/haystack-core-integrations/blob/1af2c6606191a137ca924a8e72beeb8afb760131/integrations/litellm/pyproject.toml)声明 `litellm>=1.60.0,<2.0,!=1.82.7,!=1.82.8`，明确排除历史恶意版本。这降低了“这些改动直接指定安装那两个历史恶意版本”解释的可信度，不能证明贡献者的整体动机。
- [aisuite 清单](https://github.com/andrewyng/aisuite/blob/8b183e395c987db88269fdd57fcdf07065902fc7/pyproject.toml)通过可选依赖及 `all` 引入 `>=1.83.0,<2.0`；[hound requirements](https://github.com/scabench-org/hound/blob/9b7397a39e4a963d5ecb4509619d615ee539a067/requirements.txt)引入同一版本范围。版本约束、默认安装与 proxy 接入需要逐项判断。
- [BerriAI/litellm #23276](https://github.com/BerriAI/litellm/pull/23276)经 REST 再核验：作者 RheagalFire，创建于 2026-03-10T15:58:04Z，03-11T13:24:39Z 由 Sameerlite 合并；head.repo 为 BerriAI/litellm。这证明上游参与经历。PR 及分支记录不单独证明雇佣、账号当前权限或 PyPI 发布权。

## 深入核对安装路径的 12 个集成子集

下表基于 [targets.json](targets.json)、各目标 `responses/*-pr.json`、固定 SHA 的 `*-compare.json`，以及按 blob SHA 下载并校验的 [完整清单与锁文件](source-manifest.json)。每项 PR 都检查了 changed_files 与固定比较文件数一致。

| PR | 路径与版本 | 安装/锁定范围 |
| --- | --- | --- |
| [MIRIX #133](https://github.com/Mirix-AI/MIRIX/pull/133) | SDK，`>=1.80.0,<1.87.0` | pyproject 的 litellm extra；head 的 uv.lock 与 poetry.lock 均没有 LiteLLM 包记录。 |
| [GuideLLM #800](https://github.com/vllm-project/guidellm/pull/800) | SDK，`>=1.83.0` | litellm extra，all 也包含它；uv.lock 锁至 1.95.0。锁内 16 个制品 URL/SHA-256 均与当前 PyPI 1.95.0 JSON 一致。[核验结果](account-expansion/guidellm-lock-verification.json)仅证明索引对应关系。 |
| [VLMEvalKit #1521](https://github.com/open-compass/VLMEvalKit/pull/1521) | SDK，`>=1.55,<1.85` | requirements.txt 添加，setup.py 通过 install_requires 读取，属于基础安装依赖。PR 所称 optional/base unaffected 与此路径不符。 |
| [MLE-agent #329](https://github.com/MLSysOps/MLE-agent/pull/329) | OpenAI SDK → LiteLLM proxy | 三个 Python 文件改动；没有新增 LiteLLM 包声明；root uv.lock 无 LiteLLM 包。 |
| [kotaemon #830](https://github.com/Cinnamon/kotaemon/pull/830) | SDK，`>=1.60,<1.85` | libs/kotaemon 的 adv extra；all 包含 adv，root 项目依赖 kotaemon[all]，Docker full 也安装 adv。root uv.lock 缺少该包，不能把逻辑安装范围等同于 frozen 安装已成功。 |
| [lm-evaluation-harness #3721](https://github.com/EleutherAI/lm-evaluation-harness/pull/3721) | SDK，`>=1.60,<1.85` | 可选 extra；未发现根目录锁文件。 |
| [PDFMathTranslate #1135](https://github.com/PDFMathTranslate/PDFMathTranslate/pull/1135) | SDK，`>=1.55.0,<1.85` | 可选 extra；未发现根目录锁文件。 |
| [agentic_security #299](https://github.com/msoedov/agentic_security/pull/299) | SDK provider | 未修改依赖清单；完整 pyproject 和 poetry.lock 无直接 LiteLLM 包声明/锁定记录。provider 被 __init__ 导入，provider 自身导入 litellm，存在缺失依赖时的导入失败路径；未运行复现。 |
| [burr #803](https://github.com/apache/burr/pull/803) | SDK，extra 的 `litellm` 无版本边界 | 示例要求 burr[litellm]；未发现根目录锁文件。 |
| [swarmclaw #136](https://github.com/swarmclawai/swarmclaw/pull/136) | TypeScript proxy | 未新增 PyPI LiteLLM；未修改包清单/锁文件。 |
| [mercury-agent #93](https://github.com/cosmicstack-labs/mercury-agent/pull/93) | TypeScript proxy | 同上。 |
| [automaton #334](https://github.com/Conway-Research/automaton/pull/334) | TypeScript proxy | 同上。 |

## 历史攻击账号与角色

2026-03-24 的 1.82.7/1.82.8 恶意发布由 [PyPA 公告](https://github.com/pypa/advisory-database/blob/b0f7a727494c977b29c998bc9199de5891f8f302/vulns/litellm/PYSEC-2026-2.yaml)确认。发布凭据源自被利用的 Trivy 依赖；[LiteLLM 官方说明](https://docs.litellm.ai/blog/security-update-march-2026)称恶意包绕过正常发布工作流直接上传 PyPI。不同早期报道的小时级时间有差异，本文不把未统一的时间拼接成确定事件链。

| 标识 | 可支持的角色与证据 | 归因边界 |
| --- | --- | --- |
| TeamPCP / Persy_PCP / PCPcat / ShellForce / DeadCatx3 | [Snyk](https://snyk.io/blog/poisoned-security-scanner-backdooring-litellm/)与[Datadog](https://securitylabs.datadoghq.com/articles/litellm-compromised-pypi-teampcp-supply-chain-campaign/)归因的攻击组织/别名；公开研究列出 Telegram 标识 @Persy_PCP、@teampcp。 | 这些标识不能自动映射到同名 GitHub 用户。 |
| MegaGame10418 | Snyk 与 [Rami McCarthy 的纠错记录](https://ramimac.me/teampcp/)将其关联至 02-27 Trivy Pwn Request 初始凭据窃取。 | 属于攻击链早期账号线索；不能仅凭这个名字认定直接上传 LiteLLM 包的账号控制者。 |
| krrishdholakia | 历史维护者身份，事件中其发布 token / GitHub PAT 遭窃取。维护者在 [原始回复](https://github.com/BerriAI/litellm/issues/24518#issuecomment-4119972374)明确描述 CircleCI 凭据泄漏包含这两种 token。 | 受害身份与攻击者实际操作者需要分开。新账号 krrish-berri-2、ishaan-berri 属于[处置措施](https://github.com/BerriAI/litellm/issues/24518#issuecomment-4119055562)。 |
| aqua-bot | [Wiz Trivy 分析](https://www.wiz.io/blog/trivy-compromised-teampcp-supply-chain-attack)记录被盗服务账号用于恶意 workflow 与制品活动。 | Aqua 服务账号遭滥用。rauchg、DmitriyLewen 在该研究中是被冒用的 commit 身份，也不能列为攻击者。 |
| Argon-DevOps-Mgt | [OpenSourceMalware 的原始分析](https://opensourcemalware.com/blog/teampcp-defaces-aqua-securitys-internal-github-org-44-repos-exposed)识别 GitHub ID 139343333，指出其跨 Aqua 两个组织的权限与 03-22 异常分支操作。 | 研究归类为被盗服务账号。 |
| cx-plugins-releases / ast-phoenix | [Wiz KICS 分析](https://www.wiz.io/blog/teampcp-attack-kics-github-action)记录前者 GitHub ID 225848595 发布恶意 tags，后者为 OpenVSX 恶意扩展的发布身份。 | 平台不同，不能混为两个 LiteLLM PR 账号；属于同一研究关联活动中的受损发布身份。 |
| hackerbot-claw | [Aqua 03-30 官方复盘](https://github.com/aquasecurity/trivy/discussions/10462)记录其 02-28 利用尝试，并明确用户代理及行为模式与其他事件不同。 | 早期文章存在混同；依官方复盘单列，未将其认定为 TeamPCP 或 LiteLLM 直接发布者。 |

另一个可作行为对照的恶意 PR 集群为 `testedbefore`、`beforetested-boop`、`420tb`、`69tf420`、`elzotebo`、`ezmtebo`。[Wiz 对 prt-scan 的原始研究](https://www.wiz.io/blog/six-accounts-one-actor-inside-the-prt-scan-supply-chain-campaign)将六者关联至同一活动，以 `prt-scan-` 分支及 CI 执行入口中的凭据窃取载荷为证据。该研究没有建立其与本次 LiteLLM 集成账号的联系；也不能因为页面推荐了 TeamPCP 文章而认定两种活动同源。

## LiteLLM 披露评论中的账号线索

示例：[praiitt](https://github.com/BerriAI/litellm/issues/24512#issuecomment-4117961388)、[Christopher933](https://github.com/BerriAI/litellm/issues/24512#issuecomment-4117963694)、[mahesh-sini](https://github.com/BerriAI/litellm/issues/24512#issuecomment-4117963720)、[bercanozcan](https://github.com/BerriAI/litellm/issues/24512#issuecomment-4117963848)、[18pixels](https://github.com/BerriAI/litellm/issues/24512#issuecomment-4117963876)。完整 115 个用户名、267 个评论链接及时间见[机器可读记录](account-expansion/incident-comment-patterns.json)。

筛选严格限制为：2026-03-24、当前 REST 返回的评论、正文去首尾空格后精确匹配八条重复文案。该统计覆盖多个评论簇，故与早期报道的“102 秒内 73 个账号/88 条评论”不同。复核只能证明这些账号发表了匹配内容；逐个账号是否被盗、当前控制者是谁，仍需独立证据。没有读取泄漏凭据仓库或联系攻击者。

## prodmanpd 与发布链的公开关联

原有 12 个 RheagalFire PR 的 issue comments、reviews、inline comments 共 36 个端点集合均完成读取，合计 71 项；没有 prodmanpd 发言。观察时间为 2026-09-08T20:30:27Z～20:31:35Z。[讨论快照](discussion-snapshot.json)保留每项作者、链接和时间。未在这些讨论中确认作者与 LiteLLM 的雇佣披露。此结论不覆盖新定位 PR 的全部讨论。

复用先前成功的公开查询并保存[结果与响应哈希摘要](publisher-query-summary.json)：在 BerriAI/litellm 内针对 prodmanpd 的 PR 作者、issue 作者、involves、评论文本、commit 作者/提交者搜索均返回零；额外 reviewer/commenter、workflow actor、默认分支和 v1.100.0 祖先提交过滤也无命中。它们是各查询范围内的公开阴性证据，不能证明不存在私人联系或发布权限。原始响应、查询时间及复用说明保存在本地 publisher-evidence 目录。

[v1.100.0 GitHub release](https://github.com/BerriAI/litellm/releases/tag/v1.100.0)作者是 yuneng-berri；[tag 对应提交](https://github.com/BerriAI/litellm/commit/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4)的账号归属是 author=yuneng-berri、committer=web-flow、verification.verified=true。GitHub release、签名提交与 PyPI 发布者是不同证据层级。已读 release ref 的 create-release workflow；它创建 GitHub tag/release，没有据此证明 PyPI 上传身份。`dispatch-infra-build.yml` 在该 release ref 的读取曾返回 404，未用当前分支替代。PyPI 角色和制品发布证明仍未闭合。

## 覆盖限制与最有区分力的下一项

- 成功搜索响应合计去重 598 条 PR 元数据。`integration` 的 2026-01-01～08-01 标题检索完成三页共 205 条；其他关键词搜索没有全量分页。2026-09-08T20:22 附近发生 secondary rate limit，错误原文已保存。稍后缩小时间范围的单独检索恢复，但仍不能称全站穷尽。
- 45 个 RheagalFire PR 中 23 个未做固定文件比较；即使标题显示 provider，也不能推定安装了 PyPI 包。优先补齐这些差异并继续按不同上游项目聚合其他作者。
- 判断“统一推广”与“恶意引入”最有区分力的下一项是：可归属于账号的任务/委托披露、明确依赖恶意制品的锁定哈希、固定代码内攻击者控制端点或启动载荷，以及具体制品的发布身份。仅增加账号相似度或注册日比较，无法闭合归因。
- 评论交集结果只涉及现存账号登录名与现存记录。删除、改名、私有活动及控制权移转均不在可见范围内。
- 本方向采集不发送公开消息，也不执行所调查代码；公开材料的整理、发布及必要提醒由总管统一负责。
