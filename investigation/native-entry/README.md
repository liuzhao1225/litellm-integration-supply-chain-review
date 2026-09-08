# LiteLLM Linux x86_64 原生扩展入口审计

## 结论与适用范围

在这里明确列出的 ELF 加载入口、`_native` 模块初始化回调和一层直接调用中，未定位到 **1.100.0 新增的初始化即读取凭据、执行进程或外联行为**。两个版本的模块初始化源码相同；相关机器码的地址归一化比较也相同。这个结果降低了“恶意代码直接插在初始化入口”的怀疑，不能证明整个原生扩展安全，也不能给出被攻击概率。

对象仅为官方 PyPI 两个 `cp310-abi3-manylinux_2_28_x86_64.whl` 内的 `litellm/rust_bridge/_native.abi3.so`，不外推到其他平台、容器或运行中的机器。采集时间从 **2026-09-08 21:01:46 UTC** 起；时间及完整哈希见 [entry-summary.json](entry-summary.json)。本目录独立补充已发布的调查，不修改原发布链证据。

| 对象 | 1.99.0 | 1.100.0 |
|---|---|---|
| [PyPI 版本元数据](https://pypi.org/pypi/litellm/1.99.0/json) / [1.100 元数据](https://pypi.org/pypi/litellm/1.100.0/json) | wheel SHA256 `1c45097e426fed2ae7fbd38b5404c3addeb203d0e1148c0a59848aabd5fe83c6` | wheel SHA256 `8224c8eed9cab3319a88e6665d1275ad8faf21d353b1b22223a6d6115a302ea2` |
| 原生成员 SHA256 | `2345a380bce52f040ff2ea0a7b1988e8f682a40e63bcb3b8ac822c53149e09a6` | `c6992e805578007dc61f872127fb164490751adc6556c6b37e58f550a0f23951` |
| 固定源码 commit | `fa647f742d7baefe8eb1181899d9c81b41559772` | `e4f25265704e2b2c6cf6e81be2e4c5cffff896f4` |

所有地址均为 ELF 虚拟地址，尚未加 ASLR 加载基址。JSON 同时保存关键函数的文件偏移。

## ELF 加载时的执行入口

两版 `.init_array` 都有三个指针，没有新增槽。按重定位解析后的顺序如下，原始证据见 [entry-summary.json](entry-summary.json) 和版本子目录反汇编。

| 入口 | 1.99.0 VA | 1.100.0 VA | 已观察行为 |
|---|---|---|---|
| 构造器 0 | `0x829400` | `0x8317b0` | 入口第一字节均为 `c3`，直接返回。未强行归因到已剥离的函数名。 |
| 构造器 1 | `0x27aaf0` | `0x27c6f0` | `endbr64` 后跳到 `0x27aa70` / `0x27c670`。两个地址相减为零，分支直接返回；结构符合 CRT 的 TM clone 注册桩。 |
| 构造器 2 | `0x879d40` | `0x882480` | 跳到 `0x8ace60` / `0x8b55a0`，执行 CPU 指令集探测。 |

第三个构造器的目标函数均为 **676 字节**，地址归一化后指令序列相同。它确实调用 `getenv`；由调用前 `%rdi` 参数的字符串指针确认，读取的是 **`OPENSSL_ia32cap`**（字符串 VA `0xd69c2` / `0xd7df3`）。结果用于解析和设置 CPU 能力位，辅助函数使用 `sscanf`；不支持的能力请求可触发 `fprintf` 和 `abort`。这属于实际环境变量读取，有明确的正常解释。

可归因源码为两版 Cargo.lock 同时锁定的 [`aws-lc-sys 0.43.0`](https://static.crates.io/crates/aws-lc-sys/aws-lc-sys-0.43.0.crate)：[crypto.c](sources/aws-lc-sys-0.43.0/aws-lc/crypto/crypto.c) 56–68 行声明构造器并调用 `OPENSSL_cpuid_setup`；[cpu_intel.c](sources/aws-lc-sys-0.43.0/aws-lc/crypto/fipsmodule/cpucap/cpu_intel.c) 94–141、170–303 行对应 CPU 探测、环境变量读取及解析。下载归档 SHA256 `43103168cc76fe62678a375e722fc9cb3a0146159ac5828bc4f0dfd755c2224c` 与两版锁文件一致。源码归因由控制流、参数和常量共同支持，尚无重建比特级一致性证明。

`DT_INIT` 对应 `.init`（`0x27a9fc` / `0x27c614`）均只包含对弱符号 `__gmon_start__` 的判空及条件调用。CRT 桩引用 `_ITM_registerTMCloneTable` 等弱符号。两版动态符号中均无 `STT_GNU_IFUNC`，重定位中均无 `R_X86_64_IRELATIVE`；这覆盖了本次可解析的这些额外初始化机制。弱符号实际解析结果由宿主决定。[重定位和入口槽证据](registration-and-hooks.json)

## Python 模块初始化

| 字段 | 1.99.0 | 1.100.0 |
|---|---|---|
| `PyInit__native` | `0x27ab00`，13 字节 | `0x27c700`，13 字节 |
| 模块定义 | `0xaf0f98` | `0xaf99c8` |
| 跳转 GOT | `0xaeef58` → `PyModuleDef_Init` | `0xaf7878` → `PyModuleDef_Init` |
| `Py_mod_exec=2` 槽 | `0xaf1068` → `0x32b4b0` | `0xaf9a98` → `0x33d910` |
| 回调范围 | `[0x32b4b0, 0x32ba86)` | `[0x33d910, 0x33dee6)` |

两个导出入口均为 `lea` 模块定义地址后跳到 Python 的 `PyModuleDef_Init`。每个模块定义仅有一个执行槽和零终止槽。回调边界从 `.eh_frame_hdr`/FDE 解出，不根据下一个导出符号猜测。[解析结果](resolved-entries.json)

固定 [`1.99 lib.rs` 632–649 行](https://github.com/BerriAI/litellm/blob/fa647f742d7baefe8eb1181899d9c81b41559772/litellm-rust/crates/python-bridge/src/lib.rs#L632) 与 [`1.100 lib.rs` 618–635 行](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/litellm-rust/crates/python-bridge/src/lib.rs#L618) 的 `#[pymodule]` 至文件末尾逐字相同，SHA256 为 `293a9d17a5b4c12a4941aa065bfc67cc7684ca3c4d525ca98d40c8af10c35a3d`。两份完整源码的 Git blob SHA 均与既有固定树清单吻合。[源码校验](litellm-source-files.json)

二进制中也定位到相同顺序的十个 PyMethodDef 名称：`ocr`、`aocr`、`transcription`、`atranscription`、`messages`、`amessages`、`chat_completions_decline`、`chat_completions`、`achat_completions`、`gil_stats`；另有两种异常类型和 `ResponsesWebSocketConnection` 类注册。方法函数指针的注册不等于执行这些方法。[方法定义指针](registration-and-hooks.json)

PyO3 的普通多阶段初始化可解释该结构：[`pyo3 0.29.0` 归档](https://static.crates.io/crates/pyo3/pyo3-0.29.0.crate) 内 [pymodule.rs](sources/pyo3-0.29.0/src/impl_/pymodule.rs) 127–129、274–287 行，以及 [宏生成源码](sources/pyo3-macros-backend-0.29.0/src/module.rs) 510–574 行、[trampoline.rs](sources/pyo3-0.29.0/src/impl_/trampoline.rs) 17–29 行。归档校验和匹配锁文件。[依赖归档证据](source-archives.json)

初始化回调的 **1,494 字节**及按 call 出现顺序配对的 **17 个直接本地被调函数**，在去除 PC 相对地址和直接分支目标地址后，指令序列全部相同；可解析的外部符号引用顺序也全部相同。[指令比较](normalized-comparison.json)、[外部符号比较](import-reference-comparison.json)、[直接调用配对](direct-call-pairs.json)。观察到的是 Python 函数/类型创建、引用计数、异常处理和同步操作；其中 `syscall` 的相关参数为 `202/0xca`（x86_64 futex），不应据“出现 syscall”推断进程启动。

两版还导出 `PyInit_pyo3_async_runtimes`，来自依赖自身的模块声明；[固定依赖 lib.rs](sources/pyo3-async-runtimes-0.29.0/src/lib.rs) 365–369 行只注册 `RustPanic`。这个额外导出符号本身不会令 Python 自动调用它。其执行槽也已单独反汇编保存。

## 动态加载及风险解释

对全 `.text` 反汇编中的敏感 GOT 引用做定向定位，两个版本命中的 `dlsym` 调用均传入 **`__pthread_get_minstack`**，handle 为零：调用 VA 分别为 `0x835d47` / `0x83e0f7`。这与对应嵌入 Rust 编译器修订的 [`std::sys::thread::unix::min_stack_size`](https://github.com/rust-lang/rust/blob/48a229ceaefd4985c50990b14116b6d856af0985/library/std/src/sys/thread/unix.rs#L1006) 一致；两个修订的相关文件均已固定保存。[Rust 源码哈希](rust-source-files.json)

这条证据说明该动态符号查询存在正常用途；**没有证明该路径在导入 `_native` 时可达**。扫描同时发现通用 `getenv` 包装路径及加密库的 PLT 跳板，不能将扫描输出中的三条引用等同于所有实际调用点。未发现 `dlopen`、`system`、`popen`、`fork`、`exec*` 的动态导入；静态系统调用、寄存器间接调用和 Python 回调仍可能绕开此类符号检查。[1.99 引用点](1.99.0/sensitive-import-sites.json)、[1.100 引用点](1.100.0/sensitive-import-sites.json)

## 限制与可区分的后续证据

- 地址归一化会隐藏指针目标变化；相同指令序列及外部符号顺序不构成全程序等价证明。已核对十个方法名，未证明所有被注册方法实现以及全局数据、类型创建回调、异常路径的深层调用均等价。
- stripped ELF 的 objdump 会把后续代码标成最近的 `PyInit_*+offset`。这种展示标签不是真实函数名；本文采用入口指针和 FDE 地址范围，不按显示标签归因。早期 `init_array-*.asm` / `fini_array-*.asm` 为固定窗口，窗口中入口返回后的邻接函数不算构造器行为。
- 源码归档哈希验证的是“取得了锁文件指定的源码”，仍无法证明发布二进制由这些源码和声明工具链构建。没有重做已确认缺失的 provenance 请求或访问私有发布仓库。
- 若要继续提高可信度，优先取得发布方可验证的构建证明、完整构建输入或在独立隔离环境得到可重复构建结果。宿主是否已受影响应依赖运行日志和文件/网络证据另行判断；本审计没有执行或导入目标。

## 方法、交付与取证错误

只使用 `python3 -I -S` 标准库读取 ZIP/ELF，以及预先存在的 Apple LLVM objdump 静态反汇编。未安装工具、包或容器；未执行目标、修改业务代码、提交或发布。`.inputs/` 保存忽略的中间数据，公开文件不包含 wheel、原生二进制或全库反汇编。

可复查脚本为 [inspect_elf.py](inspect_elf.py)、[trace_entries.py](trace_entries.py)、[expand_trace.py](expand_trace.py)；它们依次提取已固定哈希的成员、解析入口和展开一层调用。原始版本 JSON、定向反汇编、固定源码及逐文件哈希是本次交付依据。完整公开清单见 [evidence-sha256.json](evidence-sha256.json)。

取证中显式遇到并修正的错误：本机 Python 无 `tomllib`，改为仅解析锁文件的 name/version/checksum 字段；初始参数注释读取器错误假定所有 `lea` 都有绝对地址注释，已收紧条件；首次将外部 GOT 指针按本地地址读取得到零，随后根据 `R_X86_64_GLOB_DAT` 正确解析为 `PyModuleDef_Init`，无效临时结果已移除。docs.rs 的辅助页面请求返回内部错误，源码依据使用已成功校验的 crates.io 归档。上述错误不作为成功或安全证据。
