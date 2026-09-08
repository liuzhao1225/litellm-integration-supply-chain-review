# LiteLLM 发布认证与镜像构建证明

## 当前结论

LiteLLM 1.100.0 的八个 PyPI 文件页面均显示使用 Trusted Publishing。1.99/1.100 的四个平台镜像则包含可沿已验证签名索引追溯的 SLSA v1 构建声明。两项证据补充了发布来源信息，不能证明代码安全，也没有闭合原始 PyPI wheel 的精确构建过程。[PyPI 发布字段](pypi-upload-fields.json)、[镜像证明摘要](image-attestations.json)。

当前最具体的缺口是：**原始 PyPI 文件对应的构建记录、源码及平台 ABI/工具链参数**。镜像构建声明明确跳过 PyPI 发布，无法直接代替这部分记录。

## PyPI 的认证方式与构建证明

[官方文件页面](https://pypi.org/project/litellm/1.100.0/)的七个 wheel 和一个 sdist 文件详情均显示 `Uploaded using Trusted Publishing? Yes`，上传客户端均为 `twine/6.1.0 CPython/3.13.7`。[逐文件对应记录](pypi-upload-fields.json)使用已保存的八个制品哈希标识具体文件。

[PyPI 官方机制说明](https://docs.pypi.org/trusted-publishers/)解释，Trusted Publishing 使用 OIDC 身份交换短期发布凭据。它降低了长期发布 token 被窃后持续滥用的风险；仍需评估受信任 workflow、身份配置和构建环境。页面字段不能识别具体谁操作了这次发布，也不能证明构建未受影响。

与此同时，此前八次 [Integrity API 响应](../release-chain/integrity-all8.json)均没有提供公开 provenance。认证方式与可下载的制品证明属于不同证据层级；两者可以同时成立。不能将 `No provenance available` 改写为“没有使用可信发布”。

取证来源保留区别：上述八个字段来自网页读取器呈现的 PyPI 官方页面，属于人工转录。独立的 urllib 直接请求取得 3,038 字节 `Client Challenge` HTML，解析程序据此明确报错并停止；它没有产生有效文件元数据。未重试该页面或执行挑战脚本。[错误及来源限制](read-errors.json)。

## 从签名索引追溯四份声明

沿既有[固定公钥验证](../../updates/litellm-1.100-evidence/registry-verification.json)对应的索引继续读取。两个版本的索引均各有 amd64、arm64 镜像及两个 `attestation-manifest` 条目。对每个条目核对：索引摘要等于先前验证的签名摘要、声明 manifest 的 SHA-256、声明 blob 的 SHA-256，以及 in-toto subject 等于目标平台镜像摘要。四条链全部吻合。

对保存的公钥、签名和载荷又进行了[密码学回读验证](signature-chain-check.json)：两版均返回 Verified OK，签名内摘要与索引字节哈希相同。未将此结果扩展为独立的 keyless 身份或透明日志包含性验证。

[Docker 官方存储规范](https://docs.docker.com/build/metadata/attestations/attestation-storage/)解释，`unknown/unknown` 平台条目用于存放这类证明。此前的平台配置检查跳过这些条目；本次实际读取到了 `https://slsa.dev/provenance/v1` 声明。没有拉取或运行镜像层。

| 版本 | 声明的构建任务 | 声明的源码 commit | 平台构建时间 UTC |
| --- | --- | --- | --- |
| 1.99.0 | project-releaser run `33459885212`，attempt 1 | `fa647f742d7baefe8eb1181899d9c81b41559772` | amd64：09-01 01:50:38～01:55:25；arm64：01:49:40～01:56:45 |
| 1.100.0 | project-releaser run `34006625974`，attempt 1 | `e4f25265704e2b2c6cf6e81be2e4c5cffff896f4` | amd64：09-06 02:38:16～02:42:40；arm64：02:37:31～02:45:18 |

这些任务号、时间和身份来自被签名索引绑定的发布声明。尚未独立读取相应私有 workflow/run，因此不把声明提升为独立的 GitHub 平台审计结果。

四份声明均记录 actor 为 `yuneng-berri`、事件为 `workflow_dispatch`、workflow 为 `BerriAI/project-releaser/.github/workflows/release.yml@refs/heads/main`。1.100 的 workflow SHA 为 `bf703759a46aa779d0ffb8d4e2a64dc8b9a11650`；1.99 为 `0506e1456bf3514b46dacc596d531eb1b7f20eb2`。这不证明 PyPI 上传者身份，也没有与两个集成贡献者建立控制关系。[精确字段、原始声明 URL 与摘要](image-attestations.json)。

## 声明实际覆盖的范围

两版输入都包含 `skip_components=pypi-litellm`、`allow_republish=true`；1.100 的行为与[公开 Docker 修复 #39992](https://github.com/BerriAI/litellm/pull/39992)所述“PyPI 已发布、随后另行修复镜像”相符。1.99 的镜像任务也明确跳过 PyPI，故此模式并非只在 1.100 出现。

声明列出固定 digest 的 Wolfi 基础镜像、Dockerfile frontend 和 uv 构建工具；同时存在本地 `context`、`dockerfile`、`ui-builder` 输入。其 completeness 字段明确为 `request=false`、`resolvedDependencies=false`。因此，它们提供的关联强于单独镜像标签或自述 revision，但没有记录完整构建输入，不能据此独立复现镜像或证明本地 UI 输入等同 Git 树。

原始 registry JSON 已保存在本地，公开摘要只保留构建归因所需字段。摘要保留原始 manifest/blob URL 与哈希；重现完整声明需要从这些公开 registry 对象取得原始字节。请求的原始 HTTP 时间未在并行 PyPI 解析失败后进入最终汇总，故采用本地原始文件写入时间并明确标识，未伪造 HTTP 采集时间。

## 公开漏洞记录对照

当前 [GitHub 官方仓库 advisory API](https://api.github.com/repos/BerriAI/litellm/security-advisories?per_page=100)返回 14 条公开记录，均已保留标题、日期、受影响范围及修复版本。[查询摘要](published-advisories.json)。这些范围字符串的上界都低于 1.100.0；此观察不覆盖未公开漏洞或后续修订，也不构成当前版本安全认证。

最新路由参数相关记录同时列出多条维护分支补丁版本，范围与 backport 说明需要按具体分支解释。漏洞公告、历史恶意发布和本次是否存在植入是三个需分别核验的问题；没有从这些旧版漏洞标题推导 1.100 已遭投毒。
