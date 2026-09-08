# LiteLLM 1.101 候选版本的公开发布来源

本次核验对象为 PyPI `1.101.0rc1` 与 GitHub `v1.101.0-rc.1`。正式 `1.101.0` 的 PyPI / GitHub release 先前均返回 404，沿用[已保存的可用性记录](../availability.json)。本任务不下载 wheel、sdist 或镜像层，不执行项目代码，不探测私有仓库。

## 结论

候选 GitHub tag、最终合并提交及公开创建 release 的上下文已经核实。PyPI 八个文件的官方页面均标明使用 Trusted Publishing；对应八个 Integrity API 请求均返回 **404，明确提示该文件无可用 provenance**。两项事实分别说明认证方式与公开制品证明的可用性，可以同时成立。[PyPI 页面字段](pypi-upload-fields.json)、[逐文件 API 状态](pypi-provenance.json)

**当前未取得将这八个 PyPI 制品哈希绑定到具体源码提交、构建 workflow 和发布运行的公开证明。** GitHub release 作者、测试 wheel 的 workflow 名称、镜像签名或镜像 SLSA 声明均不能自动补上这条绑定。证据缺口不能单独推导恶意发布。[发布摘要与边界](release-summary.json)

## GitHub 对象与变更

[候选 release](https://github.com/BerriAI/litellm/releases/tag/v1.101.0-rc.1)的 REST 记录为 `prerelease=true`、`immutable=false`、author=`github-actions[bot]`、published_at=`2026-09-06T03:20:59Z`，没有 release assets。`target_commitish` 为 `litellm_internal_staging`，它不替代固定 tag 解析。

[tag ref](https://api.github.com/repos/BerriAI/litellm/git/ref/tags/v1.101.0-rc.1)直接指向 commit **`eeb7732fc11fd47762ca84cc3fb7cc74235d7097`**，其 tree 为 **`502d9ab4cdfaade8c91f78ef81096724c6c68000`**。GitHub commit 元数据将 author 映射到 `ryan-crabbe-berri`、committer 映射到 `web-flow`，并报告签名验证成功。本任务没有将这项 GitHub 验证状态扩展为独立的发布者身份审计。

该 SHA 与 [PR #39994](https://github.com/BerriAI/litellm/pull/39994) 的 `merge_commit_sha` 精确相等。PR 作者为 `yuneng-berri`，合并于 `2026-09-06T01:12:56Z`；实际提交差异仅在四个 Dockerfile 的现有安装命令添加 `--extra mongodb`。这明确了候选源码末端的变更，不能证明稍后 PyPI 上传使用了这棵树。

release 正文列出 **173 条 PR 变更说明**，Full Changelog 的基线是 **`v1.101.0-dev.2...v1.101.0-rc.1`**。本任务没有把该说明当成完整的 `1.100 → 1.101` 代码审计，也没有核验全部 173 条差异。与发布相关的说明包括 Python 版本兼容、Rust rollout API、依赖子包升级、SDK 懒加载及其撤回、Docker 依赖和 reporter 权限；除下述两项，均保留为 release 的来源声明。

已核验的另一项是 [PR #39922](https://github.com/BerriAI/litellm/pull/39922)：固定 base/head 差异仅将 reporter 的 `issues: write` 与 `pull-requests: read` 改成 `pull-requests: write`。它解决的是 PR 结果评论权限，不是 PyPI 发布授权。[精确 SHA 与核验范围](release-summary.json)

commit 关联 PR API 还返回 12 条 fork/sync PR；这些分支引用相同 commit，没有被当作 12 位候选发布贡献者。

## 公开 workflow 与运行记录

在候选 tag 固定读取并验证了四份 workflow 的 Git blob SHA；公开[摘要](workflow-summary.json)同时保留源文件 SHA-256。

| workflow | 固定源码中实际执行的工作 | 对 PyPI 发布的证明能力 |
| --- | --- | --- |
| [create-release.yml](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/.github/workflows/create-release.yml) | 接受 tag / commit_hash 输入，创建 tag、自动生成 release notes、添加 cosign 说明并发布 GitHub release | 没有构建或上传 PyPI 文件的步骤 |
| [create-release-branch.yml](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/.github/workflows/create-release-branch.yml) | 按输入 SHA 创建 release 分支；正式版本可建立 stable line | 没有 PyPI 上传步骤 |
| [test-rust.yml](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/.github/workflows/test-rust.yml) | Ubuntu / Python 3.12 环境构建测试 wheel，并运行本地 smoke、strip 与 native-route 检查 | 没有将测试 wheel 上传至 PyPI，也未记录这八个发布文件的哈希 |
| [report-rust-release-wheel.yml](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/.github/workflows/report-rust-release-wheel.yml) | 校验同仓库 PR / workflow 元数据，在 PR 上写入结果链接 | 不读取 wheel 制品或执行 PR 代码；没有 PyPI 上传步骤 |

在 09-06T03:15～03:30 的窄查询窗口内，公开 API 返回一条 [Create Release 运行 #34008764140](https://github.com/BerriAI/litellm/actions/runs/34008764140)：

- actor 与 triggering_actor 均为 **`litellm-dispatcher[bot]`**，event=`workflow_dispatch`，结果 success。
- 运行于 `litellm_internal_staging`，运行 head 为 **`11a0c0abf03b036357e4997fe76cf4eb2f04941f`**。该 SHA 与候选 tag 的源码 SHA 不同；分别读取两处的 create-release / create-release-branch 文件，blob SHA 均完全一致。
- Create release 步骤在 **03:20:56～03:20:59Z** 成功，与 release 的 published_at 同秒；后续创建分支任务也成功。这提供了强时间和流程对应关系。
- 本次未取得该运行的 tag / commit_hash 输入值。日志请求返回 HTTP 200，但 `gh` 客户端以退出码 1 拒绝输出终端转义字符，实际获得正文为 0 字节；错误原文保留在[摘要](release-summary.json)。未加绕过选项或重试，不能宣称读到了运行输入。

八个 PyPI 文件的上传记录为 **03:06:01.687228～03:06:20.500474Z**，早于这次公开 GitHub Create Release 运行约 15 分钟。上述公开运行不能作为这些文件上传过程的证明。

## PyPI 认证字段与逐文件 provenance

[官方 PyPI 候选页面](https://pypi.org/project/litellm/1.101.0rc1/)八个 File details 区块均显示 Trusted Publishing 为 Yes，上传客户端为 `twine/6.1.0 CPython/3.13.7`；逐项文件名和 SHA-256 与可用性记录对应。这些字段从 web 读取器呈现的官方页面人工转录，没有伪造该视图的直接 HTTP 状态或响应字节哈希。[逐文件转录](pypi-upload-fields.json)

按照 [PyPI Integrity API](https://docs.pypi.org/api/integrity/) 的具体文件端点，于 **2026-09-08T21:41:48Z～21:41:50Z** 查询七个 wheel 和一个 sdist。八次均为 HTTP 404，响应分别点名对应文件并说明无 provenance；没有把错误转成成功空结果。[文件哈希、精确 URL、时间及错误正文](pypi-provenance.json)

Trusted Publishing 字段说明发布认证机制，不能单独确定具体操作者、源码或构建参数；Integrity 404 表示本次没有取得该文件的公开证明，也不否定已经显示的认证机制。

## 镜像证据的边界

release 正文给出的镜像名为 `ghcr.io/berriai/litellm:v1.101.0-rc.1`，并引用固定公钥提交 `0112e53046018d726492c814b3644b7d376029d0`。正文声称镜像签名及 tag 保护，属于发布说明；镜像的独立签名和 SLSA 核验由主调查完成，见[候选镜像核验](../images/verification.json)。本任务没有重复请求 registry。

此前 1.100 镜像声明中的 `skip_components=pypi-litellm` 只属于那份声明。候选镜像声明没有该字段，也不能据缺省值推导 PyPI 制品已被绑定。镜像 subject 与 PyPI 文件 subject 必须分别核对；本报告未请求任何私有 `project-releaser` 仓库、workflow 或运行日志。

## 公开白名单

仅公开 `README.md`、`release-summary.json`、`workflow-summary.json`、`pypi-provenance.json`、`pypi-upload-fields.json`、`publishable.sha256`。原始 `local/` 响应与 workflow 文本、`probe.py` 仅本地保留；公开摘要没有原始 commit 邮箱、完整评论、认证凭据或临时下载 token。没有发布评论、commit 或 push。
