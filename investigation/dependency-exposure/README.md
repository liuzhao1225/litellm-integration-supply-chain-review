# LiteLLM 基础依赖、安装条件与运行时信任边界

本分析持续维护同一份报告，调查主体是 **LiteLLM 1.99.0 / 1.100.0 的依赖、可安装制品与运行时信任边界**。[YouDub #130 固定 head `1add1b6d90795ddc222c3f5021305a2e8d953a17`](https://github.com/liuzhao1225/YouDub-webui/commit/1add1b6d90795ddc222c3f5021305a2e8d953a17)作为发现入口与下游集成案例。本次使用现有可信工具进行静态读取及仅 wheel 的 SDK 子图解析，没有安装、导入或执行被调查包，没有读取秘密值、运行容器或访问生产。制品发布链与原生/前端构建由总管协调的其他调查材料覆盖。

源文件复核时间：**2026-09-08T20:15:24.481200+00:00—2026-09-08T20:15:26.963985+00:00**。14 项直接依赖的声明最低版本 PyPI 元数据采集时间：**2026-09-08T20:15:27.022061+00:00—2026-09-08T20:15:29.093595+00:00**。逐文件 SHA-256、固定链接与采集方式见 [source-manifest.json](source-manifest.json)；逐依赖响应哈希、制品哈希和上传时间见 [dependency-floor-metadata.json](dependency-floor-metadata.json)。这些时间为本机记录的采集时间，不是第三方可信时间戳。

## 结论与证据等级

1. **事实：六个 LiteLLM 基础子图解析均成功，每个包含 55 个包。** 在同一时点的 Aliyun 索引、Python 3.12 与两个明确假设平台下，宽范围选中 1.100.0；与锁定 1.100.0 相比版本无差异，改锁 1.99.0 仅 LiteLLM 自身不同。其余 54 个包本次没有观察到版本差异；这不证明未来不会漂移。[SDK 子图对照](resolution/sdk-subgraph/comparison.json)。
2. **事实：基础 14 项依赖声明相同；extra 与运行时条件需要单独解释。** 88 个不同 wheel 候选的文件名/哈希与当前 PyPI 元数据对应，只确认索引记录一致，未验证所有 wheel 字节、原生行为或发布者可信性。[依赖声明](source-manifest.json)、[制品索引对照](resolution/sdk-subgraph/artifact-index-check.json)。
3. **事实及范围限制：76 个敏感调用候选已逐项分流。** 包含本地处理、路由注册、timeout 变化和显式激活的回调/提供商/Proxy/MCP 功能。SDK import 可读取移动的 cost JSON；配置文件允许的远端 Python 模块加载属于独立执行边界。分类不证明整个供应链安全。[逐项记录](reviewed-candidates.json)。
4. **下游案例及条件推断：SDK 优先使用显式 key，调用者须区分凭据所属提供商。** YouDub 保留旧 key 并切换提供商的参数链，可能将原提供商 key 送往另一个提供商；没有实际泄漏证据。YouDub 完整根集受本调查禁止源码构建的条件限制，不可由此否定作者做过普通安装或手工测试。详见下游安装与凭据案例。

## 固定制品与适用范围

| 对象 | 固定版本/提交 | 已保存制品 SHA-256 |
| --- | --- | --- |
| LiteLLM 比较基线 | 1.99.0；[`fa647f742d7baefe8eb1181899d9c81b41559772`](https://github.com/BerriAI/litellm/commit/fa647f742d7baefe8eb1181899d9c81b41559772) | manylinux x86_64 wheel：`1c45097e426fed2ae7fbd38b5404c3addeb203d0e1148c0a59848aabd5fe83c6` |
| LiteLLM 复核版本 | 1.100.0；[`e4f25265704e2b2c6cf6e81be2e4c5cffff896f4`](https://github.com/BerriAI/litellm/commit/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4) | manylinux x86_64 wheel：`8224c8eed9cab3319a88e6665d1275ad8faf21d353b1b22223a6d6115a302ea2` |
| YouDub | PR #130 head `1add1b6d90795ddc222c3f5021305a2e8d953a17` | 各 Git blob 的 SHA-256 见 [source-manifest.json](source-manifest.json) |

制品下载 URL、上传时间及此前与索引核对记录由[原始制品清单](../artifact-records/pypi-artifacts.json)提供。本次对实际判读的 92 个版本化 Python 源文件再次比对其已保存 wheel 成员，另保存 12 个 YouDub 固定 Git blob，共 104 项。没有重跑完整 RECORD 或全部源码扫描。判读适用于这些源文件；其他平台的原生路径、动态执行结果以及安装到机器上的文件不由此确定。

## 安装

### LiteLLM 基础子图：三个输入与两个假设平台

解析范围仅包含一个根依赖 LiteLLM 及其基础传递依赖，**没有加入 YouDub 的其他根依赖、可选 CUDA 预安装或任何现有环境**。假设 Python 3.12；平台参数分别为 Linux `x86_64-manylinux_2_28` 与 macOS `aarch64-apple-darwin`。这些参数不来自生产调查，不保证运行时动态库或服务能工作。以 Aliyun 为唯一索引，使用 highest、禁止 prerelease、禁止源码候选、禁止 Python 下载、关闭配置与 keyring；首次进入该系列时缓存为空，之后仅复用本系列索引/元数据缓存。

六次解析时间：**2026-09-08T20:32:04.420516+00:00—2026-09-08T20:32:09.853025+00:00**。全部实际命令、各次 UTC、输入 SHA、stdout/stderr SHA、工具/解释器 SHA 和锁文件 SHA 均见 [runs.json](resolution/sdk-subgraph/runs.json)。

| 假设平台 | 输入 | 选中 LiteLLM | 包数 | 锁文件保留的 wheel 候选 |
| --- | --- | --- | --- | --- |
| Linux x86_64 / manylinux 2.28 | `>=1.89.0,<2.0.0` | 1.100.0 | 55 | [61 个](resolution/sdk-subgraph/x86_64-manylinux_2_28-wide/pylock.toml) |
| 同上 | `==1.100.0` | 1.100.0 | 55 | [61 个](resolution/sdk-subgraph/x86_64-manylinux_2_28-1.100.0/pylock.toml) |
| 同上 | `==1.99.0` | 1.99.0 | 55 | [61 个](resolution/sdk-subgraph/x86_64-manylinux_2_28-1.99.0/pylock.toml) |
| macOS arm64 | `>=1.89.0,<2.0.0` | 1.100.0 | 55 | [68 个](resolution/sdk-subgraph/aarch64-apple-darwin-wide/pylock.toml) |
| 同上 | `==1.100.0` | 1.100.0 | 55 | [68 个](resolution/sdk-subgraph/aarch64-apple-darwin-1.100.0/pylock.toml) |
| 同上 | `==1.99.0` | 1.99.0 | 55 | [68 个](resolution/sdk-subgraph/aarch64-apple-darwin-1.99.0/pylock.toml) |

同一平台的 wide 和 1.100.0 锁之间包版本/非 LiteLLM wheel 集合均无差异；1.99.0 对照只改变 LiteLLM 本身，其余 **54 个包的版本和对应 wheel 集合保持相同**。两个平台的包名/版本也相同，但 17 个包的 wheel 集合随平台变化。macOS 的部分包保留 arm64 与 universal2 等多种可用 wheel；因此“61/68”不是安装了这么多个文件。pylock 顶层的 `requires-python = ">=3.12"` 也不能用于扩大本实验的 Python 3.12 目标范围，必须连同 runs.json 条件读取。[完整比较](resolution/sdk-subgraph/comparison.json)。

本次选中的直接/传递版本例子：openai 2.54.0、httpx 0.28.1、aiohttp 3.14.3、pydantic 2.13.5、pydantic-core 2.46.5、tokenizers 0.23.2、huggingface-hub 1.30.0、boto3/botocore 1.43.89、tiktoken 0.14.0。它们与“各声明最低版本”的示例不是同一个集合；仅有最低版本元数据时不能用它替代实际解析。[55 包版本及全部 wheel URL/SHA](resolution/sdk-subgraph/comparison.json)。

对六份锁中 **88 个不同 wheel 候选**，又读取 **56 个准确 package/version 的 PyPI JSON**，核对所有文件名和 SHA-256。核对时间 **2026-09-08T20:34:13.464979+00:00—2026-09-08T20:34:16.251665+00:00**，没有不对应项。每个 wheel 的 Aliyun URL、PyPI URL、上传时间、yank 状态和哈希，以及元数据响应 SHA，见 [artifact-index-check.json](resolution/sdk-subgraph/artifact-index-check.json)。这一步没有下载 wheel 实体；求解器仅消费 wheel/索引元数据。匹配索引记录不能证明所有制品行为安全、可复现构建或跨平台运行成功。

| LiteLLM wheel | SHA-256 |
| --- | --- |
| 1.100.0 manylinux x86_64 | `8224c8eed9cab3319a88e6665d1275ad8faf21d353b1b22223a6d6115a302ea2` |
| 1.100.0 macOS arm64 | `0f87fae695edbca27e5cf970bea52fa405fa9910fdf7c29c963d6413db767299` |
| 1.99.0 manylinux x86_64 | `1c45097e426fed2ae7fbd38b5404c3addeb203d0e1148c0a59848aabd5fe83c6` |
| 1.99.0 macOS arm64 | `e2b383070656fdbec4bc44602edaaed2a21e99ceee4ea0a4650c8cb381e67b59` |

**执行边界与实际错误：**首次命令同时指定 --no-build 和 --only-binary，被 uv 0.9.26 的参数互斥检查拒绝，尚未开始求解。[原错误命令](resolution/sdk-subgraph/argument-validation-error.json)、[原 stderr](resolution/sdk-subgraph/argument-validation-error.txt)原样保留。明确修正为 `--only-binary :all:` 后才开始上述六次成功解析；没有放开源码构建或回退到 sdist。

额外复核 [uv 0.9.26 的解释器探测源码](https://github.com/astral-sh/uv/blob/0.9.26/crates/uv-python/src/interpreter.rs#L958)发现常规 probe 使用 -I/-B，未带 -S。为了阻止系统 site 启动 hook，显式指定现有可信 Python 的 [python-no-site 入口](resolution/sdk-subgraph/python-no-site)，加入 `-I -S`。该入口仅用于工具解释器信息查询；目标 Python 版本仍由 --python-version 3.12 指定。未安装新工具/依赖、未导入被调查包；缓存的 sdists-v9 只有 uv 创建的 .git/.gitignore 标记，无源码制品。

**推断边界：**当前同一时点没有观察到非 LiteLLM 版本漂移。范围本身仍允许未来重新解析时变化，不能用这次的零差异否定将来的漂移。反过来，也不能把宽范围直接写成已经发生传递版本变化或投毒。下一项需要的是跨时间的可信锁/安装记录对照，或供应链审查所需的精确制品来源/构建证明，而非用有界元数据实验替代行为审计。

### 直接与传递依赖漂移

两版 Python 范围均为 `>=3.10,<3.15`，基础依赖集合均为以下 14 项。[原 wheel METADATA 摘录](../runtime-paths/install-boundary.json)与[固定 pyproject](source-manifest.json)一致：

| 直接依赖范围 | 声明最低版本的下一层关系示例 |
| --- | --- |
| `fastuuid>=0.14.0,<1.0` | 0.14.0 的 `Requires-Dist` 为空；这不代表 wheel 无原生执行代码。 |
| `httpx>=0.28.0,<1.0` | 0.28.0 声明 anyio、certifi、`httpcore==1.*`、idna。 |
| `openai>=2.20.0,<3.0.0` | 2.20.0 声明 `anyio>=3.5.0,<5`、`jiter>=0.10.0,<1`、pydantic、httpx 等。 |
| `python-dotenv>=1.0.0,<2.0` | 1.0.0 仅有可选 cli extra 的 click 关系。 |
| `tiktoken>=0.8.0,<1.0` | 0.8.0 声明 `regex>=2022.1.18`、`requests>=2.26.0`。 |
| `importlib-metadata>=8.0.0,<9.0` | 8.0.0 声明 `zipp>=0.5`；其他边有 Python/extra marker。 |
| `tokenizers>=0.21.0,<1.0` | 0.21.0 声明 `huggingface-hub>=0.16.4,<1.0`。 |
| `click>=8.0.0,<9.0` | 8.0.0 的 colorama 关系仅在 Windows 条件下。 |
| `jinja2>=3.1.6,<4.0` | 3.1.6 声明 `MarkupSafe>=2.0`。 |
| `aiohttp>=3.14.2,<4.0` | 3.14.2 声明 aiohappyeyeballs、aiosignal、attrs、frozenlist、multidict、propcache、yarl；另有 Python 条件。 |
| `pydantic>=2.10.0,<3.0.0` | 2.10.0 **精确要求 `pydantic-core==2.27.0`**，另有 annotated-types 和 typing-extensions。 |
| `pydantic-settings>=2.14.1,<3.0` | 2.14.1 声明 pydantic、python-dotenv、typing-inspection；云 secret-manager extras 条件保留。 |
| `jsonschema>=4.0.0,<5.0` | 4.0.0 声明 attrs、pyrsistent，format 依赖为 extras。 |
| `boto3>=1.43.1,<2.0` | 1.43.1 声明 `botocore>=1.43.1,<1.44.0`、jmespath、s3transfer。 |

每项的第一手来源为 [dependency-floor-metadata.json](dependency-floor-metadata.json) 中对应 `https://pypi.org/pypi/<name>/<version>/json`。**这张表展示各声明最低版本的元数据，不保证这些最低版本能共同安装，不声称当前解析器会选中它们。** 这份最低版本补充没有求解 marker/extra 闭包；实际 SDK 子图由上文六次解析单独记录。未求解 YouDub 完整根集，未检查这些依赖的源码/原生代码或安全公告。

推断：即使仅固定 LiteLLM 为 1.99.0 或 1.100.0，宽范围直接依赖及其传递依赖仍可能随解析时间改变。反例：pydantic-core 的某条传递边有精确版本；已满足依赖的环境、外部 constraints、锁文件或私有 wheelhouse 也可抑制漂移。因此“每次安装都会选最新”不成立。[pip 官方安装规则](https://pip.pypa.io/en/stable/cli/pip_install/)说明会优先保留已满足的安装版本，并在需要选择时综合约束选取可用候选。

同一 [pyproject 比较](source-manifest.json)显示：1.100.0 的 proxy extra 将 `litellm-proxy-extras==0.4.89` 改为 `==0.4.91`，`litellm-enterprise==0.1.59` 改为 `==0.1.62`，RestrictedPython 下限从 8.1 改为 8.5；另新增 `mcp` extra，声明 `mcp>=1.28.1,<2.0`。这些变化适用于相应 extra 被选择的安装；#130 根 requirements 只声明基础包。源码中的 upstream `uv.lock` 说明也不等于下游 pip 消费了那个锁文件。

两版构建后端同为 `maturin==1.9.4`。若解析走 sdist，构建后端与构建依赖进入另一执行边界；仅使用 `--dry-run` 不能保证没有为获取 sdist 元数据调用构建后端。[构建声明](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/pyproject.toml#L264)、[pip 元数据处理说明](https://pip.pypa.io/en/stable/cli/pip_install/#working-out-the-name-and-version)。原 wheel 扫描未见启动 hook 的结果继续保持原适用范围，不能外推到全部传递包或未来版本。

### 下游案例：#130 安装及使用可达性

| 场景 | 静态可确认的边界 | 事实/未知与反例 |
| --- | --- | --- |
| 从 #130 head 正常安装根 requirements | 声明 `litellm>=1.89.0,<2.0.0`，没有 `[proxy]` 等 extra | 事实。解析器仍受 Python/平台、其他依赖、已安装环境、索引和 constraints 影响；声明不证明完成安装。 |
| 安装 backend/requirements.txt | `-r ../requirements.txt` 纳入同一依赖 | 事实。不能把后端安装视为绕过 LiteLLM。 |
| 运行默认翻译、开关关闭 | `_client` 选择现有 OpenAI 客户端，未走适配器内的 `import litellm` | 事实，仅限此应用分支；其他包/调用者可以自行 import。 |
| 开启开关但尚未发起模型请求 | 创建 LiteLLMClient 本身只创建本地对象 | 事实。真实包 import 在 `_Completions.create` 中。 |
| 开启开关并发起翻译/预处理 | 执行 `import litellm`，随后 `litellm.completion` | 事实。正文、模型、非空 key 和可能的自定义 URL 进入同一 Python 进程中的 SDK。 |
| 轻量 CI | workflow 安装 backend/requirements-test.txt，该声明没有 LiteLLM；新增单测注入假模块 | 事实：这个 job 的依赖声明与真实完整安装不同。外部环境/间接依赖仍需具体安装清单，不能凭声明断言包绝不存在。 |
| 本地已有 .venv | 总管此前报告只读枚举未见 LiteLLM 命名安装项 | 引用[协调记录](../README.md)，本次未重复枚举；结论仅限那一个环境。 |
| 生产/容器/其他 Python 环境 | 本次没有查看 | 未知。PR open/unmerged 与单个 .venv 阴性结果均不能推出所有部署无暴露。 |

路径证据：[根 requirements](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/requirements.txt)、[适配器](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/adapters/litellm_translate.py#L39)、[CI](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/.github/workflows/ci.yml#L60)、[测试依赖](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/requirements-test.txt)。既有 PR 状态快照为 [2026-09-08T20:02:02.620223+00:00](../youdub-state.json)，open/unmerged；本次围绕固定 head 分析，没有重复刷新或修改 PR。

### 下游案例：完整根集的纯 wheel 求解可行性

**结果：现有可信工具具有禁止构建的求解选项；在本次查看的 PyPI 和项目文档指定 Aliyun 索引中，完整根集缺少必要 wheel，无法得到两份完整解。** 没有删除阻塞依赖、伪造锁文件、降级为安装源码包或执行构建后端。

固定 head 的 [README:73–95](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/README.md#L73)明确要求 Python 3.12，说明 Windows 10/11、Linux/WSL2、macOS 运行方式；文档未完整固定 CPU 架构、OS 最低版本和 Python 补丁版本。[CUDA 指南](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/README.md#L179)还允许提前从 cu128 索引安装未固定版本的 torch/torchaudio。这些条件会影响真实环境求解。本次未假设某台生产机器的平台或预安装状态；零 wheel 的必需根已足以阻断上述任一平台的纯 wheel 解。

工具检查：现有 Homebrew 安装的 `uv 0.9.26 (Homebrew 2026-01-15)`，二进制路径 `/opt/homebrew/Cellar/uv/0.9.26/bin/uv`，SHA-256 `1ad5ff5c932d9d2de88268ef705c549ad54fc4c3371ee546ccf18dc4883ecebe`。本机安装收据记录由 bottle 安装；版本和文件哈希用于定位本次工具，不作为整个工具绝对安全的证明。读取的 [本机 help](resolution/uv-pip-compile-help.txt)确认提供 `--no-build`、`--only-binary`、`--no-sources`、`--no-python-downloads`、`--python-version`、`--python-platform`、`--generate-hashes`。这些是已验证的工具能力；**对 YouDub 完整根集没有调用求解命令，使用工具 help 与完整索引候选列表已能确认阻塞；上文的六次真实求解只针对 LiteLLM 基础子图。** 候选集可行性由可信 Python 3.14.2 的标准库在 `-I -S` 下读取索引元数据判断。[uv 官方参数文档](https://docs.astral.sh/uv/reference/cli/#uv-pip-compile)提供对应说明。

| 根依赖 | PyPI 索引全部可见文件 | 项目指定 Aliyun 索引 | 可确认的边界 |
| --- | --- | --- | --- |
| `dora-search>=0.1.12` | 9 个文件，0 个 wheel | 9 个文件，0 个 wheel | 全项目没有 wheel，因此满足该范围的 wheel 候选也为空。 |
| `openai-whisper` | 13 个文件，0 个 wheel | 13 个文件，0 个 wheel | 没有可从本次索引选择的 wheel，独立阻断完整根集。 |
| `diffq>=0.2.1` | 119 个文件，其中 112 个 wheel | 未查询 | 只确认 wheel 存在；未逐一判断 Python/平台兼容性。 |
| `julius>=0.2.3` | 13 个文件，其中 1 个 wheel | 未查询 | 同上；不将有 wheel 视为完整求解成功。 |

第一手来源：[PyPI dora-search](https://pypi.org/simple/dora-search/)、[PyPI openai-whisper](https://pypi.org/simple/openai-whisper/)、[PyPI diffq](https://pypi.org/simple/diffq/)、[PyPI julius](https://pypi.org/simple/julius/)、[Aliyun dora-search](https://mirrors.aliyun.com/pypi/simple/dora-search/)、[Aliyun openai-whisper](https://mirrors.aliyun.com/pypi/simple/openai-whisper/)。这不是关键词搜索阴性推断：已解析项目 simple 索引的完整文件列表，保存每个文件的名称、URL 和索引哈希信息。PyPI 读取完成于 **2026-09-08T20:27:14.704635+00:00**；Aliyun 独立核对完成于 **2026-09-08T20:28:05.795857+00:00**。逐项起始 UTC、原始响应 SHA-256 和格式见 [wheel-feasibility.json](resolution/wheel-feasibility.json)、[mirror-wheel-feasibility.json](resolution/mirror-wheel-feasibility.json)。不声称索引可见性覆盖私有或已删除制品。

对照输入已精确保存：

| 输入 | 与 #130 的关系 | 完整纯 wheel 解 | 可报告的实际版本漂移 |
| --- | --- | --- | --- |
| [requirements-wide.txt](resolution/requirements-wide.txt) | 固定 head 根 requirements 原字节；`litellm>=1.89.0,<2.0.0` | 在上述候选集合中无解：两个必需根的 wheel 候选为空 | 未得到完整解，不能评估。 |
| [requirements-litellm-1.100.0.txt](resolution/requirements-litellm-1.100.0.txt) | 仅把该 LiteLLM 行改为 `litellm==1.100.0`，其他根保持相同 | 同一阻塞，与 LiteLLM 锁定与否无关 | 未得到完整解，不能写成“漂移为 0”或“解析结果相同”。 |

两个输入 SHA-256 记录在 [wheel-feasibility.json](resolution/wheel-feasibility.json)。**所选版本/制品列表不存在，因为没有完整可选解。** 上一节纯元数据示例仍只说明允许变化的依赖边；它们没有升级为本项目的实际解析结果。

反证/合理替代解释：运维可能有经过审查的私有 wheelhouse、预先安装的源码构建产物，或不同时间/索引下出现新 wheel。一般安装器允许 sdist 时也可能正常完成安装。因此本结论针对明确的“只准 wheel、不执行被调查代码”条件，不说明 YouDub 通常无法安装，更不说明包有恶意。**缺 wheel 不能证明 PR 作者没有下载/安装或手工测试过 YouDub；源码构建可能是其正常安装过程。单测使用 mock 也不能推出所有手工测试声明均为虚构。** 本调查的禁止构建条件由我们施加，不应归咎于作者。复核作者测试声明仍需其准确命令、环境和制品证据。

下一项可区分检查：由维护者提供这两个根的准确、已有可信 wheel（URL/哈希/构建来源），以及实际 Python 补丁、架构/OS、CPU/CUDA、预安装约束和单一索引快照；继续在禁止 build/源码候选且不消费现有环境的可信求解流程中比较。若只能提供 sdist，可继续只读其静态声明来缩小未知，但动态元数据不能凭空推导，不应声称得到 wheel 安装解。无需也不允许为了本次调查安装/执行被调查包。

## 凭据

### 同进程的环境凭据边界

应用本来就会通过 [config.py 的 load_dotenv](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/config.py#L45)加载运行环境；LiteLLM 在 `LITELLM_MODE` 缺省为 DEV 时也会执行 dotenv 加载，`LITELLM_DEV_ENV_HOT_RELOAD=True` 影响覆盖行为。[SDK import 路径](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/__init__.py#L14)。provider 原生认证进一步扩大到选中提供商所能读取的环境/身份来源，具体 AWS/ADC/secret-manager 取值优先级受相应依赖与配置影响。

这是将 SDK 放入应用进程的信任边界，不等于代码已经遍历或上传全部秘密。本次没有读取 .env、数据库值、云凭据文件或机器身份。也没有把普通包安装本身写成“立即取得进程内全部秘密”：安装阶段、Python 启动 hook、import 和业务调用应分别审视。

### 下游案例：条件性跨提供商传递路径

| 步骤 | 可复核事实 | 第一手来源 |
| --- | --- | --- |
| 设置来源 | `openai_defaults()` 读取 OPENAI_API_KEY；数据库已保存的 openai.api_key 优先于默认值 | [config.py:121](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/config.py#L121)、[database.py:670](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/database.py#L670) |
| 设置更新保护 | base URL 变化、已有 key 且未提交新 key/明确清除时，保存失败；仅改变 model 或 LiteLLM 开关不触发这一条件 | [database.py:710](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/database.py#L710)、[main.py:688](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/main.py#L688) |
| 适配器 | 非空 api_key 直接传给 LiteLLM；默认 OpenAI base URL 被省略；调用方 kwargs 最后合并 | [litellm_translate.py:39](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/adapters/litellm_translate.py#L39) |
| Anthropic 分支 | 显式 api_key 优先于 litellm 全局 key 和 ANTHROPIC_API_KEY；无 base 覆盖时选择 api.anthropic.com/v1/messages | [1.100 main.py:2783](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/main.py#L2783)；[1.99 同样的优先级](https://github.com/BerriAI/litellm/blob/fa647f742d7baefe8eb1181899d9c81b41559772/litellm/main.py#L2749) |
| 认证头与发送准备 | Anthropic handler 调用 validate_environment；常规 API key 形成 x-api-key，另有 OAuth/custom-base 条件分支 | [handler.py:350](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/llms/anthropic/chat/handler.py#L350)、[common_utils.py:629](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/llms/anthropic/common_utils.py#L629) |

**推断及适用条件：**用户原先保存真实 OpenAI key，保持默认 OpenAI base URL，改用有效 `anthropic/...` 模型并开启 LiteLLM，未清空/替换 key，且没有全局/环境地址覆盖或调用失败阻断发送时，SDK 会把旧 key 用于 Anthropic 请求。设置一个正确 ANTHROPIC_API_KEY 环境变量也不会覆盖已经显式传入的旧 key。服务端拒绝错误 key 不会撤销请求头已经发往该服务这一传输事实；本次没有做真实请求。

**反证/合理替代解释：**共享设置中存的本来就是正确 Anthropic key 或网关凭据；用户通过 clear_api_key 清空了保存值；LiteLLM 开关关闭；调用在发送前失败；环境/全局设置改变实际目标。现有保存逻辑对“直接改 base URL、默默沿用旧 key”已有防护，应保留这一正面边界。不能将跨提供商路径归因为 1.100 新增行为，因为 1.99 已有显式 key 优先级。

**未知：**任何本地/生产用户是否采用上述组合，以及是否发送过错误凭据。下一项区分检查应由作者在准确制品、无真实凭据的隔离环境中提供 HTTP 发送边界用例，覆盖“仅切模型/开关、旧 key 保留”“明确清空后走 provider env”“自定义 URL 与专用 gateway key”，并报告实际目标、头名称及哨兵值。该测试验证行为边界，无法独立证明包无恶意。本次未执行它。

## 目标地址与执行能力

| 路径 | 激活条件与实际作用 | 版本差异及 YouDub 可达性 |
| --- | --- | --- |
| 模型请求 | 适配器传入自定义 api_base；默认 OpenAI URL 被省略后由 provider 分支/全局/环境决定 | YouDub 翻译实际入口可达。保存 URL 支持 HTTP/HTTPS，跨 URL 保存已有 key 有保护；正确的网关配置仍需信任运营者。[适配器](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/adapters/litellm_translate.py#L49)、[URL 校验](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/app/adapters/openai_client.py#L16)。 |
| import 时读取 cost JSON | 缺省 URL 为 GitHub main 的 model_prices_and_context_window.json；LITELLM_MODEL_COST_MAP_URL 可覆盖；LITELLM_LOCAL_MODEL_COST_MAP=true 选择内置文件 | 两版已有；YouDub 第一次真实 import 可触发。静态 GET 调用不传 provider key 或用户 prompt；解析 JSON 及字典/模型数量校验，不是 Python exec。远程可变配置仍影响模型信息，字典校验不提供签名保证。[初始化](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/__init__.py#L412)、[读取](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/litellm_core_utils/get_model_cost_map.py#L158)、[开关](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/litellm_core_utils/get_model_cost_map.py#L426)。 |
| callbacks/raw logging | input/success/failure/callbacks 初始为空，log_raw_request_response=False；调用者仍可配置 callbacks/日志 | 两版已有默认值。#130 没有传 callback 参数；默认值不能证明其他调用者无日志，也不能证明全局 telemetry 完全关闭。[默认值](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/__init__.py#L108)。 |
| S3/GCS Python 模块下载后 exec_module | get_instance_fn 收到 s3:// 或 gcs:// 且 config_file_path 非空才进入远端加载；缺少配置文件信号会拒绝 | 这份工具文件两版字节相同。属于 Proxy 运维配置的可执行代码边界；#130 的 completion 适配器没有调用该加载器。不能因包内存在它就断言普通翻译会远端 exec。[保护条件](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/proxy/types_utils/utils.py#L9)、[加载执行](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/proxy/types_utils/utils.py#L144)。 |
| Together rerank | 1.100 尊重 dynamic/optional/global api_base，缺省为 api.together.ai/v1，再带选中的 Together key POST /rerank | 1.99 在 handler 中固定 together.xyz/v1/rerank。需 rerank API 和 Together provider；YouDub 调用 completion，未发现该适配器进入 rerank 的直接路径。[选址](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/rerank_api/main.py#L280)、[发送](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/llms/together_ai/rerank/handler.py#L56)。 |
| New Relic 指标/MS Teams 告警 | 显式配置 logger/key 或 webhook/告警目标后发送；NewRelicMetricsLogger 使用显式 New Relic key，汇总团队/模型/状态及用量 | 1.100 新增相应功能；#130 未配置。不得把新域名字面量当作默认上传目的地。[New Relic 初始化](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm/integrations/newrelic/newrelic_metrics.py#L164)、[逐项判读](reviewed-candidates.json)。 |
| MCP/Proxy 客户端/guardrail | 显式调用相应方法、配置服务或开启 guardrail 后使用配置地址和认证 | 不属于 #130 当前文本 completion 参数集的直接入口；不排除额外全局配置或其他调用者。[逐项判读及源码链接](reviewed-candidates.json)。 |

### 76 个扫描候选的人工分流

最终输入是 [runtime-scan.json](../runtime-paths/runtime-scan.json)：Python 文件 2241→2280，41 新增、2 删除、550 修改，最终语法错误数 0。旧 sensitive-call-delta.json 的 94 项/27 个解析错误属于被修正的初稿，不与最终结果合并。该事实只确定扫描输入质量，不能代表恶意代码检出率。

| 类别 | 项数 | 判读含义 |
| --- | --- | --- |
| 读取配置 | 16 | 单个环境读取不会自动证明秘密外传。 |
| 本地处理/对象构造 | 12 | 包括 re.compile、固定图片解码、httpx.Request/Response 构造与 URL 处理。 |
| Proxy 服务端路由注册 | 7 | router.post 是注册处理器；不是向远端发 POST。 |
| 配置后的回调/告警 | 3 | 必须看 logger/告警目标及激活条件。 |
| MCP 传输/OAuth | 3 | 需要 MCP 配置/调用；其中有自定义认证头重定向防护变化。 |
| 提供商操作 | 8 | rerank、视频生成、skills 操作的网络路径。 |
| Proxy client/CLI 调用 | 26 | 25 项与旧调用在去掉 timeout 参数后结构一致；另 1 项为登录轮询 helper。 |
| guardrail 认证 | 1 | HiddenLayer 认证新增 timeout，仍需显式 guardrail 配置。 |

每项 ID、函数、目标操作、激活条件和反例见 [reviewed-candidates.json](reviewed-candidates.json)；原上下文/差异见 [candidate-contexts.json](candidate-contexts.json)。该静态候选筛选不覆盖完整调用图、间接调用、所有 payload 数据流、Rust 行为或传递包。

## 测试覆盖与下一项可区分检查

本次 LiteLLM 结果是静态源码判读、无执行依赖解析及索引身份对应，不包含真实 SDK 认证/HTTP 行为测试。**当前 wide 解析为 1.100.0 不能倒推出作者此前声称使用 1.99.0 测试是虚构。** 已有环境保持 1.99、不同采集时间或镜像同步状态、显式安装/constraints 均是合理解释。需比较作者当时的安装清单、时间与命令才能区分。[pip 保留已满足安装版本的规则](https://pip.pypa.io/en/stable/cli/pip_install/#overview)也限制了这类推断。

[新增单测](https://github.com/liuzhao1225/YouDub-webui/blob/1add1b6d90795ddc222c3f5021305a2e8d953a17/backend/tests/test_litellm_translate.py#L17)使用 types.ModuleType 和 sys.modules stub；名称含 end_to_end 的翻译测试也沿用该 stub。第一个测试明确断言 `anthropic/...` 模型仍收到 `api_key="sk-test"`，所以它验证了适配器传参，但没有检测这个 key 属于哪个提供商，也没有观察 SDK 真实认证头/目标地址。常规 mock 既不证明恶意，也不证明真实制品兼容或安全。作者另有真实端点测试声明，见 [PR 描述](https://github.com/liuzhao1225/YouDub-webui/pull/130)，本次没有独立验证。

| 缺口 | 可在不执行被调查包的前提下完成的下一项 | 条件与界限 |
| --- | --- | --- |
| 真实安装范围 | 读取目标构建的 requirements/constraints/lock、安装报告/SBOM、dist-info METADATA 与 RECORD、Python/平台及镜像 digest | 需指定环境和读取授权；无需打开秘密值。已有 inventory 必须绑定时间和制品。单纯文件名缺失无法排除其他安装路径。 |
| 下游完整依赖求解 | 先补齐必需根 dora-search/openai-whisper 的可信现成 wheel 与目标环境条件，再用纯 wheel 元数据求解并保存版本/制品哈希 | 已验证现有 uv 能力，但完整根集在已查 PyPI/Aliyun 候选集下无纯 wheel 解。14 个声明最低版本元数据不是替代解。禁止 sdist/build backend；dry-run 本身不保证无执行。 |
| 凭据与目标是否匹配 | 静态复核 provider-aware 凭据选择设计；请作者提交真实包、哨兵 key 的 HTTP 边界测试结果 | 动态测试须另在隔离环境进行；本次未运行。包括保留旧 key、clear_api_key、custom base、provider env 与失败前置条件。 |
| 源码和制品身份 | 对准确 wheel/sdist/锁定传递制品读取并比对哈希、元数据、声明来源和可用构建证明 | matching RECORD 或签名通过仅证明对应关系/签名事实，不能代替行为审计。原生/前端线由总管协调，避免重复。 |
| 作者声称 1.99.0 真实测试 | 请求命令、Python/平台、完整依赖锁、wheel SHA、实际响应与认证边界说明 | 声明本身和 mock 测试不足以复现；未回复也不能证明意图。 |

本次已完成固定源码判读、六个 LiteLLM 基础子图的真实无安装解析及 88 个 wheel 候选的索引对照。完整下游依赖解、跨时间漂移、实际部署暴露、真实 HTTP 边界行为和整个制品是否恶意仍是独立问题。

## 材料索引

- [source-manifest.json](source-manifest.json)：104 个源文件身份记录与两版 pyproject 静态声明。
- [dependency-floor-metadata.json](dependency-floor-metadata.json)：14 个准确最低版本的第一手元数据、响应 SHA、发布制品 SHA/URL/时间；markers/extras 原样保留。
- [reviewed-candidates.json](reviewed-candidates.json)：76 项人工判读与适用条件。
- [candidate-contexts.json](candidate-contexts.json)：对最终扫描的上下文和版本差异补充，原 runtime-paths JSON 保持只读。
- [resolution/wheel-feasibility.json](resolution/wheel-feasibility.json)、[镜像核对](resolution/mirror-wheel-feasibility.json)：工具版本/哈希、固定对照输入、项目支持目标及阻断纯 wheel 解的完整索引文件列表。
- [check_wheel_resolution.py](check_wheel_resolution.py)：先检查纯 wheel 候选是否存在；不执行解析器、安装器或构建后端。
- [youdub/](youdub/)：12 个固定 head 的公开源码快照，未包含任何运行时秘密。
- [collect_static.py](collect_static.py)、[classify_candidates.py](classify_candidates.py)：使用可信 Python `-I -S` 读取数据的脚本，不导入被调查包。

- [SDK 子图 runs.json](resolution/sdk-subgraph/runs.json)、[comparison.json](resolution/sdk-subgraph/comparison.json)、[artifact-index-check.json](resolution/sdk-subgraph/artifact-index-check.json)：六次真实解析的命令/UTC/哈希、55 包对照、88 个 wheel 索引记录。
- [resolve_sdk_subgraph.py](resolve_sdk_subgraph.py)、[summarize_sdk_resolution.py](summarize_sdk_resolution.py)：无安装解析与结果对照工具。SDK cache/tmp/config/credentials 已由目录内 .gitignore 排除，交付清单也排除这些运行材料。
