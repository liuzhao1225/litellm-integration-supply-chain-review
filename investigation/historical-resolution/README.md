# 历史恶意版本：约束范围与索引可用性的区别

结论：MemoryOS 与 ha-llmvision 的固定依赖范围从版本比较上允许 `1.82.7`、`1.82.8`，但**当前 PyPI 官方简单索引和阿里云镜像均没有这两个准确版本的候选文件**。两个 PR 创建于 2026-03-24 事件之后数月；现有证据不支持“这两条 PR 当时安装过恶意版本”。本次没有下载包、执行代码或运行依赖解析器。[精确来源、HTTP 状态、时间及响应哈希](evidence.json)

## PR 时间与固定约束

| 样本 | 真实 PR 创建时间 UTC | 固定 head 的范围 | 距 2026-03-24 的日历天数 |
| --- | --- | --- | --- |
| [MemoryOS #74](https://github.com/BAI-LAB/MemoryOS/pull/74) | 2026-07-08T16:55:43Z | `litellm>=1.80.0` | 106 天 |
| [ha-llmvision #685](https://github.com/valentinfrlch/ha-llmvision/pull/685) | 2026-06-30T20:38:52Z | `litellm>=1.80,<1.88` | 98 天 |

MemoryOS 的固定 head 为 `aa78e1d7f5583bb57e9171f486bac9e995d0beed`，依据[requirements](https://github.com/BAI-LAB/MemoryOS/blob/aa78e1d7f5583bb57e9171f486bac9e995d0beed/memoryos-pypi/requirements.txt)；ha-llmvision 为 `9aeaeb78816aad92b1af7df174f97c23eadd7cfa`，依据[manifest](https://github.com/valentinfrlch/ha-llmvision/blob/9aeaeb78816aad92b1af7df174f97c23eadd7cfa/custom_components/llmvision/manifest.json)。创建时间使用此前成功保存的 GitHub REST `created_at`，不是 commit 作者时间或搜索摘要。此前观察时两条 PR 均为 open、merged_at=null；这不排除有人曾自行使用分支。

两个准确版本均通过这些上下界比较。这个事实没有指定具体被选中的版本、文件 URL、文件哈希或安装时间。

## 当前索引观察

请求开始于 **2026-09-08T21:09:51Z**，全部结束于 **21:09:53Z**；北京时间为 09-09 05:09:51～05:09:53。每个端点各请求一次，没有重试。下表中的 404 保留为原始 HTTP 结果，不转写为成功空响应。

| 来源 | HTTP | 直接观察 |
| --- | --- | --- |
| [PyPI 1.82.7 JSON](https://pypi.org/pypi/litellm/1.82.7/json) | 404 | `Not Found` |
| [PyPI 1.82.8 JSON](https://pypi.org/pypi/litellm/1.82.8/json) | 404 | `Not Found` |
| [PyPI Simple Index](https://pypi.org/simple/litellm/) | 200 | 取得 JSON 索引；精确版本 1.82.7 和 1.82.8 的候选文件数均为 0 |
| [阿里云 Simple Index](https://mirrors.aliyun.com/pypi/simple/litellm/) | 200 | 取得 HTML 索引；两个准确版本的候选链接数均为 0 |

索引筛选以发行文件名中的准确版本为准，没有将 `1.82.70` 或其他带不同版本后缀的发行版算入。仅检查这两个版本的候选元数据，没有请求任何 wheel、sdist 或历史制品直链。

因此，**仅以本次取得的这两份索引内容作为候选来源时，解析器没有这两个版本可选择**。这项结论不能扩展到本地缓存、其他镜像、私有索引、已装环境或直接文件 URL。

## 官方事件说明与历史边界

[LiteLLM 官方事件说明](https://docs.litellm.ai/blog/security-update-march-2026)确认恶意版本为 1.82.7/1.82.8，回顾其在 3 月 24 日公开后被 PyPI 隔离，并说明版本已从 PyPI 移除；页面还包含 3 月 30 日发布 1.83.0 的更新。本次直接读取该页返回 HTTP 200，保存了响应哈希及相关文本特征。[PyPA 固定公告](https://github.com/pypa/advisory-database/blob/b0f7a727494c977b29c998bc9199de5891f8f302/vulns/litellm/PYSEC-2026-2.yaml)也确认这两个恶意版本。

官方页面同时出现“约 40 分钟后隔离”的回顾与更宽的受影响检查时段。本报告只采用 **3 月 24 日事件、随后隔离/移除** 的事实，不拼接出未经统一的分钟级删除时间。当前读取的是官方现行回顾页面，没有取得每个历史时刻的 PyPI 或镜像快照。

判断某一次历史安装，需要该次安装日志、解析报告或锁定文件中的最终版本、来源及哈希，并核对当时使用的索引/缓存。当前索引状态不复原 6 月、7 月的候选集合；版本范围允许某版本，也不证明解析器选择了它或实际下载执行了它。

这两条 PR 的可核验审查点仍是默认安装范围扩大、无确定锁定制品，以及 MemoryOS 正文的 optional 说明与安装清单不一致。不能把这些问题直接转化为“引入了 3 月的恶意文件”或攻击者身份归因。

## 公开文件

仅 `README.md`、`evidence.json`、`publishable.sha256` 可公开。其余单次请求中间记录及 `check.py` 本地保留。未修改前一份五样本交付文件，未联系任何对象。
