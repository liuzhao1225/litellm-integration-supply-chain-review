# 贡献关系与 PR 统计口径核验

查询时间：2026-09-09 **02:16:36–02:18:02 UTC**。本次新增的结论是：原 49 条来自无 LiteLLM 关键词的作者 PR 查询；当前同类公开查询得到 50 条。所查讨论没有新增委托、赞助、协调或制品发布权限说明。数据见[查询方法](query-method.json)、[讨论状态](discussion-status.json)、[角色证据](role-evidence.json)及[来源与响应哈希](source-manifest.json)。

## 原 49 条的采集方法已确认

原始执行记录中的准确命令为：

```sh
gh api 'search/issues?q=author%3Aprodmanpd+type%3Apr&per_page=100&sort=created&order=asc'
```

该调用于 **2026-09-08 19:10:14.824 UTC** 发起，完成输出记录时间为 **19:10:24.967 UTC**；时间来自包围查询的本地工具调用，不是 HTTP 服务端时间。查询解码为 `author:prodmanpd type:pr`，没有 LiteLLM 关键词。默认第 1 页、每页 100 条，没有 `--paginate`；保存响应的 `total_count=49`、实得 49、`incomplete_results=false`，已覆盖当时报告的结果。响应 URL 集合与 [data/prs.json](../../data/prs.json) 的 49 条完全一致。后续采集脚本直接遍历全部 `items`，没有 LiteLLM 筛选，并分页读取各 PR 文件、提交及讨论。[方法、两份原始文件的字节数与 SHA-256](query-method.json)。

原始查询未显式添加 `is:public`，使用当时认证可见范围；返回的 49 条均对应既有公开 PR 目录。原始会话全文不公开，本地仅保存方法摘录。此方法证据支持“当时检索可见的 49 个作者 PR 全围绕 LiteLLM”；账号其他类型活动、私有或已删除 PR，以及生态中其他贡献者的基线仍未被该分母覆盖。

## 当前公开分母为 50 条，新增一条仅有元数据

当前[公开作者 PR 查询](https://github.com/search?q=author%3Aprodmanpd+is%3Apr+is%3Apublic&type=pullrequests)使用 `author:prodmanpd is:pr is:public`，同样没有 LiteLLM 关键词；第 1 页、每页 100 条，返回 `total_count=50`、实得 50、`incomplete_results=false`。50 个标题均含 LiteLLM，旧 49 个 URL 全部仍在。[50 条元数据](pr-metadata.json)。

新增 [control-theory/gonzo #149](https://github.com/control-theory/gonzo/pull/149)，作者 `prodmanpd`，创建于 **2026-09-08 19:11:04 UTC**，晚于原查询完成记录，查询时为 open。作者描述为复用现有 OpenAIClient 接入 LiteLLM proxy、无新增依赖，并声称完成实际端点测试。这些属于作者陈述，本次未读取其代码或验证测试。**原 49 条的 22 SDK / 27 proxy 分类保持原采集范围，新增条目不并入代码核验分类。** 搜索索引延迟和访问可见性仍限制计数；不能以 50 条重复贡献计算攻击概率。

## 最新讨论及公开关系信息

| 来源 | 当前可验证事实 | 说明与边界 |
| --- | --- | --- |
| [LiteLLM #40308](https://github.com/BerriAI/litellm/issues/40308) | open；创建于 09-08 22:00:50 UTC；0 条评论 | 没有可核验的新上游答复。 |
| [YouDub #130](https://github.com/liuzhao1225/YouDub-webui/pull/130) | open、未合并；3 条 issue 评论、1 个 review、1 条行内评论，作者均为 `liuzhao1225`；最后 issue 评论为 09-08 19:32:28 UTC | 均为此前已有的维护者问询/审查；没有 PR 作者新增回复。固定 head 仍为 `1add1b6d90795ddc222c3f5021305a2e8d953a17`。 |
| [Chartbrew #365](https://github.com/chartbrew/chartbrew/pull/365) | open、未合并；5 条 issue 评论，0 review/行内评论；最后一条为 `liuzhao1225` 在 09-08 19:32:50 UTC 的已有提醒 | 作者的[解释](https://github.com/chartbrew/chartbrew/pull/365#issuecomment-5207856315)创建于 08-06 17:34:09 UTC，最后编辑于 17:39:56 UTC；与原始留存正文一致。 |
| [prodmanpd 公开资料](https://api.github.com/users/prodmanpd)、[公开组织](https://api.github.com/users/prodmanpd/orgs) | company/bio 为空、blog 为空字符串；公开组织列表为空 | 未提供关系披露；空字段不能排除未公开雇佣或赞助。 |
| [RheagalFire 公开资料](https://api.github.com/users/RheagalFire)、[公开组织](https://api.github.com/users/RheagalFire/orgs) | company 自填 `ScaledFocus`，blog 自填 `https://behavior.systems/`；公开组织列表为空 | 自填资料不能验证雇佣关系或 LiteLLM 发布身份；未沿网站扩展身份调查。 |
| [RheagalFire 上游 #23276](https://github.com/BerriAI/litellm/pull/23276) | 既有上游参与仍可验证：`CONTRIBUTOR`，head repository 为 BerriAI/litellm，由 Sameerlite 合并；3 条 issue 评论、1 review、1 行内评论均来自自动化账号 | 这些记录没有披露委托、赞助或发布权限。PR 创建和同仓库 head 不识别其准确历史权限，更不建立 PyPI 发布权。 |

Chartbrew 原文短引：“Yes, I have been submitting LiteLLM integrations to open-source projects.” 可验证的是该账号公开作出了说明；关于已有网关团队的使用需求属于作者自述，尚无本次新增的客户需求或商业安排佐证。完整时间、作者、正文哈希及基线比较见[讨论数据](discussion-status.json)。基线比较中相对最初采集新增的三条 `liuzhao1225` 评论，已记录在既有调查中，均不属于本次发现的新回复。

当前没有取得具体构建来源新说明，也没有建立两个账号与历史恶意发布的联系。即使之后出现推广赞助证据，其解释范围首先是贡献来源；恶意代码、未授权发布及贡献者知情参与仍各需独立证据。本次保持未知并结束有界查询，不从无回复推断动机。

## 采集与交付边界

19 个 GitHub API 请求均返回 HTTP 200、CLI exit 0；所有列表均短于每页 100 条，无需后页。原始响应、旧搜索原件、采集脚本和方法摘录仅存 `local/`，不在可发布清单内。公开 JSON 保留 URL、账号、时间、状态、计数、选定陈述与哈希；哈希识别留存快照，不能恢复省略正文或充当独立时间戳。

可发布文件由 [publishable.sha256](publishable.sha256) 限定。未扩大账号名单或项目源码审计，未执行调查代码，未发布评论，未修改主报告或既有证据。最新查询是一次时间点读取，无法观察随后回复或中间短暂编辑。
