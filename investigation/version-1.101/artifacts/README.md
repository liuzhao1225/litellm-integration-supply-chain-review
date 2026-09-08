# LiteLLM 1.101.0rc1 七平台 wheel 静态审计

## 结论与版本身份

**七个平台 wheel 均匹配 PyPI 公布的 SHA256，RECORD 全部通过，所含 Python 文件均能匹配固定候选源码。Linux x86_64 新增的唯一动态导入 `PyErr_CheckSignals` 符合 Python 3.10 Stable ABI，并有同步等待时处理信号的源码解释。未在本次有界检查中定位到新增的启动窃密或隐蔽外联实证。** 这不构成整个候选版本的安全证明。

本报告对象是 **PyPI `1.101.0rc1` / GitHub `v1.101.0-rc.1`**。正式 `1.101.0` 在根任务 2026-09-08 21:27 UTC 的检查中 PyPI/GitHub 均为 404。[版本可用性原始记录](../availability.json)

候选标签在 2026-09-08 **21:41:00.120044 UTC** 解析为 commit **`eeb7732fc11fd47762ca84cc3fb7cc74235d7097`**，tree **`502d9ab4cdfaade8c91f78ef81096724c6c68000`**。[固定标签解析](tag-resolution.json)、[完整且未截断的 Git 树](fixed-tree.json)、[候选 GitHub release](https://github.com/BerriAI/litellm/releases/tag/v1.101.0-rc.1)

PyPI 七个 wheel 上传时间为 **2026-09-06 03:06:01.687228–03:06:17.684017 UTC**；GitHub 候选 release 发布于 **03:20:59 UTC**。这些来源和时间只描述候选版，不能用于本次未取得记录的正式版。[根任务原始记录](../availability.json)、[PyPI 候选版本](https://pypi.org/pypi/litellm/1.101.0rc1/json)

## 制品完整性和启动入口

下载优先完成 Linux x86_64，再完成其余平台。仅下载数据，不安装、导入、构建或执行目标。每包外部 SHA256 与已保存的 PyPI 清单一致。[七包下载与哈希](download-summary.json)

| 平台 | RECORD 中已验证文件哈希数 | Python 文件数 | Python 与固定 Git 对照 |
|---|---:|---:|---|
| manylinux x86_64 | 3,462 | 2,323 | 全部逐字匹配 |
| manylinux aarch64 | 3,462 | 2,323 | 全部逐字匹配 |
| musllinux x86_64 | 3,463 | 2,323 | 全部逐字匹配 |
| musllinux aarch64 | 3,463 | 2,323 | 全部逐字匹配 |
| macOS x86_64 | 3,462 | 2,323 | 全部逐字匹配 |
| macOS arm64 | 3,462 | 2,323 | 全部逐字匹配 |
| Windows amd64 | 3,462 | 2,323 | 80 个逐字匹配，其余 2,243 个经 CRLF→LF 后匹配 |

合计 **24,236 个 RECORD 文件哈希**通过。未出现重复路径、重复 RECORD 行、越界路径、符号链接、漏记文件或异常未哈希文件；RECORD 自身不带哈希属于预期行为。没有 `.pth`、`sitecustomize.py`、`usercustomize.py` 或 `.data/scripts/` 文件。[七包审计结果](wheel-audit-summary.json)

三个 console_scripts 均与 1.100 相同：`litellm=litellm:run_server`、`lite=litellm.proxy.client.cli:cli`、`litellm-proxy=litellm.proxy.client.cli:cli`。这是显式 CLI 入口，不代表所有 Python 模块导入均无副作用。[入口和 WHEEL 元数据](metadata-comparison.json)

每包的 `*.inventory.json` 列出所有成员路径、字节数及 SHA256；`*.python.json` 保存 Python 文件的 Git blob、精确/换行匹配情况、与 1.100 的变化分类。Git blob 对照无需逐个运行或下载 Python 文件。

## Python 与依赖变化

每个平台相对对应的 1.100 wheel 均为 **43 个 Python 文件新增、597 个修改、0 个删除**。全部内容对应固定候选源码；[python-diffs](python-diffs/) 保存 Linux 的 640 份新增/修改文件 diff。该数量反映变化范围，没有表示 640 份逻辑已逐项完成安全审查。

已定向读取启动相关的 `litellm/__init__.py`、Rust bridge 包入口、loader 和新增 configuration：增加全局 `rust` 配置接口；可选 Rust 路径的 `DEFAULT_RUST_ENABLED=False`；配置读取 `LITELLM_RUST` 和旧 `LITELLM_USE_RUST_OCR`，并允许请求/进程覆盖。Rust-only 路径不受该开关全部控制。loader 新增的 reset 函数只重设缓存变量，函数声明本身不执行重新导入。[配置 diff](python-diffs/litellm__rust_bridge__configuration.py.diff)、[loader diff](python-diffs/litellm__rust_bridge__loader.py.diff)、[包入口 diff](python-diffs/litellm____init__.py.diff)

基础 **14 项 `Requires-Dist` 与 1.100 逐字相同**。变化集中在 extras：

| extra | 实际元数据变化 |
|---|---|
| proxy | `litellm-enterprise` 0.1.62→0.1.65；`litellm-proxy-extras` 0.4.91→0.4.94；非 Windows `uvloop` 下限 0.21.0→0.22.1 |
| proxy-runtime | `pypdf` 下限 6.12.0→6.16.1 |
| extra-proxy | 新增 `psycopg`、`psycopg-binary`，均 `>=3.2,<4.0` |
| mongodb | 新增 `pymongo>=4.9,<5.0` |

七包的依赖变更集合一致。这些传递依赖的独立制品和行为没有在本次 wheel 审计中展开。[依赖原文及差异](wheel-audit-summary.json)、[基础依赖核对](metadata-comparison.json)

## Linux x86_64 原生入口与 ABI

候选 wheel SHA256：`38273b92727303fd6e759fa9306b47c43e52a57c3ce583b239457c7dd5b8e598`。原生成员 `_native.abi3.so` 为 **11,492,368 字节**，SHA256 **`e404b9b2deb5672e7419af14de32f61232f8e80de7de5c07bc5da9dab09d2ff4`**。[原生摘要](native-summary.json)

三个 `.init_array` 入口依次为 `0x82e650`、`0x27eb30`、`0x87f880`，分别为直接返回、CRT 桩、跳转至 CPU 能力探测。最后一个跳到 `0x8b29a0`，676 字节，地址归一化后的指令序列与 1.100 相同；保留了 AWS-LC 读取 `OPENSSL_ia32cap` 的正常解释。无新增构造器槽，未发现 IFUNC 动态符号或 IRELATIVE 重定位。[反汇编](native/1.101.0rc1/)、[原生摘要](native-summary.json)

`PyInit__native` 仍为 13 字节，地址 `0x27eb40`，传递模块定义后通过 GOT 跳到 `PyModuleDef_Init`。唯一 `Py_mod_exec` 为 **`0x3582e0`，1,819 字节**，1.100 对应为 1,494 字节；直接 `call` 指令数量 **38→42**。没有将该回调判为等价。

已经解释的变化：固定 [`lib.rs` 65–76 行](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm-rust/crates/python-bridge/src/lib.rs#L65) 改为声明式模块和 `gil_used=false`，初始化调用顺序为 `errors::register`、`routes::register`、WebSocket 类注册、`diagnostics::register`。二进制仍能定位十个与 1.100 名称和次序一致的 PyMethodDef：OCR、转录、messages、chat_completions 相关函数及 `gil_stats`；错误类型注册移至前部，字符串/类型创建代码也有结构变化。已展开候选回调的 **20 个直接本地被调函数**。[注册指针及一层调用](native-registration.json)、[固定源码校验](additional-native-sources.json)

仍未解释到逐指令等价的部分：编译器/PyO3 变化对所有内联、异常分支、类型构造回调及间接调用的影响。源码注册顺序能够解释主要结构变化，尚无候选完整二进制可重复构建或全调用图证明。

相对 1.100，整个 Linux x86 原生库仅新增一个未定义动态符号 **`PyErr_CheckSignals`**，无删除。共 **112/112 个 Python 动态导入**均属于固定 CPython 3.10 Stable ABI 清单，不要求更高版本。[逐项记录](native-summary.json)、[官方固定 Stable ABI 清单](https://github.com/python/cpython/blob/b494f5935c92951e75597bfe1c8b1f3112fec270/Misc/stable_abi.txt)

该新增符号在二进制中定位到 `0x2d329a`、`0x36e26d`、`0x36e8f3`、`0x36ef39` 四处直接 GOT 引用。源码 [`execution.rs` 89–105 行](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm-rust/crates/python-bridge/src/execution.rs#L89) 的 `wait_for_sync_result` 在等待同步结果时每 50ms 调用 `py.check_signals()`；这是可核对的正常用途。调用点没有落在模块 exec 本体中，但本次未证明所有深层路径的可达性。[信号与敏感符号调用点](native-sensitive-sites.json)

`dlsym` 的已定位调用 VA `0x83af97`，参数为 `__pthread_get_minstack`，继续符合 Rust 线程栈大小查询用途。符号检查和一层调用检查均不能排除其他静态系统调用或深层间接行为。

## 编译标识与 ABI 配置的来源缺口

七个平台候选 native 均嵌入 Rust 修订 **`88d9e12ae178fab0fb5cc050a94da85685d449ea`**，对应此前固定核对的 Rust 1.98.0。1.100 Linux 原生制品使用的嵌入修订对应 1.98.1。编译器字符串可伪造，不能认证真实构建环境。两个 musllinux wheel 随带的 libgcc 与各自 1.100 对应成员逐字相同，七个主要原生成员均有变化。[各平台成员哈希和修订](wheel-audit-summary.json)

**七个候选 wheel 的 WHEEL 都自报 `Generator: maturin (1.9.4)`，而构建专项确认候选 sdist 的 build-system 要求 maturin 1.15.0。** 外部旧版 CLI 构建等解释仍可能成立；不能直接认定篡改，也不能把 sdist 声明当作 wheel 实际构建工具版本。[WHEEL 原文](metadata-comparison.json)、[构建专项](../build/README.md)

候选固定 Cargo.toml 显式恢复 `default=["abi3"]`、`abi3=["pyo3/abi3-py310"]`。[固定配置](https://github.com/BerriAI/litellm/blob/eeb7732fc11fd47762ca84cc3fb7cc74235d7097/litellm-rust/crates/python-bridge/Cargo.toml#L12) 对照既有结果：1.99 固定 Git 只有 `extension-module`，其 sdist 单独添加 `abi3-py310`；1.100 同一依赖文件未保留该 feature。候选的显式默认配置改善了声明可核对性，实际构建参数及是否禁用 default features 仍需构建来源证据。[1.99 精确差异](../../abi-compatibility/git-vs-sdist-1.99.0-Cargo.diff)、[ABI 配置来源分析](../../abi-compatibility/README.md)

## 方法、限制与交付

- 使用 Python 标准库读取 ZIP/ELF/文本及预先存在的 objdump；只导入本调查自行编写的解析器。无目标代码执行、安装、构建、远端脚本执行、提交、推送或外部评论。
- 六个 Unix wheel 逐字匹配源码。Windows 只对未逐字匹配的文件接受换行匹配。Git 自身有一份 CRLF 的 `litellm/llms/brave/search/__init__.py`：初始摘要只看 LF 规范化结果，曾将其误列为不匹配；已修正为“精确匹配或规范化匹配”并保留两个原始标记，没有实际源码缺失。七包最终均为 2,323/2,323。
- RECORD 和固定源码匹配证明一致性，不能认证发布者或排除恶意逻辑。597 份修改没有逐项语义审查；其余六平台 native 仅完成成员哈希/编译标识核对，不享有 Linux x86 入口审计的覆盖。
- 无需重复下载 sdist，由构建专项处理；这里只读复用少量构建专项源码并重新核验固定 Git blob。容器签名和 SLSA 由[镜像专项](../images/README.md)另行说明。
- 复核脚本为 [download_wheels.py](download_wheels.py)、[audit_wheels.py](audit_wheels.py)、[audit_native.py](audit_native.py)。后两者复用已有只读审计辅助文件；提供的固定来源、逐成员哈希和反汇编可独立复查。

公开白名单和逐文件 SHA256 见 [evidence-sha256.json](evidence-sha256.json)。原始 wheel、原生二进制和全库反汇编仅留在忽略目录 `.inputs/`，不属于公开文件。
