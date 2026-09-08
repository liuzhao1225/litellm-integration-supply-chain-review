# LiteLLM 1.100 镜像签名、前端来源与 SSO 技术证据

核查覆盖镜像签名、七个平台 wheel 的前端一致性和三个 SSO 告警的现有代码。采集日期：2026-09-09。当前证据仍不足以确认 1.100 被投毒；同时，原生二进制与完整构建证明仍有核查缺口。所有包只做静态读取，没有安装、导入或执行，也没有运行容器。

## 1. 镜像签名已实际校验

按[官方签名文档](https://docs.litellm.ai/blog/ci-cd-v2-improvements)指定的[固定提交公钥](https://raw.githubusercontent.com/BerriAI/litellm/0112e53046018d726492c814b3644b7d376029d0/cosign.pub)，从 GHCR 获取匿名只读 token、镜像索引、签名层和配置。使用 OpenSSL 验证签名，并逐级核验索引、子 manifest、config 与签名 payload 的 SHA-256。

| 版本 | 签名绑定的镜像索引摘要 | 结果 |
| --- | --- | --- |
| 1.99.0 | `sha256:570a872d2fde8f1bc4a147634810941103c14697270f0f2918c5aa7d8201cac5` | Verified OK |
| 1.100.0 | `sha256:c8756e7b9a61fe45df2ccb5b781d388c3b2f3a21ef9e4956630caef20f9f03aa` | Verified OK |

公钥文件 SHA-256：`ff8869bf14ba9d10af7b64b9d479543b44daec0165e715753c43ff8a998f6dd3`。

两版本 amd64/arm64 配置的 revision 分别为 `fa647f742d7baefe8eb1181899d9c81b41559772` 和 `e4f25265704e2b2c6cf6e81be2e4c5cffff896f4`，与对应标签一致。1.100 的镜像构建时间为北京时间 9 月 6 日 10:42/10:45，符合 [#39992](https://github.com/BerriAI/litellm/pull/39992) 修复 Docker 构建后再发布的时间线。

边界：这是签名和摘要绑定校验；没有执行完整 `cosign verify` 策略，也没有验证 Rekor inclusion proof。签名 payload 的 optional 字段为 null，没有源码提交或构建流程的声明。revision 标签由构建方写入；其存在不等于可复现构建证明。未下载镜像文件系统层。

证据：[结果](litellm-1.100-evidence/registry-verification.json)、[核查脚本](litellm-1.100-evidence/verify_registry_signature.py)。

## 2. 前端差异：七平台一致，但与 Git 内预编译文件不完全一致

1.100 七个 wheel 各有 179 个 JS 文件。统一 CRLF 后，七个平台的完整路径与 SHA-256 映射完全一致。

- 167 个 JS 与 Git 标签同路径内容一致；Windows 其中一个需统一换行。
- 3 个 manifest 内容一致，构建目录从 `YAsRgSxdV-OcBfib_67Dt` 变成 `nSJ6X7eisoDkwyGRS1wMN`。
- 其余 9 个 JS chunk 文件名及内容有变化，不能全部解释成构建编号变化。差异中能看到模块顺序、压缩变量名变化和新增功能。

对这 9 个 chunk 的字符串集合比较，wheel 多出 74 个字符串值、少了 2 个，未新增字面量 URL 域名。该检查无法发现动态拼接、编码域名或证明 JS 安全。

主要新增功能已对应上游正式变更：

- [#38444：批量导入 MCP 配置](https://github.com/BerriAI/litellm/pull/38444)，新增 `/v1/mcp/server/import`、导入对话框及 `mcpServers`/`mcp_servers` 字段处理。
- [#38843：模型访问组共享预算](https://github.com/BerriAI/litellm/pull/38843)，新增预算编辑和清理 UI、相关相对 API 路径。

两项都出现在 [1.100 发布说明](https://github.com/BerriAI/litellm/releases/tag/v1.100.0)。对应 TSX 源码已从固定标签读取并验证 Git blob SHA：`ImportMCPServers.tsx` 为 `d04160bca3e76ad8a7dc6306152bed77b68ffb59`，`AccessGroupBudgetsPanel.tsx` 为 `ee8baab81abccf5dd3d4576c07c890b96382046e`。

推断：这些证据支持发布时依据较新源码重新构建前端、Git 中预编译输出较旧的解释。[模块级分析](../investigation/release-chain/README.md)进一步隔离了压缩绑定差异和 MCP API 包装函数；三个功能模块的新增字符串及主要触发路径均已映射到固定源码；大型 UI 模块的整体形式等价与构建复现仍待闭合。纯绑定重命名复核已排除所比较模块中导入调序的假设。

证据：[七平台映射](litellm-1.100-evidence/frontend-audit.json)、[改名匹配](litellm-1.100-evidence/frontend-renamed-matches.json)、[chunk 对照](litellm-1.100-evidence/frontend-chunk-comparison.json)、[字符串差异](litellm-1.100-evidence/frontend-literal-summary.json)、[源码记录](litellm-1.100-evidence/frontend-feature-source.json)。chunk 对照的相似度只用来选择候选文件，不能作为语义等价判据；其中 bytes 字段由文本长度计算，遇到 Unicode 时实际表示字符数。

## 3. 三个 SSO 告警必须按现有调用链判断

[Snyk 1.100 页面](https://security.snyk.io/package/pip/litellm/1.100.0)仍显示 CVE-2026-12772、12795、12796，范围开放且标注无已知修复。以下是固定提交源码的静态核查，没有动态复现。

### 会话与数据库 key 的期限

[login_utils.py](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/proxy/auth/login_utils.py#L198) 的管理员及普通登录路径创建 key 时都传入 `LITELLM_UI_SESSION_DURATION`；[SSO 路径](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/proxy/management_endpoints/ui_sso.py#L3545) 同样如此。

[constants.py:1537](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/constants.py#L1537) 的当前默认值是 **24h**，可由环境覆盖。[key_management_endpoints.py:3820](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/proxy/management_endpoints/key_management_endpoints.py#L3820) 将非空 duration 转成数据库 expires；[鉴权路径](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/proxy/auth/user_api_key_auth.py#L2043) 检查到期时间。

[encode_ui_session_jwt](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/proxy/auth/login_utils.py#L330) 还给 JWT 写入同期限 exp。因此，[旧报告](https://gist.github.com/YLChen-007/39ed709ce322431658a05b951e91f278)中“永久数据库 key”的表述不能直接用于当前版本。

剩余风险：JWT 仍携带数据库 key；已读登录/SSO 路径未见重新登录时撤销旧会话的逻辑。旧 token 在到期前是否继续有效、撤销与缓存是否联动，仍需隔离环境验证。[SSO token 累积报告](https://gist.github.com/YLChen-007/5fa8af12e1b183674d7ca96d852fb697)描述的是重新登录不会主动撤销旧 token，也明确存在绝对到期时间。它与“永久有效”应分开处理。

### SSO debug 路由

[debug login/callback](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/proxy/management_endpoints/ui_sso.py#L4575)仍无路由级 `Depends(user_api_key_auth)`，但回调要经过身份提供商的 `verify_and_process`。入口可访问不足以证明可读取任意他人数据。

当前代码对 raw_claims/access_token_claims 过滤 `access_token`、`id_token`、`refresh_token`；插入 HTML 前还对 `</` 转义，覆盖[旧报告](https://gist.github.com/YLChen-007/9b13c75a3a73187a4082cc6df0b100d3)提出的一类 script 结束标签注入路径。

剩余缺口：Google/Microsoft 路径仍传入 `return_raw_sso_response=True`；最终 `filtered_result` 只排除空值和下划线字段，没有同样按 OAuth token 字段过滤。具体会返回哪些字段依赖 fastapi-sso 版本和 IdP userinfo 行为，未复现实际 bearer token 泄露。不能将已有过滤写成整个回调已完全修复。

这三项涉及 Proxy 登录/SSO。仅调用 SDK completion 不会自动开放这些 HTTP 路由。

## 4. 尚存的发布链核查缺口

官方 [CI/CD v2 文档](https://docs.litellm.ai/blog/ci-cd-v2-improvements)说明验证与发布拆分到不同仓库。`BerriAI/project-releaser` 的公开访问返回 404，无法审计其当前内部 workflow；404 本身无法区分私有、删除或无访问权。

此前对两版本 Linux x86_64 wheel 的 PyPI Integrity API 请求均返回 `No provenance available`。该结果仅适用于已请求制品，不外推所有平台。Trusted Publishing、签名、公钥校验与完整构建来源证明是不同控制，不能相互替代。

Rust 源码匹配和 Linux 二进制字面量域名检查已经完成；全平台原生二进制可复现重建、反汇编、传递依赖审计仍未完成。七平台 JS 一致性不覆盖这些缺口。

## 5. 证据适用范围

已获得可复核的官方签名证据，并为主要前端差异找到正式源码来源；仍保留原生产物、发布 workflow 和会话撤销行为的疑点。当前没有发现足以确认 1.100 恶意代码植入或 `prodmanpd` 参与供应链攻击的证据。

本证据属于[完整调查报告](../REPORT.zh-CN.md)的技术附件。后续重点是具体制品的构建证明、原生扩展和剩余前端差异；调查方向及汇报标准见[调查计划](../INVESTIGATION-PLAN.zh-CN.md)。
