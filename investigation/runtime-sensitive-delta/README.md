# 敏感运行时差异：MCP/SSO 与 OpenAI workload identity

本次定向静态追踪解释了三个新增 MCP/SSO 文件的正常用途，并把新增 OpenAI workload identity 追到固定 SDK 候选中的文件读取与令牌交换。所查路径没有建立未经授权的凭据窃取、公告认证绕过回归或可归因恶意行为。新增续期扩大了已有 SSO 凭据的可用时间；端点配置、跨进程缓存与刷新并发仍有实际工程边界。此结论只覆盖下列路径，不认证整个包安全。

## 固定输入与执行边界

- LiteLLM 1.101.0rc1 Linux wheel：SHA-256 `38273b92727303fd6e759fa9306b47c43e52a57c3ce583b239457c7dd5b8e598`；沿用已有 wheel/Git 对照，固定源码提交 `eeb7732fc11fd47762ca84cc3fb7cc74235d7097`。
- 对照 1.100.0 Linux wheel：SHA-256 `8224c8eed9cab3319a88e6665d1275ad8faf21d353b1b22223a6d6115a302ea2`；固定提交 `e4f25265704e2b2c6cf6e81be2e4c5cffff896f4`。
- SDK 仅取既有 2026-09-08 解析快照选中的 OpenAI **2.54.0**，官方 wheel SHA-256 `89089789197ccdb87f173a03145ed1598d00795220c93e96cf712b1cbf5e5f2b`。它是条件性解析候选，实际用户环境的版本未知。官方身份与下载时间见 [SDK 来源](sdk-source-manifest.json)。
- 复用 [已有 workload identity 边界](../version-1.101/runtime-boundaries/README.md)，没有重下七个 LiteLLM wheel、重跑 RECORD，也没有安装、导入、编译或执行目标包。只用本机可信标准库读取归档/文本并解析 AST。没有访问真实令牌、部署配置、IdP、Redis 或 MCP 上游。

逐文件原文哈希、固定源码 URL、函数行号见 [源码清单](source-manifest.json)；抓取和检查时间见 [检查记录](review-evidence.json)。清单也含为找直接调用者而保存的相邻文件，不表示所有文件均做了完整行为审计。

## 数据流与触发条件

| 路径 | 来源 → 存储/缓存 → 发送目标 | 启用条件、隔离与反例 | 可达性结论 |
| --- | --- | --- | --- |
| SSO 身份捕获 | generic OIDC 回调的 `id_token` / `refresh_token` → `SecretStr` → 加密 JSON 数据库行 | 已有任意 `oauth2_id_jag` 服务器才保留；按经 SSO 用户解析得到的 `user_id` 写入，最新登录覆盖。Google/Microsoft/SAML 专用分支未捕获；无该 MCP 模式不保留 | 回调到持久化静态链成立；SDK 基础安装不会执行该登录链 |
| 新增 SSO 续期 | 该用户已存 refresh token + 当前 generic client 凭据 → 当前 `GENERIC_TOKEN_ENDPOINT`；更新 id token 与轮换的 refresh token | 仅读取发现断言在 60 秒内过期时；缺 refresh token / client 配置不发送；Redis 或进程内协调按用户串行 | 请求驱动续期链成立；没有独立周期后台刷新入口 |
| ID-JAG 出站 | 调用者显式身份令牌优先，否则认证主体的已存 id token → 配置的组织 token endpoint → 资源 token endpoint → MCP 上游认证头 | `oauth2_id_jag`、完整服务器配置、可用身份必需；缺身份/过期返回 412，存储故障返回 503。最终 token 缓存含 tenant、user、server、输入 token，配置变化参与指纹 | 声明模式到两个交换端点的静态链成立；外部 IdP 是否接受、最终权限未知 |
| Redis 协调 | 已配置 Proxy Redis → `mcp:refresh_lock:<user>:sso_identity_assertion` 加命名空间 → UUID 租约值 | 无 Redis 时使用进程内协调；Redis 存锁值，此锁路径不把身份令牌放入 Redis | 正常的并发控制；共享 Redis 的部署隔离依赖配置的 namespace |
| workload identity | 显式配置的 token 文件 → `https://auth.openai.com/oauth/token` → SDK 内存缓存交换结果 → OpenAI 请求 Authorization | 无静态 key、OpenAI HTTPS base、三个身份配置齐全；SDK provider 的文件读取在首次取 token/续期时发生；普通 key 或不合条件时提前退出 | 在固定 SDK 候选和上述配置下静态链成立；实际部署启用与运行均未验证 |

SSO 捕获调用在 [ui_sso.py:1648](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/management_endpoints/ui_sso.py#L1648)、[CLI 登录持久化:2316](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/management_endpoints/ui_sso.py#L2316) 和 [UI 登录持久化:3647](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/management_endpoints/ui_sso.py#L3647)。保留条件、加密写入与用户索引见 [sso_assertion_store.py:145](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/sso_assertion_store.py#L145)。这些 token 的保留在 **1.100.0 已存在**，新差异主要是续期、进程内缓存及诊断。

运行时装配从 [MCPServerManager:1704](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/mcp_server_manager.py#L1704) 到 [resolver:134](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/resolver.py#L134)；请求调用在 [manager:3784](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/mcp_server_manager.py#L3784)。`adapter.py` 顶部“尚未接线”的说明已过时，实际调用代码已经接入。身份来自 [to_subject:60](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/adapter.py#L60)，LiteLLM 入站 key 在 [主体令牌提取:3561](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/mcp_server_manager.py#L3561) 被排除。交换和缓存隔离见 [resolver:204](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/resolver.py#L204)、[缓存键与指纹:397](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/resolver.py#L397)。

## 已解释的行为与实际工程边界

**正常功能。** `id_jag_assertion_capture.py` 检查当前 SSO 分支是否能提供 ID-JAG 所需的断言，供启动、注册和登录诊断使用；该新增文件本身不读取或发送 token。[诊断实现](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/management_endpoints/sso/id_jag_assertion_capture.py#L34) `runtime_refresh_coordinator.py` 复用已配置的 Redis 客户端和命名空间；锁值为新生成 UUID，默认缺 Redis 时回到进程内协调。[装配](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/runtime_refresh_coordinator.py#L28)、[锁协调](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/redis_refresh_coordinator.py#L62)

**端点与身份配置边界。** 新刷新器每次使用当前 `GENERIC_TOKEN_ENDPOINT`、client id/secret；已存行包含 issuer，但刷新入口没有把旧 issuer/client 与当前配置比较。两个 ID-JAG 端点也来自服务器配置。所查发送入口没有强制 HTTPS 或同源检查，共享 HTTP 客户端默认 `follow_redirects=True`。因此配置迁移、端点重定向或关闭 TLS 校验会影响凭据的实际接收边界。这里确认了配置依赖，没有建立普通用户能控制这些配置的利用链，也没有验证任何端点正在重定向；不将此项定为认证绕过或已发生泄漏。[刷新配置:133](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/sso_assertion_refresher.py#L133)、[发送:260](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/sso_assertion_refresher.py#L260)、[HTTP client:600](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/llms/custom_httpx/http_handler.py#L600)

**保留范围与并发。** 身份断言按整个部署的 `user_id` 保存，未按 MCP server、team 或浏览器 session 分行；启用保留的条件是部署中任意 ID-JAG server 存在。新进程内缓存默认 TTL 60 秒，登录写入只失效本进程缓存，因此其他进程可暂用旧断言。刷新写回前的比较是分开的 read 与 write，登录写入并不取得同一个刷新锁，比较后仍有覆盖窗口；Redis 故障时也允许各进程自行刷新。这些是有条件的旧值使用、轮换冲突与重新登录风险，尚无跨用户授权突破证据。没有追完数据库级级联删除或部署 logout/revocation 策略，不能声称退出登录会立即清除该材料。[缓存:50](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/sso_assertion_store.py#L50)、[写回比较:331](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/sso_assertion_refresher.py#L331)、[TTL:155](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/constants.py#L155)

**日志界限。** 新 token HTTP 错误主要记录状态码/异常类型；新刷新日志记录 user_id、配置缺失或续期结果，不直接打印 refresh token。数据库/锁异常日志仍包含异常文本；完整依赖异常、可选事件钩子与部署日志收集器未穷尽，不能推导“任何日志均不泄密”。`SecretStr` 和数据库加密保护表示/落盘环节，交换表单及进程内可用凭据仍需明文。[HTTP 错误:217](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/sso_assertion_refresher.py#L217)、[token endpoint:76](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/outbound_credentials/token_endpoint.py#L76)

## OpenAI SDK 交接后的边界

同步/异步 Chat client 构造都传入 workload identity；已有自定义 client 走原有 client 路径。Responses 仅在 provider 是 OpenAI 时使用该功能，直接把交换结果写入 Authorization。[Chat 调用者:374](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/llms/openai/openai.py#L374)、[Responses:492](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/llms/openai/responses/transformation.py#L492)

固定 2.54.0 wheel 的 `openai/auth/_workload.py:46–68` 创建读取指定文件的闭包；实际 `.read().strip()` 在需要 subject token 时发生。`:241–264` 取得该 token，并将其与 identity provider id、service account id 发往交换端点；第 16 行定义默认值 `https://auth.openai.com/oauth/token`。LiteLLM 的这两个调用入口没有传入交换 URL 覆盖。SDK 不在此路径调用同文件中的 Azure/GCP metadata provider。token 只在认证对象内存中缓存，按有效期提前续期；Chat 401 最多额外失效并重取一次。SDK 的 HTTPX2 分支显式关闭交换重定向，普通 HTTPX 分支使用默认 `httpx.Client()`；本次未额外下载 HTTPX 来证明其具体版本行为。源码字节身份和官方归档链接见 [SDK 证据](sdk-source-manifest.json)。

缺文件、空文件会抛包含路径的异常；错误处理可能携带 IdP 响应对象。没有发现该路径将文件内容写磁盘或打印到日志的直接语句。实际网络代理、证书、SDK 版本和服务端授权未知。原有“功能要求 SDK >=2.32.0、包依赖下限 2.20.0”的兼容性差距仍成立，2.54.0 候选的静态行为不能代表所有允许安装版本。

## 已知公告的回归对照

[GHSA-7488-6r32-c95q / CVE-2026-59822](https://github.com/BerriAI/litellm/security/advisories/GHSA-7488-6r32-c95q) 描述旧 MCP OAuth2 passthrough 验证失败后回退空身份的问题；官方范围是 **<1.84.0**，修复范围 **>=1.84.0**。后来的 KEV 收录时间不改变这个版本范围。

对照所取 1.100.0 与 1.101.0rc1，相关 `process_mcp_request`、`_admission_failure_fallback`、目标模式判定函数的 AST 相同：显式 LiteLLM key 必须验证；普通 OAuth header 验证失败不会无条件放行；受限冷启动分支只允许指定单个透传目标，再由路由认证挑战处理；上游委托要求每个目标明确 opt-in，并排除 client_credentials。还存在明确声明的 true_passthrough/bridge 和公开 metadata 分支，因此“仍有空身份构造”不能单独证明回归。路由在创建会话前执行缺凭据挑战及透传上游检查。[认证:434](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/auth/user_api_key_auth_mcp.py#L434)、[失败回退:264](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/auth/user_api_key_auth_mcp.py#L264)、[目标限制:673](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/auth/user_api_key_auth_mcp.py#L673)、[会话前检查:4201](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/_experimental/mcp_server/server.py#L4201)

这是静态回归对照，未运行攻击请求、全组合授权测试或完整工具授权审计。官方网页读取成功；另行留存公告 API 原始 JSON 时返回 403 rate limit exceeded，未重试、没有 API 响应哈希。该失败明确记录在检查证据中。

## 交付与未决项

公开文件白名单列在 [public-whitelist.json](public-whitelist.json)，原始归档、源码文本和差异保存在 Git 忽略的 `.local/`。公开文件哈希见 [evidence-sha256.json](evidence-sha256.json)。总管独立复核了 38 份候选源码、34 份旧版源码的哈希、七个认证函数的 AST 和行号，以及固定 SDK wheel 与四个源码成员的哈希，并修正 SDK POST 的行号引用和表中交换、缓存的先后顺序。这些检查没有执行目标代码，也未修改 YouDub PR 或生产配置。

实际暴露判断仍需要已启用模式、SDK 版本、端点/issuer 配置迁移、Redis namespace、会话撤销语义与并发刷新的部署证据。后续范围由可复现的配置问题或具体未解释行为决定；本目录的静态结果不覆盖其余全部 Python 差异。
