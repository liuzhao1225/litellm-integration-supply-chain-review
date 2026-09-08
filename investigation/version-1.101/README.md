# LiteLLM 1.101：版本状态、制品与来源

1.101 已纳入同一项供应链调查。当前可取得的 PyPI 版本为 **1.101.0rc1**，GitHub 对应发布名为 **v1.101.0-rc.1**。两者均按候选版记录，不能把 1.100 的审计结果直接外推到这个版本。[原始状态与八文件身份记录](availability.json)

## 准确版本与发布时间

状态读取时间为 **2026-09-08 21:27:14 UTC**（北京时间 9 月 9 日 05:27）。

| 查询对象 | 实际响应 | 解释 |
| --- | --- | --- |
| [PyPI 1.101.0](https://pypi.org/pypi/litellm/1.101.0/json) | HTTP 404 | 本次查询未取得正式版记录；不证明该版本从未存在或遭删除 |
| [GitHub v1.101.0 Release](https://api.github.com/repos/BerriAI/litellm/releases/tags/v1.101.0) | HTTP 404 | 本次查询未取得这个正式版 Release；不代表查询了所有 Git ref 或镜像 |
| [PyPI 1.101.0rc1](https://pypi.org/pypi/litellm/1.101.0rc1/json) | HTTP 200，7 个 wheel 和 1 个 sdist，均未 yanked | 上传时间为 9 月 6 日 03:06:01.687228–03:06:20.500474 UTC |
| [GitHub v1.101.0-rc.1](https://github.com/BerriAI/litellm/releases/tag/v1.101.0-rc.1) | HTTP 200，prerelease=true | 发布于 9 月 6 日 03:20:59 UTC，Release 作者字段为 github-actions[bot]；自动化账号名称不识别实际操作者 |

八个文件的名称、大小、SHA-256、上传时间和官方下载 URL 均保存在 [availability.json](availability.json)。这是索引所声明的身份；下载后的实体哈希核对单独记录。标签已解析到 commit `eeb7732fc11fd47762ca84cc3fb7cc74235d7097`、tree `502d9ab4cdfaade8c91f78ef81096724c6c68000`，采用固定对象比较。[解析记录](artifacts/tag-resolution.json)

## 下游是否会安装这个候选版

[pip 官方规则](https://pip.pypa.io/en/stable/cli/pip_install/#pre-release-versions)默认选择稳定版本，显式候选版要求或 `--pre` 会允许预发布版本。在存在满足约束的正式版时，不能仅由 YouDub #130 的 `>=1.89.0,<2.0.0` 推出默认安装 1.101.0rc1。其他解析器、已有安装、索引、完整 constraints 和命令选项仍需分别确认。

正式版如果以后发布，应按新文件、上传时间和哈希新增审计对象，不能继承候选版结论。当前没有安装、导入或执行被调查包。

## 核验范围

- 制品方向核对七平台 wheel 的实体哈希、RECORD、Python 来源、依赖声明与启动文件，并优先对照 Linux x86_64 原生入口。
- 构建方向核对 sdist 与 1.100 的 PEP 517、Cargo 锁定依赖、构建脚本及 ABI feature；新增可执行构建路径再追查官方来源。
- 发布方向核对固定标签、Release 说明、公开 workflow 和逐制品构建证明；镜像声明与原始 PyPI 构建分别记录。

## 已取得的定向结果

| 对象 | 观察与解释范围 |
| --- | --- |
| [七平台 wheel](artifacts/README.md) | 七个实体 SHA 均匹配 PyPI，24,236 项 RECORD 哈希通过，未发现所查启动钩子或清单异常；每个平台 2,323 个 Python 文件对应固定 Git，Windows 需结合逐字相同与 CRLF 归一化。内部一致不能证明内容安全。 |
| [源码包与构建](build/README.md) | sdist SHA 匹配；maturin 要求 1.15.0、PyO3 升到 0.29.2、包内明确启用 ABI3。七个 wheel 的生成器字段仍为 maturin 1.9.4，实际构建来源待解释。 |
| [原生入口](artifacts/README.md) | Linux x86 动态 Python 符号为 112 个，新增 PyErr_CheckSignals，均满足 CPython 3.10 Stable ABI 清单。模块初始化变化已记录，不能继承旧版整体等价结论。 |
| [发布认证](release-context/README.md) | 八个 PyPI 文件页面均显示 Trusted Publishing；八个 Integrity 查询均返回无 provenance。公开 GitHub Create Release 是单独的后续流程。 |
| [候选镜像](images/README.md) | 同一固定公钥签名验证成功，两个平台 SLSA 声明与索引摘要绑定，源码 revision 一致；声明没有绑定八个 PyPI 文件。 |
| [两个新增功能边界](runtime-boundaries/README.md) | OpenAI workload identity 需要身份配置且无静态 key；Claude 诊断与 slash-command 写入通过命令触发。没有执行真实身份交换、日志读取或写入。 |

[制品比较](artifacts/metadata-comparison.json)确认基础 14 项依赖和三个 console_scripts 入口与 1.100 相同；依赖变更在可选 extras。Python 内容有 43 个新增、597 个修改文件，这些文件的 Git 来源匹配已经核对，全部行为仍未完成审计。

上述结果尚不足以确认候选版投毒。最具体的来源问题是生成器版本与源码声明的差异，以及原始 wheel 的源码、工具链、feature 集和构建运行尚未形成可验证绑定。所有结果进入[完整调查报告](../../REPORT.zh-CN.md)，保留能够削弱怀疑的证据及未决问题。
