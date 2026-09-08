# 新增身份认证与 Claude 诊断功能的触发条件

本目录定向读取候选 Linux wheel 中五个相关 Python 文件，逐一计算 Git blob 并匹配固定源码 `eeb7732fc11fd47762ca84cc3fb7cc74235d7097`。完整文本按 `.txt` 保存，源文件身份与函数行号见 [evidence.json](evidence.json)。这是两个新增功能的静态边界核验，未执行包、读取真实令牌或调用端点。

## OpenAI workload identity

新增 [workload_identity.py](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/llms/openai/workload_identity.py#L43) 会在同时满足以下条件时返回身份配置：显式 key 与 OPENAI_API_KEY 均为空；有效 base 为默认值或通过 OpenAI HTTPS 主机检查；三个 OPENAI_IDENTITY_PROVIDER_ID、OPENAI_SERVICE_ACCOUNT_ID、OPENAI_IDENTITY_TOKEN_FILE 配置均存在。主机检查接受 api.openai.com 及其子域。[主机判定](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/llms/openai/common_utils.py#L47)

令牌文件路径显式传给 OpenAI SDK 的 k8s_service_account_token_provider，随后由 WorkloadIdentityAuth 获取令牌。这里发现了可触及身份令牌的新增能力，其触发要求有明确配置；读取文件与交换令牌的后续实现属于安装的 OpenAI SDK，尚未在本目录追查或执行。配置了普通静态 key 会提前返回 None。[SDK 交接](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/llms/openai/workload_identity.py#L32)

此功能的错误提示要求 OpenAI SDK 至少 2.32.0，而基础依赖下限仍为 2.20.0。具体环境是否支持该功能取决于实际 SDK 版本；该兼容性边界不能证明投毒。[包内依赖比较](../artifacts/metadata-comparison.json)

## Claude 诊断命令

[debug.py](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/client/cli/commands/debug.py#L337) 中的 lite debug claude 命令从显式参数、CLAUDE_CODE_SESSION_ID 或最近的 ~/.claude/projects/*/*.jsonl 文件名获得 session ID；该检测函数使用文件名和 mtime，没有读取 transcript 正文。

命令随后从用户配置的 proxy 请求该 session 的 spend logs，读取失败请求及默认最近三条请求的正文，打印并默认保存到 ~/.litellm/debug，写入后设置 0600。请求使用该 CLI 配置的 base URL 和 API key。[诊断请求与本地写入](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/client/cli/commands/debug.py#L144)、[HTTP client](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/client/http_client.py#L23)

独立的 lite debug install-claude-command 命令会向 ~/.claude/commands/debug-lite.md 写入调用上述诊断命令的 Claude slash-command 文本。该写入在明确的命令处理函数内；CLI main 仅注册 debug 命令组。[写入入口](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/client/cli/commands/debug.py#L368)、[命令注册](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm/proxy/client/cli/main.py#L147)

这些操作涉及日志内容和本地 Claude 配置，当前代码将它们放在用户调用的诊断命令中。读取到的目标来自 CLI 配置，所选代码中没有固定攻击者收集端点。本目录没有验证服务器端日志授权、全部输入处理或所有间接调用；不能据此认证整个 CLI 安全，也没有证据说明真实用户发生泄漏。

公开文件哈希见 [evidence-sha256.json](evidence-sha256.json)。
