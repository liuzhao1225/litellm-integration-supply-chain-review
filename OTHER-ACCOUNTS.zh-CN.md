# LiteLLM 账号与贡献网络索引

本线索调查公开集成活动与 LiteLLM 上游、发布权限、历史攻击之间的可归属关联。完整分析、固定提交和查询限制统一维护在[账号与贡献网络报告](investigation/identity-network/README.md)。YouDub 是发现入口，调查对象是 LiteLLM 供应链。

## 已定位活动

| 对象 | 记录范围 | 证据与限制 |
| --- | --- | --- |
| prodmanpd | 49 个不同项目的 49 个 LiteLLM 集成 PR；22 个 SDK 调用、27 个 proxy 接入 | [PR 索引](PR-INDEX.md)、[约束](data/version-constraint-audit.json)、[锁文件](data/lock-audit.json)。公开搜索不能穷尽私人、删除或未索引活动。 |
| RheagalFire | 45 个不同上游仓库的 45 个已定位 PR；27 个有固定 base/head 差异，18 个仍仅有搜索元数据 | [45 项索引](investigation/identity-network/account-expansion/rheagal-pr-index.json)、[固定提交摘要](investigation/identity-network/account-expansion/pr-snapshot.json)、[五个补充样本](investigation/contributor-samples/README.md)。未核验的标题不能直接计为 SDK 安装。 |

[账号元数据](https://api.github.com/users/prodmanpd)记录 prodmanpd 创建于 2020-04-07T11:19:35Z；[RheagalFire 元数据](https://api.github.com/users/RheagalFire)记录创建于 2020-01-23T08:20:17Z。注册日期不同，注册也不等于开始贡献或证明控制权始终未变。

## 能区分解释的代码证据

- [Haystack #3257 固定清单](https://github.com/deepset-ai/haystack-core-integrations/blob/1af2c6606191a137ca924a8e72beeb8afb760131/integrations/litellm/pyproject.toml)明确排除 `1.82.7` 和 `1.82.8`，需要保留这项反证。
- [GuideLLM 锁文件核验](investigation/identity-network/account-expansion/guidellm-lock-verification.json)确认 1.95.0 的 16 个 URL/hash 与当前 PyPI 对应。其约束、锁文件使用条件和适用范围见[逐项目分析](investigation/identity-network/README.md)。
- VLMEvalKit 的 requirements 经 setup.py 进入基础安装，尽管 PR 描述称可选；MIRIX 使用可选 extra；MLE-agent 复用 OpenAI 客户端接代理。这些差异均有[固定源码身份与分析](investigation/identity-network/README.md)，不能归成同一种安装路径。
- [上游 #23276](https://github.com/BerriAI/litellm/pull/23276)确立 RheagalFire 的 LiteLLM 上游参与经历。PR 作者和上游分支信息仍不足以证明 PyPI 发布权限、雇佣关系或攻击参与。

## 历史攻击关联

[五个补充样本](investigation/contributor-samples/README.md)确认 MemoryOS 的基础安装与 optional 描述不一致，ha-llmvision 在集成清单中加入 SDK，PyRIT 的最终约束由后续维护者收紧。两个数值范围虽允许历史恶意版本，当前 PyPI/阿里云索引没有相应候选；[时间和索引核验](investigation/historical-resolution/README.md)保留历史安装状态未知。

两个 LiteLLM 披露 issue 的 605 条现存评论中，115 个账号在攻击当天发布了 267 条匹配重复文案的评论。其登录名与此次候选集合无交集；两个集成账号在这些现存评论中也无发言。精确筛选、时间和限制见[评论模式](investigation/identity-network/account-expansion/incident-comment-patterns.json)及[交集记录](investigation/identity-network/account-expansion/summary.json)。这项阴性结果不能排除改名、删除、私有活动或控制权变化。

[历史攻击角色分析](investigation/identity-network/README.md)区分研究归因的攻击者、被盗维护者/服务账号和重复评论账号。相似名称不建立跨平台身份；被盗账号的持有人不能直接列为攻击者。

## 相邻推广模式与公开身份

[账号报告](investigation/identity-network/README.md)保留 Atlas Cloud、同一产品的多仓库配套、本地代理配置等对照案例。XiaoHuo888-hue 在 [ODS #2934](https://github.com/Osmantic/ODS/pull/2934)及 [llm-d #2347](https://github.com/llm-d/llm-d/pull/2347)披露 OrcaRouter 团队身份，其工作使用已有 LiteLLM 路由。这些材料说明跨项目推广存在多种解释，需要具体核验关系和代码。

**当前没有建立 prodmanpd 或 RheagalFire 与已确认恶意发布者、TeamPCP 或披露灌水账号控制者的关联。** 最有区分力的证据仍是可归属的关系披露、制品发布权限、攻击者控制的代码/端点或恶意制品 hash。[发布者查询摘要](investigation/identity-network/publisher-query-summary.json)明确保留公开搜索的范围和阴性结果含义。
