# LiteLLM 跨项目集成与供应链审查记录

调查快照：2026-09-09（北京时间）。记录公开代码与讨论中的供应链风险，供维护者复核和作者澄清。未修改或合并 YouDub #130。

## 结论

可确认该账号在集中推动跨项目 LiteLLM 集成。其本人已在 Chartbrew 的公开回复中确认批量提交；本次发现的 49 个 PR 全部属于这个主题。已检查的提交差异与锁文件中，未发现其直接植入已知窃密载荷或把 LiteLLM 制品地址/哈希替换为其他来源的证据。现有材料支持继续保留供应链 concern，无法据此认定作者参与过投毒、账号被盗或接受某方付费委托。

## 覆盖范围

- [账号](https://github.com/prodmanpd)创建于 2020-04-07；当前公开仓库 85 个，其中 84 个 fork。唯一非 fork 仓库 gitinit 为空，提交 API 返回 HTTP 409。不能据此推断此前没有私有或已删除贡献。
- 完整分页读取 85 个仓库的 435 个当前可见分支，对每条分支查询归属于 prodmanpd 的提交。59 个 fork 有该账号关联提交，合计 109 个唯一 SHA。其余 fork 没有查到当前分支上归属于该账号的提交。
- 结合公开 PR、按账号及该账号已公开提交邮箱的 commit 搜索，共收集 122 个唯一 SHA；全部返回的 GitHub author.login 都是 prodmanpd。包含 1 个同步上游的 merge commit；另有 squash/原始提交的逻辑重复，所以 122 不能当成 122 个独立功能。
- [公开 PR 搜索](https://github.com/search?q=is%3Apr+author%3Aprodmanpd&type=pullrequests)返回 49 项且 incomplete_results=false；覆盖 49 个上游项目、367 条 PR 文件变更记录。29 个开放、17 个已合并、3 个关闭未合并。读取了每个 PR 的提交、文件、普通评论、review 及行内评论。
- PR 最早创建于 2026-07-17，最新一批为 2026-09-08；122 个记录的 author date 范围为 2026-07-17 至 2026-09-08。Git author date 可由提交者设置，应优先使用 GitHub PR 创建时间判断提交批次。
- 公开 issue 作者搜索为 0；其在 BerriAI/litellm 的公开参与搜索为 0，公开组织列表为空，profile 未声明公司。在本次读取的资料中未找到雇佣、赞助或委托关系声明。上述空结果无法排除未公开关系。

## 最有解释力的证据

1. **作者确认批量提交。** Chartbrew 维护者[询问动机与实际使用场景](https://github.com/chartbrew/chartbrew/pull/365#issuecomment-5162631959)。作者[回复](https://github.com/chartbrew/chartbrew/pull/365#issuecomment-5207856315)：“Yes, I have been submitting LiteLLM integrations to open-source projects.” 并表示自己不是 Chartbrew 的日常用户，理由是方便已有网关的团队接入。此回复可以支持“批量集成”的结论，未声明商业关系。
2. **同一功能批量出现，SDK 与代理方式并存。** 49 个 PR 中 22 个有新增 Python LiteLLM SDK 调用，27 个主要是 OpenAI/Anthropic 兼容代理配置、客户端封装、UI 或模型发现。普通代理配置本身不会把 PyPI litellm 安装进应用进程。下表逐项区分。
3. **YouDub 的安装范围发生变化。** [5901bd2](https://github.com/liuzhao1225/YouDub-webui/commit/5901bd272c366dc62fc95936d98cd56f7edac311) 删除独立 requirements-litellm.txt，[1add1b6](https://github.com/liuzhao1225/YouDub-webui/commit/1add1b6d90795ddc222c3f5021305a2e8d953a17) 把 LiteLLM 加入默认 requirements.txt。两次变更发生在 PR 创建后几分钟，当前 PR 描述仍称可选；本次未查到解释这一选择的作者回复。这是需要澄清的具体不一致。
4. **其他维护者也提出过风险。** Tencent AI-Infra-Guard [维护者反馈](https://github.com/Tencent/AI-Infra-Guard/pull/598#issuecomment-5404169735)指出依赖体积、供应链暴露面与宽泛 1.x 范围的问题。trpc-agent-go 的[审查意见](https://github.com/trpc-group/trpc-agent-go/pull/2484#discussion_r3801102329)指出 OpenAI SDK 默认凭据可能误传给 LiteLLM 网关；这是审查者报告，本次没有执行其重现环境。data-juicer [维护者](https://github.com/datajuicer/data-juicer/pull/1062#issuecomment-5490268186)也指出 OpenAI 环境变量被提前合并到其他 provider 的问题。
5. **既有接受，也有拒绝。** [CowAgent](https://github.com/zhayujie/CowAgent/pull/3075#issuecomment-5538183898)认为现有 custom provider 已能对接 LiteLLM 代理，因此关闭新增 SDK/provider 的 PR。[ClawBench](https://github.com/TIGER-AI-Lab/ClawBench/pull/288#issuecomment-5471041202)因询问动机后长期无进展而关闭。[SWE-bench](https://github.com/SWE-bench/SWE-bench/pull/639#issuecomment-5482739761)、[UltraRAG](https://github.com/OpenBMB/UltraRAG/pull/496#issuecomment-5508975027)等项目已接受或确认检查通过。合并记录不能作为供应链安全认证。
6. **历史差异中的特殊记录。** cortex-app 的[清理提交](https://github.com/trace-cortex/cortex-app/commit/c3bc8c4e7a0f78957934c4599e862737a94d543f)删除了两个误提交文件：一个空文件和一份 GitHub 搜索条件错误输出。没有发现其中包含载荷。LEANN 的[构建修复](https://github.com/StarTrail-org/LEANN/commit/857f24382e97f4c47df22e207f69fd52bfe5e6a1)添加 PyPI patchelf 安装，理由是 auditwheel 要求；3 个“re-trigger CI”提交是空提交。trpc-agent-go merge commit 引入的上游 benchmark 工作流不能直接归为作者原创改动。

## 依赖与制品核查

已对 122 个历史提交中 API 提供的差异筛查已知投毒域名、.pth、执行/解码、安装钩子及外发地址模式，并检查关注项的上下文。未发现直接的已知投毒载荷。大文件 diff 有缺省/截断风险；6 个当前 PR 的 uv.lock 已另外读取完整内容。此项属于静态筛查，不是全部第三方依赖的全面恶意代码审计。

6 个 PR 的 LiteLLM 锁文件共包含 42 条制品记录，逐条核对 PyPI 对应版本的 URL 和 SHA-256，均一致：

| 项目 PR | 锁定版本 | 制品记录数 | 核对结果 |
| --- | --- | ---: | --- |
| [UltraRAG #496](https://github.com/OpenBMB/UltraRAG/pull/496) | 1.97.0 | 8 | URL / SHA-256 一致 |
| [zotero-arxiv-daily #294](https://github.com/TideDra/zotero-arxiv-daily/pull/294) | 1.98.0 | 8 | URL / SHA-256 一致 |
| [PixelRAG #145](https://github.com/StarTrail-org/PixelRAG/pull/145) | 1.98.0 | 8 | URL / SHA-256 一致 |
| [marker #1097](https://github.com/datalab-to/marker/pull/1097) | 1.98.0 | 8 | URL / SHA-256 一致 |
| [SWE-bench #639](https://github.com/SWE-bench/SWE-bench/pull/639) | 1.98.0 | 8 | URL / SHA-256 一致 |
| [data-juicer #1062](https://github.com/datajuicer/data-juicer/pull/1062) | 1.80.0 | 2 | URL / SHA-256 一致 |

其中 UltraRAG 的声明范围 >=1.60,<2.0、data-juicer 的 >=1.80.0,<2 本身没有排除历史恶意版本 1.82.7/1.82.8；实际锁文件分别固定 1.97.0 和 1.80.0，不能把范围过宽等同于安装恶意版本。官方已下架两个恶意版本。

## 最新 LiteLLM 发布

截至查询，[PyPI](https://pypi.org/project/litellm/)最新正式版为 1.100.0，发布于 2026-09-06；同日还有 1.101.0rc1 预发布。[GitHub 正式 Release](https://github.com/BerriAI/litellm/releases/tag/v1.100.0)也为 1.100.0。YouDub 的 >=1.89.0,<2.0.0 允许解析到 1.100.0，具体结果取决于索引和其他依赖约束。作者测试声明中的 1.99.0 不能覆盖这个新版本。

抽查制品：`litellm-1.100.0-cp310-abi3-manylinux_2_28_x86_64.whl`。

- SHA-256：`8224c8eed9cab3319a88e6665d1275ad8faf21d353b1b22223a6d6115a302ea2`，与 PyPI 元数据一致。
- 包内 2280 个 Python 文件与[官方 v1.100.0 标签对应提交](https://github.com/BerriAI/litellm/commit/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4)逐字节一致。
- 未发现 .pth 文件或本次使用的历史 IOC 字符串。
- 原生二进制和所有传递依赖未完整审计，这些结果不构成“整个版本绝对安全”的结论。

## 已确认的版本漂移风险

`litellm>=1.89.0,<2.0.0` 对新环境安装通常会解析为索引上最新的兼容正式版；当前可包括 1.100.0，今后可包括更高的 1.x 版本。作者报告测试的是 1.99.0。没有仓库内依赖改动，也可能安装到不同于已测试版本的制品。已有环境并非每次 pip install 都自动升级，但新环境和升级仍有这一风险。

如果某个满足范围的后续版本被投毒，默认 requirements 会把该版本引入环境；历史 `.pth` 机制说明功能开关不能隔离这种启动时执行。已在 [#130 的补充讨论](https://github.com/liuzhao1225/YouDub-webui/pull/130#issuecomment-5590586641)明确表达 concern，请作者解释默认安装、宽版本范围以及如何将安装绑定到已审查测试的制品。未据此指控 1.100.0 或作者恶意。

## 后续讨论应围绕的事实

建议保持 #130 开放，等待作者解释批量集成的动机、是否存在委托或关联关系、为何从可选改为默认安装，以及如何管理版本漂移、制品验证和凭据隔离。现有公开证据不足以指控作者投毒。本记录不对贡献者作恶意归因；后续公开通知见本仓库的评论记录。

## 全部 49 个公开 PR

时间为 UTC。SDK 表示新增 Python LiteLLM 调用；代理兼容表示未在新增非测试代码中发现 Python LiteLLM SDK 调用。依赖栏只摘取本 PR 新增或修改的显式 Python 包约束；空白不等于项目原本没有该依赖。

| 项目 / PR | 创建日期 | 状态 | 接入方式 | 本 PR LiteLLM 约束 |
| --- | --- | --- | --- | --- |
| [yilewang/llm-for-zotero #316](https://github.com/yilewang/llm-for-zotero/pull/316) | 2026-07-17 | 开放 | 代理兼容 | — |
| [microsoft/TinyTroupe #160](https://github.com/microsoft/TinyTroupe/pull/160) | 2026-07-17 | 开放 | SDK | — |
| [xunbu/docutranslate #53](https://github.com/xunbu/docutranslate/pull/53) | 2026-07-17 | 开放 | SDK | — |
| [polyrabbit/hacker-news-digest #47](https://github.com/polyrabbit/hacker-news-digest/pull/47) | 2026-07-17 | 开放 | SDK | — |
| [modelscope/FunClip #178](https://github.com/modelscope/FunClip/pull/178) | 2026-07-17 | 已合并 | SDK | — |
| [chartbrew/chartbrew #365](https://github.com/chartbrew/chartbrew/pull/365) | 2026-08-02 | 开放 | 代理兼容 | — |
| [itsOwen/CyberScraper-2077 #50](https://github.com/itsOwen/CyberScraper-2077/pull/50) | 2026-08-02 | 已合并 | 代理兼容 | — |
| [e2b-dev/surf #40](https://github.com/e2b-dev/surf/pull/40) | 2026-08-02 | 开放 | 代理兼容 | — |
| [cltk/cltk #1332](https://github.com/cltk/cltk/pull/1332) | 2026-08-02 | 开放 | 代理兼容 | — |
| [Atmosphere/atmosphere #2735](https://github.com/Atmosphere/atmosphere/pull/2735) | 2026-08-03 | 已合并 | 代理兼容 | — |
| [inkeep/agents #3492](https://github.com/inkeep/agents/pull/3492) | 2026-08-03 | 开放 | 代理兼容 | — |
| [ShenSeanChen/waku-agent #73](https://github.com/ShenSeanChen/waku-agent/pull/73) | 2026-08-03 | 关闭未合并 | 代理兼容 | — |
| [Nutlope/notesGPT #44](https://github.com/Nutlope/notesGPT/pull/44) | 2026-08-03 | 开放 | 代理兼容 | — |
| [k8sgpt-ai/k8sgpt #1719](https://github.com/k8sgpt-ai/k8sgpt/pull/1719) | 2026-08-03 | 已合并 | 代理兼容 | — |
| [SciSharp/BotSharp #1395](https://github.com/SciSharp/BotSharp/pull/1395) | 2026-08-10 | 已合并 | 代理兼容 | — |
| [mnemox-ai/tradememory-protocol #10](https://github.com/mnemox-ai/tradememory-protocol/pull/10) | 2026-08-10 | 开放 | SDK | — |
| [orneryd/NornicDB #292](https://github.com/orneryd/NornicDB/pull/292) | 2026-08-10 | 已合并 | 代理兼容 | — |
| [VersusControl/versus-incident #333](https://github.com/VersusControl/versus-incident/pull/333) | 2026-08-10 | 开放 | 代理兼容 | — |
| [krishn404/Git-Friend #15](https://github.com/krishn404/Git-Friend/pull/15) | 2026-08-10 | 开放 | 代理兼容 | — |
| [MindWorkAI/AI-Studio #909](https://github.com/MindWorkAI/AI-Studio/pull/909) | 2026-08-11 | 已合并 | 代理兼容 | — |
| [nextai-translator/nextai-translator #1905](https://github.com/nextai-translator/nextai-translator/pull/1905) | 2026-08-11 | 已合并 | 代理兼容 | — |
| [StarTrail-org/LEANN #395](https://github.com/StarTrail-org/LEANN/pull/395) | 2026-08-17 | 已合并 | SDK | — |
| [SWE-bench/SWE-bench #639](https://github.com/SWE-bench/SWE-bench/pull/639) | 2026-08-17 | 已合并 | SDK | — |
| [buxuku/SmartSub #448](https://github.com/buxuku/SmartSub/pull/448) | 2026-08-17 | 开放 | 代理兼容 | — |
| [TIGER-AI-Lab/ClawBench #288](https://github.com/TIGER-AI-Lab/ClawBench/pull/288) | 2026-08-17 | 关闭未合并 | SDK | — |
| [trpc-group/trpc-agent-go #2484](https://github.com/trpc-group/trpc-agent-go/pull/2484) | 2026-08-17 | 开放 | 代理兼容 | — |
| [jianchang512/pyvideotrans #1181](https://github.com/jianchang512/pyvideotrans/pull/1181) | 2026-08-17 | 已合并 | SDK | — |
| [lofcz/LLMTornado #186](https://github.com/lofcz/LLMTornado/pull/186) | 2026-08-17 | 已合并 | 代理兼容 | — |
| [continuedev/continue #13151](https://github.com/continuedev/continue/pull/13151) | 2026-08-17 | 开放 | 代理兼容 | — |
| [OpenBMB/UltraRAG #496](https://github.com/OpenBMB/UltraRAG/pull/496) | 2026-08-24 | 已合并 | SDK | — |
| [OtterMind/Chat2DB #2757](https://github.com/OtterMind/Chat2DB/pull/2757) | 2026-08-24 | 开放 | 代理兼容 | — |
| [zhayujie/CowAgent #3075](https://github.com/zhayujie/CowAgent/pull/3075) | 2026-08-24 | 关闭未合并 | SDK | — |
| [StarTrail-org/PixelRAG #145](https://github.com/StarTrail-org/PixelRAG/pull/145) | 2026-08-24 | 已合并 | SDK | — |
| [trailhq/Graft #220](https://github.com/trailhq/Graft/pull/220) | 2026-08-24 | 已合并 | 代理兼容 | — |
| [Tencent/AI-Infra-Guard #598](https://github.com/Tencent/AI-Infra-Guard/pull/598) | 2026-08-24 | 开放 | SDK | — |
| [trace-cortex/cortex-app #9](https://github.com/trace-cortex/cortex-app/pull/9) | 2026-08-24 | 开放 | SDK | — |
| [datalab-to/marker #1097](https://github.com/datalab-to/marker/pull/1097) | 2026-08-31 | 开放 | SDK | — |
| [datajuicer/data-juicer #1062](https://github.com/datajuicer/data-juicer/pull/1062) | 2026-08-31 | 已合并 | SDK | — |
| [TideDra/zotero-arxiv-daily #294](https://github.com/TideDra/zotero-arxiv-daily/pull/294) | 2026-08-31 | 开放 | SDK | — |
| [Tencent/WeKnora #2923](https://github.com/Tencent/WeKnora/pull/2923) | 2026-08-31 | 已合并 | 代理兼容 | — |
| [0xMassi/webclaw #123](https://github.com/0xMassi/webclaw/pull/123) | 2026-08-31 | 开放 | 代理兼容 | — |
| [nageoffer/ragent #126](https://github.com/nageoffer/ragent/pull/126) | 2026-08-31 | 开放 | 代理兼容 | — |
| [sdcb/chats #142](https://github.com/sdcb/chats/pull/142) | 2026-08-31 | 开放 | 代理兼容 | — |
| [Awarexone/Agentic-Bug-Hunter #129](https://github.com/Awarexone/Agentic-Bug-Hunter/pull/129) | 2026-09-08 | 开放 | SDK | — |
| [agentscope-ai/OpenJudge #196](https://github.com/agentscope-ai/OpenJudge/pull/196) | 2026-09-08 | 开放 | SDK | — |
| [jjyaoao/HelloAgents #113](https://github.com/jjyaoao/HelloAgents/pull/113) | 2026-09-08 | 开放 | SDK | — |
| [SenteLabsAI/OpenExecutive #98](https://github.com/SenteLabsAI/OpenExecutive/pull/98) | 2026-09-08 | 开放 | SDK | — |
| [liuzhao1225/YouDub-webui #130](https://github.com/liuzhao1225/YouDub-webui/pull/130) | 2026-09-08 | 开放 | SDK | — |
| [ageerle/ruoyi-ai #333](https://github.com/ageerle/ruoyi-ai/pull/333) | 2026-09-08 | 开放 | 代理兼容 | — |

## 全部 85 个公开仓库

关联提交数按每个仓库当前全部可见分支去重 SHA；fork 继承的其他作者提交不计入。

| 仓库 | Fork | 创建日期 | 分支数 | 作者关联提交数 |
| --- | --- | --- | ---: | ---: |
| [gitinit](https://github.com/prodmanpd/gitinit) | 否 | 2020-04-07 | 0 | 0 |
| [llm-for-zotero](https://github.com/prodmanpd/llm-for-zotero) | 是 | 2026-07-17 | 2 | 5 |
| [TinyTroupe](https://github.com/prodmanpd/TinyTroupe) | 是 | 2026-07-17 | 2 | 2 |
| [get-physics-done](https://github.com/prodmanpd/get-physics-done) | 是 | 2026-07-17 | 1 | 0 |
| [git-lrc](https://github.com/prodmanpd/git-lrc) | 是 | 2026-07-17 | 1 | 0 |
| [docutranslate](https://github.com/prodmanpd/docutranslate) | 是 | 2026-07-17 | 2 | 4 |
| [openswarm](https://github.com/prodmanpd/openswarm) | 是 | 2026-07-17 | 1 | 0 |
| [hacker-news-digest](https://github.com/prodmanpd/hacker-news-digest) | 是 | 2026-07-17 | 2 | 4 |
| [FunClip](https://github.com/prodmanpd/FunClip) | 是 | 2026-07-17 | 2 | 3 |
| [passmark](https://github.com/prodmanpd/passmark) | 是 | 2026-07-27 | 1 | 0 |
| [KrillinAI](https://github.com/prodmanpd/KrillinAI) | 是 | 2026-07-27 | 1 | 0 |
| [beelzebub](https://github.com/prodmanpd/beelzebub) | 是 | 2026-07-27 | 2 | 1 |
| [VulnHunter](https://github.com/prodmanpd/VulnHunter) | 是 | 2026-07-27 | 1 | 0 |
| [blades](https://github.com/prodmanpd/blades) | 是 | 2026-07-27 | 2 | 1 |
| [chartbrew](https://github.com/prodmanpd/chartbrew) | 是 | 2026-08-01 | 48 | 2 |
| [nextcrm-app](https://github.com/prodmanpd/nextcrm-app) | 是 | 2026-08-01 | 5 | 0 |
| [eslint-doc-generator](https://github.com/prodmanpd/eslint-doc-generator) | 是 | 2026-08-01 | 39 | 2 |
| [solo](https://github.com/prodmanpd/solo) | 是 | 2026-08-02 | 34 | 0 |
| [comanda](https://github.com/prodmanpd/comanda) | 是 | 2026-08-02 | 148 | 2 |
| [CyberScraper-2077](https://github.com/prodmanpd/CyberScraper-2077) | 是 | 2026-08-02 | 2 | 2 |
| [bolt-python-ai-chatbot](https://github.com/prodmanpd/bolt-python-ai-chatbot) | 是 | 2026-08-02 | 7 | 2 |
| [surf](https://github.com/prodmanpd/surf) | 是 | 2026-08-02 | 9 | 1 |
| [all-in-one-bot](https://github.com/prodmanpd/all-in-one-bot) | 是 | 2026-08-02 | 14 | 2 |
| [cltk](https://github.com/prodmanpd/cltk) | 是 | 2026-08-02 | 2 | 1 |
| [memind](https://github.com/prodmanpd/memind) | 是 | 2026-08-02 | 1 | 0 |
| [agents](https://github.com/prodmanpd/agents) | 是 | 2026-08-02 | 2 | 1 |
| [atmosphere](https://github.com/prodmanpd/atmosphere) | 是 | 2026-08-03 | 2 | 1 |
| [waku-agent](https://github.com/prodmanpd/waku-agent) | 是 | 2026-08-03 | 2 | 1 |
| [superlog](https://github.com/prodmanpd/superlog) | 是 | 2026-08-03 | 2 | 2 |
| [notesGPT](https://github.com/prodmanpd/notesGPT) | 是 | 2026-08-03 | 2 | 1 |
| [llamacoder](https://github.com/prodmanpd/llamacoder) | 是 | 2026-08-03 | 1 | 0 |
| [k8sgpt](https://github.com/prodmanpd/k8sgpt) | 是 | 2026-08-03 | 2 | 2 |
| [BotSharp](https://github.com/prodmanpd/BotSharp) | 是 | 2026-08-06 | 2 | 1 |
| [comp](https://github.com/prodmanpd/comp) | 是 | 2026-08-06 | 2 | 1 |
| [tradememory-protocol](https://github.com/prodmanpd/tradememory-protocol) | 是 | 2026-08-07 | 2 | 2 |
| [NornicDB](https://github.com/prodmanpd/NornicDB) | 是 | 2026-08-07 | 2 | 1 |
| [versus-incident](https://github.com/prodmanpd/versus-incident) | 是 | 2026-08-07 | 2 | 1 |
| [AI-Youtube-Shorts-Generator](https://github.com/prodmanpd/AI-Youtube-Shorts-Generator) | 是 | 2026-08-07 | 2 | 1 |
| [adk-java](https://github.com/prodmanpd/adk-java) | 是 | 2026-08-07 | 1 | 0 |
| [Git-Friend](https://github.com/prodmanpd/Git-Friend) | 是 | 2026-08-08 | 2 | 1 |
| [yomo](https://github.com/prodmanpd/yomo) | 是 | 2026-08-09 | 1 | 0 |
| [AI-Studio](https://github.com/prodmanpd/AI-Studio) | 是 | 2026-08-10 | 2 | 1 |
| [nextai-translator](https://github.com/prodmanpd/nextai-translator) | 是 | 2026-08-11 | 2 | 1 |
| [trpc-agent-go](https://github.com/prodmanpd/trpc-agent-go) | 是 | 2026-08-13 | 2 | 4 |
| [pyvideotrans](https://github.com/prodmanpd/pyvideotrans) | 是 | 2026-08-13 | 2 | 2 |
| [LLMTornado](https://github.com/prodmanpd/LLMTornado) | 是 | 2026-08-13 | 2 | 3 |
| [continue](https://github.com/prodmanpd/continue) | 是 | 2026-08-13 | 2 | 3 |
| [LEANN](https://github.com/prodmanpd/LEANN) | 是 | 2026-08-13 | 2 | 6 |
| [SWE-bench](https://github.com/prodmanpd/SWE-bench) | 是 | 2026-08-13 | 2 | 2 |
| [LLPlayer](https://github.com/prodmanpd/LLPlayer) | 是 | 2026-08-13 | 1 | 0 |
| [connectonion](https://github.com/prodmanpd/connectonion) | 是 | 2026-08-13 | 1 | 0 |
| [SmartSub](https://github.com/prodmanpd/SmartSub) | 是 | 2026-08-14 | 2 | 2 |
| [ClawBench](https://github.com/prodmanpd/ClawBench) | 是 | 2026-08-17 | 2 | 1 |
| [ragas](https://github.com/prodmanpd/ragas) | 是 | 2026-08-17 | 3 | 0 |
| [UltraRAG](https://github.com/prodmanpd/UltraRAG) | 是 | 2026-08-19 | 2 | 2 |
| [Chat2DB](https://github.com/prodmanpd/Chat2DB) | 是 | 2026-08-23 | 2 | 1 |
| [oneuptime](https://github.com/prodmanpd/oneuptime) | 是 | 2026-08-23 | 1 | 0 |
| [CowAgent](https://github.com/prodmanpd/CowAgent) | 是 | 2026-08-23 | 2 | 1 |
| [AI-Infra-Guard](https://github.com/prodmanpd/AI-Infra-Guard) | 是 | 2026-08-23 | 2 | 1 |
| [SQLBot](https://github.com/prodmanpd/SQLBot) | 是 | 2026-08-23 | 1 | 0 |
| [PixelRAG](https://github.com/prodmanpd/PixelRAG) | 是 | 2026-08-23 | 2 | 1 |
| [Graft](https://github.com/prodmanpd/Graft) | 是 | 2026-08-23 | 2 | 1 |
| [claude-engineer](https://github.com/prodmanpd/claude-engineer) | 是 | 2026-08-24 | 1 | 0 |
| [cortex-app](https://github.com/prodmanpd/cortex-app) | 是 | 2026-08-24 | 2 | 3 |
| [synthadoc](https://github.com/prodmanpd/synthadoc) | 是 | 2026-08-24 | 1 | 0 |
| [marker](https://github.com/prodmanpd/marker) | 是 | 2026-08-27 | 2 | 2 |
| [DeepCode](https://github.com/prodmanpd/DeepCode) | 是 | 2026-08-28 | 1 | 0 |
| [WeKnora](https://github.com/prodmanpd/WeKnora) | 是 | 2026-08-28 | 2 | 2 |
| [data-juicer](https://github.com/prodmanpd/data-juicer) | 是 | 2026-08-28 | 2 | 3 |
| [VideoCaptioner](https://github.com/prodmanpd/VideoCaptioner) | 是 | 2026-08-28 | 1 | 0 |
| [zotero-arxiv-daily](https://github.com/prodmanpd/zotero-arxiv-daily) | 是 | 2026-08-28 | 2 | 2 |
| [Yuxi](https://github.com/prodmanpd/Yuxi) | 是 | 2026-08-30 | 1 | 0 |
| [FAROS](https://github.com/prodmanpd/FAROS) | 是 | 2026-08-30 | 1 | 0 |
| [chats](https://github.com/prodmanpd/chats) | 是 | 2026-08-30 | 2 | 1 |
| [ragent](https://github.com/prodmanpd/ragent) | 是 | 2026-08-30 | 2 | 1 |
| [webclaw](https://github.com/prodmanpd/webclaw) | 是 | 2026-08-30 | 2 | 3 |
| [YouDub-webui](https://github.com/prodmanpd/YouDub-webui) | 是 | 2026-09-03 | 2 | 3 |
| [ruoyi-ai](https://github.com/prodmanpd/ruoyi-ai) | 是 | 2026-09-05 | 2 | 1 |
| [gonzo](https://github.com/prodmanpd/gonzo) | 是 | 2026-09-05 | 2 | 1 |
| [HelloAgents](https://github.com/prodmanpd/HelloAgents) | 是 | 2026-09-05 | 2 | 2 |
| [goclaw](https://github.com/prodmanpd/goclaw) | 是 | 2026-09-05 | 1 | 0 |
| [OpenExecutive](https://github.com/prodmanpd/OpenExecutive) | 是 | 2026-09-05 | 2 | 1 |
| [inspect_ai](https://github.com/prodmanpd/inspect_ai) | 是 | 2026-09-07 | 1 | 0 |
| [Agentic-Bug-Hunter](https://github.com/prodmanpd/Agentic-Bug-Hunter) | 是 | 2026-09-07 | 2 | 1 |
| [OpenJudge](https://github.com/prodmanpd/OpenJudge) | 是 | 2026-09-07 | 2 | 1 |

## 全部 122 个唯一提交 SHA

按 author date 排序；日期可由作者设置。上游 squash 与原始提交可表示同一逻辑变更，不能重复解读为不同活动。

| 提交 | Author date（UTC） | 提交标题 |
| --- | --- | --- |
| [yilewang/llm-for-zotero · 65508a9625](https://github.com/yilewang/llm-for-zotero/commit/65508a96259880b59e1262fcc467e31188fa6b22) | 2026-07-17T15:13:40Z | feat: add LiteLLM provider preset |
| [microsoft/TinyTroupe · 8b4cb26a94](https://github.com/microsoft/TinyTroupe/commit/8b4cb26a947162251c1d1cb21e4f3c5789da9d87) | 2026-07-17T15:35:12Z | feat: add LiteLLM client for multi-provider support |
| [xunbu/docutranslate · e0e15346bf](https://github.com/xunbu/docutranslate/commit/e0e15346bf2f159e25ac9cb87f0a3b49b79e0d8c) | 2026-07-17T16:23:44Z | feat: add LiteLLM provider support |
| [polyrabbit/hacker-news-digest · dc187b91c5](https://github.com/polyrabbit/hacker-news-digest/commit/dc187b91c543ee743ff53b6a76cd15a72eddb8ce) | 2026-07-17T17:02:06Z | feat: add LiteLLM provider for multi-model summarization |
| [modelscope/FunClip · 6e78ab3b27](https://github.com/modelscope/FunClip/commit/6e78ab3b277a1202c46e3b011f61f7ec4def5991) | 2026-07-17T17:16:36Z | feat: add LiteLLM provider for multi-model LLM clipping |
| [microsoft/TinyTroupe · e6cc3e0507](https://github.com/microsoft/TinyTroupe/commit/e6cc3e0507fc48baf138cf4073de934ca12bf633) | 2026-07-17T17:30:11Z | test: add 16 unit tests + fix exception handling |
| [xunbu/docutranslate · 507e78c6f5](https://github.com/xunbu/docutranslate/commit/507e78c6f5f2d78d605e7464de0a4bc88b0422bf) | 2026-07-17T17:32:29Z | test: add 12 tests + fix localhost detection bug |
| [polyrabbit/hacker-news-digest · 041779019f](https://github.com/polyrabbit/hacker-news-digest/commit/041779019f7e9c13e2d21e03111c04c2af9dbb4b) | 2026-07-17T17:36:06Z | test: add 13 tests + fix exception handling and empty response |
| [modelscope/FunClip · e2d01c4f9b](https://github.com/modelscope/FunClip/commit/e2d01c4f9bb31854d0bcf7452abc1d6e7bbb9b99) | 2026-07-17T17:37:24Z | test: add 14 tests + fix exception handling and empty response |
| [yilewang/llm-for-zotero · 816c5e039a](https://github.com/yilewang/llm-for-zotero/commit/816c5e039ad6783b61a0a7e35a63d27929a06720) | 2026-07-17T17:39:22Z | test: add edge case tests for litellm preset detection |
| [polyrabbit/hacker-news-digest · b3c77c464f](https://github.com/polyrabbit/hacker-news-digest/commit/b3c77c464fec5953f8321bd22be6ce65b00e6c96) | 2026-07-17T18:22:53Z | fix: CJK translation bug + remove openai SDK dependency |
| [yilewang/llm-for-zotero · 69f64c42c4](https://github.com/yilewang/llm-for-zotero/commit/69f64c42c46f896cd56ba45a7eef6c5a379b3d7a) | 2026-07-17T18:37:50Z | fix: only match litellm by hostname, not by port |
| [yilewang/llm-for-zotero · 698eefc08d](https://github.com/yilewang/llm-for-zotero/commit/698eefc08d2b6a52d0d0c9b8b72f5096788ef03e) | 2026-07-17T18:43:28Z | fix: litellm is manual-select only, no URL auto-detection |
| [xunbu/docutranslate · 4f0c220e9b](https://github.com/xunbu/docutranslate/commit/4f0c220e9b91576d855d906fa05dd4efb5c6e6fa) | 2026-07-17T18:59:45Z | fix: remove hostname auto-detection, litellm set via --provider flag |
| [polyrabbit/hacker-news-digest · 904e3be46a](https://github.com/polyrabbit/hacker-news-digest/commit/904e3be46a8df1dac5c75e1f614afa13bf619342) | 2026-07-17T19:08:54Z | feat: add LITELLM_API_BASE for self-hosted proxy support |
| [modelscope/FunClip · 849ef93277](https://github.com/modelscope/FunClip/commit/849ef93277c8221ab4cbe37dadfd03119562da83) | 2026-07-17T19:15:23Z | feat: add LITELLM_API_BASE for self-hosted proxy support |
| [yilewang/llm-for-zotero · 49abae562f](https://github.com/yilewang/llm-for-zotero/commit/49abae562ffd1d40d0ad436d5b43b7d6e6370d0f) | 2026-07-17T19:50:07Z | feat: add model auto-discovery from litellm proxy /v1/models |
| [xunbu/docutranslate · 3a7e7e2e31](https://github.com/xunbu/docutranslate/commit/3a7e7e2e3126654948eb37f2df9dbffb239e5cb0) | 2026-07-17T19:58:48Z | feat: add litellm SDK code path for sync and async calls |
| [modelscope/FunClip · 50155e4097](https://github.com/modelscope/FunClip/commit/50155e4097356ef9793259224119126fbc3f11db) | 2026-07-18T02:08:05Z | Feat/add litellm provider (#178) |
| [prodmanpd/beelzebub · 0d5619265e](https://github.com/prodmanpd/beelzebub/commit/0d5619265e66dace3a329487d51f72c392aefb3a) | 2026-07-27T09:37:06Z | feat: add LiteLLM as LLM provider |
| [prodmanpd/blades · 9fc61d2f9e](https://github.com/prodmanpd/blades/commit/9fc61d2f9e9b02c6111f92a489b749222f3f6f61) | 2026-07-27T09:56:13Z | feat: add LiteLLM as AI gateway provider |
| [prodmanpd/bolt-python-ai-chatbot · 3e581b2e7f](https://github.com/prodmanpd/bolt-python-ai-chatbot/commit/3e581b2e7f9c7501d4d2ae3e2741f28cfeb1fdca) | 2026-08-02T18:28:45Z | fix: harden LiteLLM provider handling |
| [prodmanpd/bolt-python-ai-chatbot · 0788dc842b](https://github.com/prodmanpd/bolt-python-ai-chatbot/commit/0788dc842b139ef4530b0fb7e1fe0ea6aaf34b30) | 2026-08-02T18:28:45Z | feat: add LiteLLM provider |
| [prodmanpd/all-in-one-bot · cbc587dd0b](https://github.com/prodmanpd/all-in-one-bot/commit/cbc587dd0be05fb3c5dc4f439107ac49e93cccbc) | 2026-08-02T18:28:45Z | test: strengthen LiteLLM gateway coverage |
| [chartbrew/chartbrew · b23fd67360](https://github.com/chartbrew/chartbrew/commit/b23fd67360f164dc9fe1f79041d529520561e6f5) | 2026-08-02T18:28:45Z | feat: add OpenAI-compatible base URL support |
| [prodmanpd/comanda · 7d534c7183](https://github.com/prodmanpd/comanda/commit/7d534c7183f943272c71c70cb3c43d49b9304e83) | 2026-08-02T18:28:45Z | test: harden LiteLLM provider handling |
| [prodmanpd/all-in-one-bot · 49e06b7cb8](https://github.com/prodmanpd/all-in-one-bot/commit/49e06b7cb8bf78b604f56b6952f31ebd9fc1a359) | 2026-08-02T18:28:45Z | feat: support LiteLLM chat provider |
| [itsOwen/CyberScraper-2077 · 90f051a54c](https://github.com/itsOwen/CyberScraper-2077/commit/90f051a54ce02efc05ee552dbeef4019865344e7) | 2026-08-02T18:28:45Z | feat: support LiteLLM proxy models |
| [chartbrew/chartbrew · 0fefa20573](https://github.com/chartbrew/chartbrew/commit/0fefa20573e9b0c732deea7e93541a686aa83853) | 2026-08-02T18:28:45Z | test: strengthen LiteLLM gateway coverage |
| [itsOwen/CyberScraper-2077 · 9253c0142d](https://github.com/itsOwen/CyberScraper-2077/commit/9253c0142dc14afd27975e92b680d336b3b2a452) | 2026-08-02T18:28:45Z | test: strengthen LiteLLM gateway coverage |
| [prodmanpd/eslint-doc-generator · dd16798872](https://github.com/prodmanpd/eslint-doc-generator/commit/dd16798872b253ebe993f80a427ca259182f24ff) | 2026-08-02T18:28:45Z | test: strengthen LiteLLM gateway coverage |
| [prodmanpd/eslint-doc-generator · 8d28b16be5](https://github.com/prodmanpd/eslint-doc-generator/commit/8d28b16be5cf453d53ca73fba45b4aa1bb656d46) | 2026-08-02T18:28:45Z | feat: add LiteLLM AI provider |
| [prodmanpd/comanda · e274220b26](https://github.com/prodmanpd/comanda/commit/e274220b268ffb2dd4f903d98870ca37c6ad6e63) | 2026-08-02T18:28:45Z | feat: add LiteLLM provider |
| [e2b-dev/surf · c36d1842dd](https://github.com/e2b-dev/surf/commit/c36d1842dd5f1873873e1b75907c8740e12e9ffd) | 2026-08-02T19:51:37Z | feat: add LiteLLM gateway support |
| [cltk/cltk · 32ddf3b68a](https://github.com/cltk/cltk/commit/32ddf3b68a2b9111f6ea59949cba423bd7276c2b) | 2026-08-02T20:03:49Z | feat: add LiteLLM backend |
| [inkeep/agents · 62759e2b80](https://github.com/inkeep/agents/commit/62759e2b805d297fa77957893fca84c51669f94e) | 2026-08-03T00:26:14Z | feat: add LiteLLM as an OpenAI-compatible model provider |
| [Atmosphere/atmosphere · 6c8d08c6c3](https://github.com/Atmosphere/atmosphere/commit/6c8d08c6c378c3a964af2177f1af9336954b6c5f) | 2026-08-03T00:56:48Z | feat(ai): add LiteLLM proxy quick factory to OpenAiCompatibleClient |
| [ShenSeanChen/waku-agent · 327ff56289](https://github.com/ShenSeanChen/waku-agent/commit/327ff5628969ea07bb21fe74f186e2b24bb2bd1f) | 2026-08-03T12:09:51Z | feat: add LiteLLM proxy as a provider |
| [prodmanpd/superlog · 5548657b5f](https://github.com/prodmanpd/superlog/commit/5548657b5f8731963b8d964dfe6fb748d03b867f) | 2026-08-03T12:39:37Z | feat(worker): support routing Anthropic calls through ANTHROPIC_BASE_URL |
| [prodmanpd/superlog · 03a2b5dbdf](https://github.com/prodmanpd/superlog/commit/03a2b5dbdf445f288716227fb813507aebeb1623) | 2026-08-03T13:43:30Z | feat(api): route the Claude Code gateway upstream through ANTHROPIC_BASE_URL |
| [Nutlope/notesGPT · 7ac2821967](https://github.com/Nutlope/notesGPT/commit/7ac28219671c0e2ac269b6baafb7e6df14f994ab) | 2026-08-03T15:21:19Z | feat: add optional LiteLLM gateway support for chat + embeddings |
| [k8sgpt-ai/k8sgpt · 06a8cf2e4e](https://github.com/k8sgpt-ai/k8sgpt/commit/06a8cf2e4eecff25ab495ea26050e32a13599ee9) | 2026-08-03T16:21:21Z | feat: add LiteLLM backend |
| [k8sgpt-ai/k8sgpt · 7e8dd20dae](https://github.com/k8sgpt-ai/k8sgpt/commit/7e8dd20dae88d9102f94d3a533eabeca809174ed) | 2026-08-03T16:27:12Z | fix: guard against empty completion choices in litellm backend |
| [Atmosphere/atmosphere · 28572b3a75](https://github.com/Atmosphere/atmosphere/commit/28572b3a751b1ad006a6247269ca37704ee35297) | 2026-08-04T20:56:55Z | feat(ai): add LiteLLM proxy quick factory to OpenAiCompatibleClient |
| [SciSharp/BotSharp · 2e7dbe7cf8](https://github.com/SciSharp/BotSharp/commit/2e7dbe7cf8c8daef07a277d4a5566bf349b2a6c2) | 2026-08-06T18:24:54Z | feat: add LiteLLM as AI gateway provider |
| [prodmanpd/comp · 1989e5837a](https://github.com/prodmanpd/comp/commit/1989e5837a51c4e19242c4ee7eafec6beded1934) | 2026-08-06T18:48:46Z | feat(api): add LiteLLM gateway support for the GRC assistant |
| [mnemox-ai/tradememory-protocol · da9fd82010](https://github.com/mnemox-ai/tradememory-protocol/commit/da9fd82010089c3e0960b03cca8d5aa5ce20bb2b) | 2026-08-07T08:21:25Z | feat: add LiteLLM provider for Evolution LLM client |
| [orneryd/NornicDB · 52f1dfd9fc](https://github.com/orneryd/NornicDB/commit/52f1dfd9fc1e884970aaca9a3080e5ce533aea7f) | 2026-08-07T08:39:45Z | feat: add LiteLLM as a Heimdall chat provider |
| [orneryd/NornicDB · 9a8cd0d8e1](https://github.com/orneryd/NornicDB/commit/9a8cd0d8e160726793e4d5e55ccc10d9638af71d) | 2026-08-07T08:39:45Z | feat: add LiteLLM as a Heimdall chat provider |
| [VersusControl/versus-incident · 2c33b7d7e0](https://github.com/VersusControl/versus-incident/commit/2c33b7d7e0bcc2b50f02522931dc6c7b1aa0de14) | 2026-08-07T11:23:38Z | feat: add LiteLLM as an AI gateway provider |
| [prodmanpd/AI-Youtube-Shorts-Generator · 6bdf862985](https://github.com/prodmanpd/AI-Youtube-Shorts-Generator/commit/6bdf862985ea9bfad5cc4ddd14c89047067e12ce) | 2026-08-07T11:35:32Z | feat: add LiteLLM as a local-mode highlight LLM provider |
| [krishn404/Git-Friend · 781c5117ee](https://github.com/krishn404/Git-Friend/commit/781c5117ee5971ea7954ff97b0e4f6c03ca2ebe4) | 2026-08-08T20:16:27Z | feat: add optional LiteLLM proxy provider for LLM calls |
| [MindWorkAI/AI-Studio · e0d7a810ea](https://github.com/MindWorkAI/AI-Studio/commit/e0d7a810ea08f349d8d3fef2890c90a61d2b2fb8) | 2026-08-10T12:43:08Z | Add LiteLLM as a new LLM provider |
| [mnemox-ai/tradememory-protocol · caacbaca9b](https://github.com/mnemox-ai/tradememory-protocol/commit/caacbaca9bc78c88e8120562da82aaaf546c6340) | 2026-08-10T18:20:41Z | chore: bump litellm floor to >=1.87,<2.0 |
| [nextai-translator/nextai-translator · e31b8202fe](https://github.com/nextai-translator/nextai-translator/commit/e31b8202fed2c7eae90abc831d51c04ceaa8c5f9) | 2026-08-11T05:05:14Z | feat: add LiteLLM as AI gateway provider |
| [k8sgpt-ai/k8sgpt · 47db90f4b9](https://github.com/k8sgpt-ai/k8sgpt/commit/47db90f4b99f84b1348bf03bcd34b6d155324212) | 2026-08-11T16:01:42Z | feat: add LiteLLM backend (#1719) |
| [trpc-group/trpc-agent-go · 129d2b02a4](https://github.com/trpc-group/trpc-agent-go/commit/129d2b02a4ee14f853966120e620d89180b1ca55) | 2026-08-13T11:00:42Z | feat: add LiteLLM as an OpenAI-compatible model provider |
| [jianchang512/pyvideotrans · a0fee5724a](https://github.com/jianchang512/pyvideotrans/commit/a0fee5724a59e5dc4406f8226a62c9b50f2b1041) | 2026-08-13T11:25:49Z | feat: add LiteLLM as an AI translation channel |
| [lofcz/LLMTornado · 9158107a2c](https://github.com/lofcz/LLMTornado/commit/9158107a2c89d0de7f902e145a7bf1dbea98862c) | 2026-08-13T12:04:22Z | feat: add LiteLLM AI gateway provider |
| [continuedev/continue · 6efa7e4cc4](https://github.com/continuedev/continue/commit/6efa7e4cc4fe8d9fb02340455c18e58d044a514f) | 2026-08-13T13:23:15Z | feat(llms): add LiteLLM as a model provider |
| [lofcz/LLMTornado · caff79c859](https://github.com/lofcz/LLMTornado/commit/caff79c859df8724b70cf22f00ee3e289e37becb) | 2026-08-13T13:54:45Z | test: add LiteLLM request serialization test + demo |
| [StarTrail-org/LEANN · 570a7d66b1](https://github.com/StarTrail-org/LEANN/commit/570a7d66b13f9a1170966ccaeffc98adc1c7dc63) | 2026-08-13T20:57:59Z | feat: add LiteLLM as an LLM provider |
| [SWE-bench/SWE-bench · 7782de44ed](https://github.com/SWE-bench/SWE-bench/commit/7782de44ed2c0d801e99ee6de4a694220b90a96a) | 2026-08-13T21:12:39Z | feat: add LiteLLM as an inference provider |
| [buxuku/SmartSub · d5e720c1e8](https://github.com/buxuku/SmartSub/commit/d5e720c1e8f9c8efb9cece4ebbd41833b1158df3) | 2026-08-17T10:07:12Z | feat: add LiteLLM as a first-class AI translation provider |
| [TIGER-AI-Lab/ClawBench · a5d00b9d2b](https://github.com/TIGER-AI-Lab/ClawBench/commit/a5d00b9d2b0165aae3dee9cd74f60b008f0c9609) | 2026-08-17T10:23:16Z | feat: add LiteLLM judge api_type |
| [lofcz/LLMTornado · 7479d068d8](https://github.com/lofcz/LLMTornado/commit/7479d068d8b8fc717a7a0cfa3108a701369b7f56) | 2026-08-17T11:15:22Z | feat: LiteLLM embeddings body + model discovery tests |
| [continuedev/continue · f1ea882f99](https://github.com/continuedev/continue/commit/f1ea882f991b3aca0441501d09f4b4e0fef89cf9) | 2026-08-17T11:19:59Z | feat: register LiteLLM in Add Model UI + document AUTODETECT discovery |
| [trpc-group/trpc-agent-go · 2e24772cd9](https://github.com/trpc-group/trpc-agent-go/commit/2e24772cd94b6ff00ce1b0514a97ade6b13a5c27) | 2026-08-17T11:23:03Z | feat: add ListModels discovery to OpenAI-compatible provider |
| [jianchang512/pyvideotrans · 2531e6bd5e](https://github.com/jianchang512/pyvideotrans/commit/2531e6bd5e950ca9c9a113c9e93c77776e76810a) | 2026-08-17T11:33:19Z | feat: route LiteLLM channel through the litellm SDK |
| [StarTrail-org/LEANN · 860c45de14](https://github.com/StarTrail-org/LEANN/commit/860c45de149f58a9248e1fe6c02e3f5162bb771d) | 2026-08-17T14:22:27Z | chore: pin litellm to >=1.85.0,<2.0 |
| [SWE-bench/SWE-bench · f7e51fae98](https://github.com/SWE-bench/SWE-bench/commit/f7e51fae98792ba53d2506c60489b1855718a81d) | 2026-08-17T14:22:31Z | chore: pin litellm to >=1.85.0,<2.0 |
| [buxuku/SmartSub · e18426a0d8](https://github.com/buxuku/SmartSub/commit/e18426a0d8f790adc47dbbdc60b811c43343d98d) | 2026-08-17T14:52:15Z | fix: use the LiteLLM icon for the litellm provider |
| [StarTrail-org/LEANN · 76f29bb00d](https://github.com/StarTrail-org/LEANN/commit/76f29bb00d607be8b6d1d4f17017e715c4af4056) | 2026-08-17T16:13:43Z | test: type fake litellm module as Any to satisfy ty type check |
| [StarTrail-org/LEANN · 3378d525b5](https://github.com/StarTrail-org/LEANN/commit/3378d525b5cfd7af9df0cf4576e587f1612f72be) | 2026-08-17T16:17:14Z | test: write fake litellm attrs via __dict__ to satisfy ty |
| [trpc-group/trpc-agent-go · a485e196c9](https://github.com/trpc-group/trpc-agent-go/commit/a485e196c913485f98039f051ce7546716db8701) | 2026-08-17T16:53:51Z | ci: re-trigger checks after transient GitHub Actions setup-go 429/502 outage |
| [continuedev/continue · 07c4843453](https://github.com/continuedev/continue/commit/07c4843453463599f118f6bcd40ecbbf5b6aaa91) | 2026-08-17T16:58:37Z | ci: re-trigger checks (setup-ffmpeg/e2e infra flake) |
| [StarTrail-org/LEANN · 857f24382e](https://github.com/StarTrail-org/LEANN/commit/857f24382e97f4c47df22e207f69fd52bfe5e6a1) | 2026-08-17T16:59:33Z | ci: install patchelf>=0.14.5 from PyPI for auditwheel on ubuntu-22.04 |
| [trpc-group/trpc-agent-go · ccae1e0832](https://github.com/trpc-group/trpc-agent-go/commit/ccae1e0832bf52bb1412a668135cf6f23b284629) | 2026-08-17T17:03:43Z | Merge branch 'main' of https://github.com/trpc-group/trpc-agent-go into feat/add-litellm-provider |
| [StarTrail-org/LEANN · 194482ef54](https://github.com/StarTrail-org/LEANN/commit/194482ef54dc86bdecbe9728040a26c801244358) | 2026-08-17T20:22:18Z | ci: re-trigger (transient GitHub API outage in setup-uv on macos-15-intel) |
| [nextai-translator/nextai-translator · 678dc3769a](https://github.com/nextai-translator/nextai-translator/commit/678dc3769a12d5040b208e2957dca8a53d3c96c6) | 2026-08-19T07:23:26Z | feat: add LiteLLM as AI gateway provider (#1905) |
| [OpenBMB/UltraRAG · e96432f8e4](https://github.com/OpenBMB/UltraRAG/commit/e96432f8e43475f10fe6b986a1d3e4ef203d167e) | 2026-08-19T12:24:03Z | feat: add LiteLLM as a generation backend |
| [StarTrail-org/LEANN · 356c6ab72b](https://github.com/StarTrail-org/LEANN/commit/356c6ab72b0217e81214baf0b3e3b025862f6b08) | 2026-08-21T05:07:59Z | feat: add LiteLLM as an AI Gateway (#395) |
| [OpenBMB/UltraRAG · 85bc0f5970](https://github.com/OpenBMB/UltraRAG/commit/85bc0f597097ddea8f32b41dbd4fe73e899662b9) | 2026-08-21T15:26:23Z | feat: add LiteLLM embedding backend to retriever |
| [OtterMind/Chat2DB · cab7ecd153](https://github.com/OtterMind/Chat2DB/commit/cab7ecd153654edbbcb8fba633ec2deeacbb409f) | 2026-08-23T16:30:35Z | feat: add LiteLLM as an AI provider |
| [zhayujie/CowAgent · 8cfb66a4cf](https://github.com/zhayujie/CowAgent/commit/8cfb66a4cf3b99dbb9f320b4bdd75621603a19ed) | 2026-08-23T16:55:57Z | feat: add LiteLLM as a provider |
| [StarTrail-org/PixelRAG · 0d2f7bdff1](https://github.com/StarTrail-org/PixelRAG/commit/0d2f7bdff14f54bc2cd163727d97a87e17cf236d) | 2026-08-23T17:29:36Z | feat: add LiteLLM SDK backend to eval client |
| [trailhq/Graft · 1788e9175b](https://github.com/trailhq/Graft/commit/1788e9175b99560ce3798e7272a28061215d0a76) | 2026-08-23T17:41:36Z | feat: add LiteLLM provider with /v1/models discovery |
| [Tencent/AI-Infra-Guard · 9466706f10](https://github.com/Tencent/AI-Infra-Guard/commit/9466706f106d472a76b84d0888df204f9d3741ab) | 2026-08-23T17:42:33Z | feat: route scanners through LiteLLM SDK for multi-provider support |
| [trace-cortex/cortex-app · eac0fc8087](https://github.com/trace-cortex/cortex-app/commit/eac0fc8087ee98cb9b01ababdce1630343fbab96) | 2026-08-24T05:01:13Z | feat: route LLM calls through LiteLLM for multi-provider support |
| [trace-cortex/cortex-app · ec6e2e1826](https://github.com/trace-cortex/cortex-app/commit/ec6e2e182613a86986b638be0df20c8c24aa602a) | 2026-08-24T18:04:21Z | feat: route extractor and embeddings through LiteLLM too |
| [trace-cortex/cortex-app · c3bc8c4e7a](https://github.com/trace-cortex/cortex-app/commit/c3bc8c4e7a0f78957934c4599e862737a94d543f) | 2026-08-24T18:04:56Z | chore: remove stray files accidentally added |
| [trailhq/Graft · b48812ccdb](https://github.com/trailhq/Graft/commit/b48812ccdbdfc29393cf9e3669fee4b61ccfe8c1) | 2026-08-27T13:01:24Z | feat: add LiteLLM provider with /v1/models discovery (#220) |
| [datalab-to/marker · e88b9e0362](https://github.com/datalab-to/marker/commit/e88b9e036201dc2d2d0bef2d809904f15c59498f) | 2026-08-28T18:52:44Z | feat: add LiteLLM as an AI gateway provider |
| [Tencent/WeKnora · ea725662b7](https://github.com/Tencent/WeKnora/commit/ea725662b7f66a54660ef66b4672b528e4c4ea3d) | 2026-08-28T19:18:06Z | feat(provider): add LiteLLM as an OpenAI-compatible provider |
| [datajuicer/data-juicer · 89ffdaacc0](https://github.com/datajuicer/data-juicer/commit/89ffdaacc00491343dd367ec423a681617ab6c45) | 2026-08-28T19:51:14Z | feat: add LiteLLM as an AI gateway backend for API models |
| [TideDra/zotero-arxiv-daily · 29d981b0d0](https://github.com/TideDra/zotero-arxiv-daily/commit/29d981b0d0e693958017f41edb2af5a69b74617f) | 2026-08-28T20:18:42Z | feat: add LiteLLM as an optional LLM backend |
| [TideDra/zotero-arxiv-daily · 41c9552c1e](https://github.com/TideDra/zotero-arxiv-daily/commit/41c9552c1e50630bbfeb1252ef0439d054889e4e) | 2026-08-28T20:34:42Z | feat: route the API reranker embeddings through LiteLLM too |
| [datajuicer/data-juicer · fe3839bf5c](https://github.com/datajuicer/data-juicer/commit/fe3839bf5cd474fc59f7f99aeccd7fb55b2c37e1) | 2026-08-28T20:46:46Z | feat: add LiteLLM responses-API backend for /responses endpoint |
| [StarTrail-org/PixelRAG · 0ecf227d2f](https://github.com/StarTrail-org/PixelRAG/commit/0ecf227d2f7d12696865f929dcb4d84fc0ba189b) | 2026-08-30T02:04:42Z | feat: add LiteLLM SDK backend to eval client (#145) |
| [MindWorkAI/AI-Studio · 5966f0f6a5](https://github.com/MindWorkAI/AI-Studio/commit/5966f0f6a5d9488cc99428d335c400300b05a562) | 2026-08-30T10:55:18Z | Added LiteLLM as a new LLM provider (#909) |
| [sdcb/chats · 64431246e8](https://github.com/sdcb/chats/commit/64431246e8703af87832117af79dc427ec182fa4) | 2026-08-30T18:16:53Z | feat: add LiteLLM as AI gateway provider |
| [nageoffer/ragent · 41c082ed3f](https://github.com/nageoffer/ragent/commit/41c082ed3f62462ebf88f6416f7f36b5057de5f3) | 2026-08-30T18:38:04Z | feat: add LiteLLM as AI gateway provider |
| [0xMassi/webclaw · 66be02f884](https://github.com/0xMassi/webclaw/commit/66be02f88483902548b663486b9b681f184e1b14) | 2026-08-30T19:15:03Z | feat: add LiteLLM as an optional OpenAI-compatible provider |
| [0xMassi/webclaw · 397c361d02](https://github.com/0xMassi/webclaw/commit/397c361d02216eca17199dd35004f2591ada1588) | 2026-08-30T19:47:13Z | docs: mention LiteLLM in provider-chain comment and README env table |
| [datalab-to/marker · 29a3d4298d](https://github.com/datalab-to/marker/commit/29a3d4298d1cc8acb5637a8a859ed4ad20ab08e3) | 2026-08-31T14:54:59Z | chore: regenerate uv.lock with minimal litellm additions |
| [Tencent/WeKnora · 5e0034bb3b](https://github.com/Tencent/WeKnora/commit/5e0034bb3b953c7a6c0e4e41a07fc868b03d47bc) | 2026-08-31T16:00:18Z | docs: use revive-compliant comment for ProviderLiteLLM const |
| [0xMassi/webclaw · 345422db95](https://github.com/0xMassi/webclaw/commit/345422db95377c8ee2a3ad46392419fd3c7e4d73) | 2026-08-31T16:55:13Z | fix: address review - ignore env-dependent default-model test, document LITELLM_MODEL, generic changelog wording |
| [SWE-bench/SWE-bench · d65695fd38](https://github.com/SWE-bench/SWE-bench/commit/d65695fd38d4bbd211ddd1f25fcee3c425b91170) | 2026-08-31T18:31:28Z | feat: add LiteLLM as an inference provider (#639) |
| [hrfan/smart-go · db05a64caa](https://github.com/hrfan/smart-go/commit/db05a64caade049f1e769f319981698b466d016d) | 2026-09-01T04:21:03Z | feat: add LiteLLM as a model provider (#2923) |
| [OpenBMB/UltraRAG · 37e0cce42e](https://github.com/OpenBMB/UltraRAG/commit/37e0cce42e2156d710467cde77a2c0fd0114a2c4) | 2026-09-02T11:43:18Z | feat: add LiteLLM backend (#496) |
| [liuzhao1225/YouDub-webui · dacb9af363](https://github.com/liuzhao1225/YouDub-webui/commit/dacb9af363a7f497e6dd64354653e12a93447a0c) | 2026-09-04T07:11:15Z | feat: add optional LiteLLM transport for translation |
| [datajuicer/data-juicer · 71b6c7029a](https://github.com/datajuicer/data-juicer/commit/71b6c7029a6446ee79826b2f3b6a95a76debe7dd) | 2026-09-05T03:06:45Z | feat: replace use_litellm flag with api_backend option; scope OpenAI/DashScope env merge to openai_compatible path |
| [ageerle/ruoyi-ai · b1104c8ac6](https://github.com/ageerle/ruoyi-ai/commit/b1104c8ac609b5ca22a14f8c78312fd137c1e191) | 2026-09-05T03:52:56Z | feat: add LiteLLM as chat and embedding provider |
| [prodmanpd/gonzo · 0d2c8b7cd7](https://github.com/prodmanpd/gonzo/commit/0d2c8b7cd71d32f57fef708c60283f28a47379c4) | 2026-09-05T04:22:27Z | feat: add LiteLLM as an AI provider |
| [jjyaoao/HelloAgents · 166efeed3a](https://github.com/jjyaoao/HelloAgents/commit/166efeed3ae011c40fa3b1ea4d5e0643d3fca558) | 2026-09-05T04:59:11Z | feat: add LiteLLM as AI gateway provider |
| [SenteLabsAI/OpenExecutive · cf6903bb34](https://github.com/SenteLabsAI/OpenExecutive/commit/cf6903bb342c32a0772eee4009472ee2339dbdbd) | 2026-09-05T06:04:43Z | feat: add LiteLLM as an LLM gateway provider |
| [datajuicer/data-juicer · 34ce63c5b8](https://github.com/datajuicer/data-juicer/commit/34ce63c5b86e11c27c9b47f69c447e0520f21e4a) | 2026-09-07T03:23:09Z | feat: add litellm provider (#1062) |
| [Awarexone/Agentic-Bug-Hunter · bf3866fc64](https://github.com/Awarexone/Agentic-Bug-Hunter/commit/bf3866fc646474035e01a962c510f5034455640a) | 2026-09-07T20:04:39Z | feat: add LiteLLM as a multi-provider gateway backend |
| [agentscope-ai/OpenJudge · 7ecfc3bee7](https://github.com/agentscope-ai/OpenJudge/commit/7ecfc3bee7849d04a3a0c891e9f49ed0b3025de2) | 2026-09-08T06:35:31Z | feat: add LiteLLM as a first-class chat model provider |
| [jjyaoao/HelloAgents · 92d62462b1](https://github.com/jjyaoao/HelloAgents/commit/92d62462b1e68febca781d134005d92b84d239a8) | 2026-09-08T06:56:45Z | fix: widen openai pin to <3.0.0 so the litellm extra resolves |
| [liuzhao1225/YouDub-webui · 5901bd272c](https://github.com/liuzhao1225/YouDub-webui/commit/5901bd272c366dc62fc95936d98cd56f7edac311) | 2026-09-08T18:50:37Z | chore: declare litellm in requirements.txt instead of a dedicated file |
| [liuzhao1225/YouDub-webui · 1add1b6d90](https://github.com/liuzhao1225/YouDub-webui/commit/1add1b6d90795ddc222c3f5021305a2e8d953a17) | 2026-09-08T18:51:05Z | chore: add litellm to requirements.txt and update adapter note |

## 证据保存与限制

本仓库保存 49 个 PR 的时间、固定 head/base SHA、逐文件 blob SHA、现存差异的 SHA-256、版本约束摘录，以及 122 个提交和 85 个仓库的公开技术元数据。哈希只能辅助核对内容，无法代替原始内容或提供第三方可信时间戳；此仓库不是完整源码、全部评论或已删除历史的镜像。原始采集资料另在本地保存。

私有仓库、已删除分支、不可达提交、其他账号和未索引记录不在覆盖范围。Git author date 可自行设置；时间线优先依据 GitHub PR 创建时间。SDK/代理分类依据新增调用静态识别，需要结合部署方式解释。

本记录没有发现该贡献者与历史投毒的证据联系。静态筛查没有命中不代表整个依赖树安全。邮件与私人联系方式不纳入公开资料。欢迎作者和维护者提交带来源的澄清、更正；请在相关技术讨论中交流，避免人身攻击或重复刷屏。
