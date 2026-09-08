# LiteLLM cp310-abi3 动态导入符号核对

**结果：两版 Linux x86_64 原生扩展的 Python 动态导入符号，全部满足官方 Stable ABI 清单中不高于 3.10 的起始版本声明。没有找到要求 Python 3.11 或更高版本的实际动态导入。** 这是一项有界的负面结果，仍无法验证构建时的 feature 配置、所有内联代码及结构布局。

## 对象和固定依据

读取已校验的 `litellm-1.99.0-cp310-abi3-manylinux_2_28_x86_64.whl` 与 `litellm-1.100.0-cp310-abi3-manylinux_2_28_x86_64.whl` 中 `_native.abi3.so` 的 ELF `SHN_UNDEF`、名称以 `Py` / `_Py` 开头的动态符号。两包内部 WHEEL 元数据均明确写 `Tag: cp310-abi3-manylinux_2_28_x86_64`，Generator 为 maturin 1.9.4。[WHEEL 元数据与哈希](wheel-tags.json)

输入原生成员 SHA256 分别为 `2345a380bce52f040ff2ea0a7b1988e8f682a40e63bcb3b8ac822c53149e09a6`、`c6992e805578007dc61f872127fb164490751adc6556c6b37e58f550a0f23951`。完整 wheel 哈希及只读输入 JSON 的哈希见 [symbol-audit.json](symbol-audit.json)。核查时间为 **2026-09-08 21:21:44.962712 UTC**。

官方依据由标签解析到固定 commit 后下载为数据，保留标签解析链、URL、SHA256 和时间：[official-sources.json](official-sources.json)。

- CPython v3.10.0，commit `b494f5935c92951e75597bfe1c8b1f3112fec270`：[Misc/stable_abi.txt](https://github.com/python/cpython/blob/b494f5935c92951e75597bfe1c8b1f3112fec270/Misc/stable_abi.txt)。这是最低版本的直接依据。
- CPython v3.14.0，commit `ebf955df7a89ed0c7968f79faec1de49f61ed7cb`：[Misc/stable_abi.toml](https://github.com/python/cpython/blob/ebf955df7a89ed0c7968f79faec1de49f61ed7cb/Misc/stable_abi.toml)。用于检查后续清单是否有不同的类型、起始版本或 ABI-only 标记。

## 逐项结果

| 项目 | 结果 |
|---|---|
| 1.99 Python 未定义动态符号 | 77 个，全部命中 3.10 清单 |
| 1.100 Python 未定义动态符号 | 111 个，全部命中 3.10 清单 |
| 新增 / 删除 | 34 / 0 |
| 新增符号种类 | 23 个 function，11 个 data |
| 新增符号 Stable ABI 起始版本 | 33 个为 3.2，1 个为 3.10 |
| 未列入清单 / 要求高于 3.10 | 0 / 0 |
| 两份官方清单种类、起始版本、ABI-only 一致 | 111 / 111 |
| 这 111 项清单中的条件导出标记 | 均无 `ifdef` 等条件标记 |

完整新增符号和每项官方清单行号见 [added-symbols.md](added-symbols.md)；全部 111 项原始条目、ELF 信息和判定见 [symbol-audit.json](symbol-audit.json)。没有把“查不到”自动转换为“不兼容”；这里所有符号均有明确命中。

三个容易误判的例子：

- **`Py_NewRef`** 是 1.100 新增函数，3.10 起进入 Stable ABI，符合 `cp310` 下限。[3.10 清单 2079 行](https://github.com/python/cpython/blob/b494f5935c92951e75597bfe1c8b1f3112fec270/Misc/stable_abi.txt#L2079)；[object.h 575、592–596 行](https://github.com/python/cpython/blob/b494f5935c92951e75597bfe1c8b1f3112fec270/Include/object.h#L575) 同时声明函数并解释宏/内联形式与稳定函数导出的关系。
- **`_Py_TrueStruct`、`_Py_FalseStruct`** 是新增 data，官方列为 3.2 起的 **abi_only**。Stable ABI 明确允许这类底层符号存在，即使它们不属于面向用户的 Limited API。下划线和未出现在普通 API 文档中都不足以证明违规。[条目](https://github.com/python/cpython/blob/b494f5935c92951e75597bfe1c8b1f3112fec270/Misc/stable_abi.txt#L1632)、[abi_only 的官方定义](https://github.com/python/cpython/blob/ebf955df7a89ed0c7968f79faec1de49f61ed7cb/Misc/stable_abi.toml#L31)
- **`_Py_IncRef`、`_Py_DecRef`** 两版已有，均为 3.10 起稳定的 abi_only 函数。[条目](https://github.com/python/cpython/blob/b494f5935c92951e75597bfe1c8b1f3112fec270/Misc/stable_abi.txt#L2119)；不能因这些符号存在就推断启用了某种调试构建。`PyCMethod_New` 两版也已有，清单注明 Windows 早期补丁版本例外，但该例外不超过本次 3.10 下限，审计对象为 Linux。

ELF 中这 188 项版本内符号记录均为 `STT_NOTYPE`；函数/数据分类采用官方清单，未从 ELF 的无类型信息臆测。额外对照两份官方生成的 `PC/python3dll.c`，111 个名称的 `EXPORT_FUNC` / `EXPORT_DATA` 均与清单一致。[222 项对照记录](windows-export-crosscheck.json)。它只验证声明和生成导出清单的一致性，不证明 Linux 或 Windows 运行环境实际可加载。

## feature 缺口及无法由符号表判断的部分

静态核实 sdist 配置：1.99 的 python-bridge Cargo.toml 15 行有 `pyo3` features `extension-module`、`abi3-py310`；1.100 改为 workspace 依赖，单独的 `extension-module` feature 转发到 `pyo3/extension-module`，该文件不含 `abi3-py310`。WHEEL 仍声明 cp310-abi3。[sdist 配置文件和哈希](configuration-sources.json)

这项配置缺口需要完整构建参数、环境或可验证构建记录解释。**现有符号结果既没有证明它造成 ABI 违规，也没有证明构建实际启用了 abi3。** 后续解释由构建专项统一处理，本目录不继续扩大目标。

取证时，一次将 sdist 配置与固定 Git blob 做逐字校验的断言失败：1.99 的 `litellm-rust/crates/python-bridge/Cargo.toml` 实算 blob 为 `10d58b5ede562e50d9a3f5bce2570aae5e08f112`，固定 Git 树为 `20a9ba789cee7a2f3b50d835d7b6712d221ab70c`。该文件按 **sdist 原文**保留，未标成 Git 原文；两版 pyproject.toml 和 1.100 的该 Cargo.toml 均通过 Git blob 核对。使用此前已取得的固定 Git 原文进一步核对，blob 校验通过；**全部文本差异仅为第 15 行的 features 数组在 sdist 中增加 `"abi3-py310"`**。Git 原文仅有 `"extension-module"`；其余字节一致，没有 workspace/path 重写或格式规范化。[精确 diff](git-vs-sdist-1.99.0-Cargo.diff)、[Git 原文](git-1.99.0-python-bridge-Cargo.toml)、[校验与来源](git-vs-sdist-1.99.0-Cargo.json)。因此，1.99 已存在 Git 配置与发布 sdist 配置不同的事实，差异直接涉及 ABI feature。哪个打包或构建步骤添加该 feature 尚未确定。这个差异不影响动态符号与官方 Stable ABI 清单的比较，也不单独构成恶意行为证据。

剩余边界包括：编译器内联/宏展开、直接结构字段访问、数据对象的使用方式、调用签名与约定、类型槽/回调布局、按字符串解析的符号以及宿主配置。这些行为可能不产生新动态导入。数据符号被列入 ABI 不保证调用方可以依赖其全部内部布局。单靠 `.dynsym` 不能证明完整 ABI 兼容、可靠运行或供应链安全。

## 交付

使用 [check_abi.py](check_abi.py) 对固定版本清单的 function/data 简单条目做静态解析，保留原始条目供逐项复核；不运行下载的 CPython 工具或目标 Python，不安装或导入 wheel，不新增工具，不改 native-entry。公开文件清单及 SHA256 见 [evidence-sha256.json](evidence-sha256.json)。
