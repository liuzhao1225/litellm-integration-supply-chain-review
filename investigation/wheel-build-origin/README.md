# LiteLLM wheel 构建来源核对

截至 2026-09-09 02:19 UTC，所检查的公开讨论和构建脚本仍未把受审 PyPI wheel 的 SHA-256 与实际构建运行、源码及工具参数连接起来。**候选 1.101.0rc1 的七个 wheel 自报 maturin 1.9.4，源码要求 1.15.0，这个具体差异仍需发布构建记录解释。** 1.99/1.100 另有 ABI3 输入差异。当前结果保留来源证明缺口，未新增投毒实证。[三版本来源矩阵](source-matrix.json)、[先前构建审计](../version-1.101/build/README.md)、[ABI 差异](../abi-compatibility/git-vs-sdist-1.99.0-Cargo.json)。

本目录只读取公开 API、固定源码和已有取证结果。没有安装、导入、编译或执行 LiteLLM、maturin、Cargo 项目或目标 wheel；未再次下载制品，未访问私有发布仓库，未发送上游评论。

## 版本状态与三版本矩阵

2026-09-09 02:13:31 UTC，正式版的 [PyPI 精确接口](https://pypi.org/pypi/litellm/1.101.0/json)和 [GitHub 精确 release 接口](https://api.github.com/repos/BerriAI/litellm/releases/tags/v1.101.0)均返回 404；候选版两接口均返回 200。候选版八个文件的文件名—SHA-256 映射与 2026-09-08 21:27 UTC 的既有记录完全一致。404 仅表示观察时未取得这些精确记录。[版本状态与逐文件时间](version-status.json)、[请求 URL/UTC/状态/响应 SHA](fetch-index.json)。

下表时间统一为 UTC，上传时间指已审计 Linux x86_64 wheel，避免将不同文件上传和 GitHub release 创建混用。矩阵涵盖 1.99 的一个 Linux wheel、1.100 的七个 wheel、候选版七个 wheel；未把未审计的其他 1.99 平台列为已审计。

| 项目 | 1.99.0 | 1.100.0 | 1.101.0rc1 |
| --- | --- | --- | --- |
| Linux x86_64 上传 UTC | 09-01 00:42:51.582238 | 09-06 00:22:31.913161 | 09-06 03:06:09.998121 |
| 对照 Git commit | `fa647f742d7baefe8eb1181899d9c81b41559772` | `e4f25265704e2b2c6cf6e81be2e4c5cffff896f4` | `eeb7732fc11fd47762ca84cc3fb7cc74235d7097` |
| 源码构建要求 | maturin==1.9.4 | maturin==1.9.4 | maturin==1.15.0 |
| WHEEL 自报 Generator | maturin (1.9.4) | 七个均 1.9.4 | 七个均 1.9.4 |
| 嵌入的主要 Rust 修订 | Linux x86_64 对应 1.98.0 | 四个 Linux 对应 1.98.1；Mac/Windows 对应 1.98.0 | 七个均对应 1.98.0 |
| ABI3 源码状态 | Git 未显式启用；sdist 在 pyo3 features 加入 abi3-py310 | Git/sdist 未显式启用，wheel 标签 cp310-abi3 | 默认 abi3 feature 映射到 pyo3/abi3-py310 |
| 具体 wheel 构建运行 | 未取得 | 未取得 | 未取得 |

时间、完整 wheel SHA 和逐平台编译器修订见 [source-matrix.json](source-matrix.json)。来源为先前实际下载哈希核验的 [1.99/1.100 制品记录](../artifact-records/pypi-artifacts.json)、[候选下载记录](../version-1.101/artifacts/download-summary.json)、[原生指纹](../release-chain/native-fingerprints.json)、[候选逐 wheel 审计](../version-1.101/artifacts/wheel-audit-summary.json)；此次未重新下载。

Linux x86_64 wheel SHA-256：

- 1.99.0：`1c45097e426fed2ae7fbd38b5404c3addeb203d0e1148c0a59848aabd5fe83c6`
- 1.100.0：`8224c8eed9cab3319a88e6665d1275ad8faf21d353b1b22223a6d6115a302ea2`
- 1.101.0rc1：`38273b92727303fd6e759fa9306b47c43e52a57c3ce583b239457c7dd5b8e598`

## 直接公开线索的核读结果

完整读取 [Issue #31261](https://github.com/BerriAI/litellm/issues/31261) 正文、八条评论和 28 个 timeline 事件，以及它直接关联的 [PR #31267](https://github.com/BerriAI/litellm/pull/31267) 正文、改动文件和六条评论。对应 API 均未返回分页 Link。评论主要记录 Windows/macOS/Alpine 缺少匹配 wheel 导致从源码构建的历史情况；维护者 8 月 3 日的[评论](https://github.com/BerriAI/litellm/issues/31261#issuecomment-5171035446)确认正在增加 macOS/Alpine 原生构建。这个背景支持正常平台支持工作的解释，不足以认证后续发布制品。[讨论索引](discussion-index.json)。

PR #31267 于 2026-06-25 19:32:56 UTC 合并。按最终 head `ad4dff15f060201c0ca0efa97cc786a177de8902` 获取的两个原始文件，其 Git blob SHA 均与 PR 文件列表相符：

- [CircleCI 第246行](https://github.com/BerriAI/litellm/blob/ad4dff15f060201c0ca0efa97cc786a177de8902/.circleci/config.yml#L246)：`uv sync --frozen --group dev --python 3.11`；[第258—259行](https://github.com/BerriAI/litellm/blob/ad4dff15f060201c0ca0efa97cc786a177de8902/.circleci/config.yml#L258)：`uv build --wheel --out-dir dist` 后进行 Windows wheel 安装测试。
- [pyproject 第237—238行](https://github.com/BerriAI/litellm/blob/ad4dff15f060201c0ca0efa97cc786a177de8902/pyproject.toml#L237)：当时允许 `maturin>=1.9.4,<2`。这是六月初始 PR 的配置；1.99/1.100/候选的精确发布配置见上表。
- 候选固定 [test-rust.yml 第118—124行](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/.github/workflows/test-rust.yml#L118) 同样使用 `uv build`，仅在另一个 panic 测试 wheel 命令中传入 `maturin.build-args=--features panic-test,extension-module`。该文件字节重新核对了固定 Git tree blob。

上述命令展示正常测试构建及显式特性参数传递。检查范围内没有出现旧 maturin CLI 的实际发布命令、ABI3 注入命令或目标 PyPI wheel SHA 的构建绑定。[固定文件原文、行号、SHA 与解释](public-commands.json)。

已有 maturin 1.9.4 官方源码的 [Command::Build 分支第364—383行](https://github.com/PyO3/maturin/blob/52dc989a9b3f86ce040be9c9037ca34038367559/src/main.rs#L364)进入自身 build context 并调用 build_wheels，支持“外部旧 CLI 构建”作为可能解释。尚未获得发布方使用该路径的证据，也未证明该路径兼容候选所有输入。maturin 1.15.0 已核验源包的 [wheel_file 第531—538行](sources/maturin-1.15.0-generator.txt)从编译期 CARGO_PKG_VERSION 写 Generator；按原样 1.15.0 生成函数预期产生 1.15.0。[源包身份与成员哈希](../version-1.101/build/backend-analysis.json)、[Generator 取证](../version-1.101/build/wheel-generator-source.json)。

## 身份、哈希与证明边界

- 制品 SHA 与 PyPI 一致可识别被审计字节；WHEEL Generator 和嵌入 rustc 修订仍是可修改的制品内部字段，不能独立认证真实工具链。
- 对照 Git commit、源码逐字匹配和 Git blob 校验没有将 wheel 绑定到一次构建运行。
- 候选公开 [Create Release run 34008764140](https://github.com/BerriAI/litellm/actions/runs/34008764140)的 actor/trigger 为 `litellm-dispatcher[bot]`，运行 head 为 `11a0c0abf03b036357e4997fe76cf4eb2f04941f`，03:20:49 UTC 开始；GitHub release 作者是 `github-actions[bot]`，03:20:59 UTC 发布。它晚于 PyPI 文件上传，所核脚本用于创建 GitHub release，无法充当这些 wheel 的构建运行。[已保存平台记录](../version-1.101/release-context/release-summary.json)。
- 先前观察到 PyPI Trusted Publishing 字段，以及另有经过签名验证的镜像声明。这些分别涉及上传认证和镜像 subject。镜像声明的私有任务标识不能改称公开 wheel 构建身份。[发布认证与镜像证明](../publishing-provenance/README.md)、[候选镜像证据](../version-1.101/images/README.md)。

## 唯一需要补齐的关键记录

**原始 wheel 发布构建记录或 provenance，subject 明确列出上述 wheel SHA-256，并关联实际 checkout/补丁、完整命令及有效 features、maturin 二进制版本与来源、Rust 工具链和构建环境。** 同一记录应能解释 1.99 sdist 的 ABI3 修改、1.100 的 ABI3 参数来源及候选 Generator 落差。它能区分正常外部构建配置、流水线偏差和需要继续调查的制品问题。缺少它时，无法完成构建归因；也无法把缺记录本身升级为恶意判定。

已保存[中性英文问询草稿](upstream-build-question.en.md)，供总管复核和决定是否对外发送。此目录没有发布该草稿。

## 复核与公开范围

[fetch-index.json](fetch-index.json)列出此次 12 次请求的 UTC、URL、状态、原始字节数/SHA。完整 API 响应和 HTTP 头只留在被忽略的 `.raw/`；公开保留最少字段索引及五个固定源码文件。旧证据逐文件身份见 [reused-evidence-index.json](reused-evidence-index.json)。[read-errors.json](read-errors.json)显式记录正式版两个 404 和一次本地不存在 glob 路径错误；没有隐藏网络重试。交付时逐文件字节/SHA 白名单为 [public-allowlist.json](public-allowlist.json)，白名单不包含其自身及 `.raw/`，白名单自身 SHA 单独交付。
