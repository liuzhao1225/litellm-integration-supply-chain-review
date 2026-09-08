# LiteLLM 1.99.0 / 1.100.0 sdist 构建时执行面

静态采集开始于 2026-09-08T21:09:58.916883Z。审计对象是两个发布的源码归档及与差异直接相关的第三方构建源码。所有目标均作为数据读取；未安装、导入、编译或执行 LiteLLM、maturin 或 crate，没有调用 Cargo metadata/build、PEP 517 hook 或目标解释器探测。结论覆盖下述静态入口，无法证明实际发布构建、运行行为或制品整体安全。

## 已确认的差异与结论

1. 两版 `[build-system]` 均为 `requires = ["maturin==1.9.4"]`、`build-backend = "maturin"`，没有 `backend-path`。`[tool.maturin]` 逐字段、逐字节相同；没有增加包内 Python 构建后端或打包 hook。两版唯一包自身 `build.rs` 均只读取目标 OS，在 macOS 输出两个链接参数；该文件完全相同。[两版构建配置快照](sources/1.100.0/pyproject.toml.txt)、[完整 pyproject 差异](diffs/pyproject.toml.diff)、[build.rs](sources/1.100.0/litellm-rust/crates/python-bridge/build.rs.txt)。
2. `Cargo.lock` 从 258 项增至 295 项，新增 37 项，无删除。原有 registry 包的版本、来源、checksum 和依赖记录均未变；唯一变化的既有条目是本地 `litellm-python-bridge` 的依赖列表。新增 1 项是普通依赖 `pythonize 0.29.0`，另外 36 项属于 `criterion` 开发依赖可达树（包括 criterion 自身）。这是锁文件图的静态归属，未做目标/feature 解析。[准确差异与记录](archive-analysis.json)、[完整 Cargo.lock diff](diffs/litellm-rust/Cargo.lock.diff)、[归属计算](reachability.json)。
3. 从官方 crates 静态分发源读取的新增 37 个 crate 及相关既有 `cc`、`pyo3`、`pyo3-ffi`、`pyo3-build-config` 共 41 个归档，实际 SHA-256 全部等于该锁文件 checksum。新增 crate 均未声明 `proc-macro`；pythonize 的规范化 manifest 明确 `build=false`，无 build-dependencies。另有 9 个新增 crate 带 build.rs，全部位于 criterion 开发依赖树；已读脚本及引用文件的行为见下表。[41 个来源、checksum、manifest 字段和成员清单](crate-analysis.json)、[补充引用文件](additional-source-members.json)。
4. 一个需要保留的构建配置差异：1.100 将 `pyo3/extension-module` 移到 bridge 默认 feature，删除了原有显式 `pyo3/abi3-py310`。所有包内 workspace/成员 manifests 和 maturin 字段均未补回 ABI3 feature。公开 wheel 的 `cp310-abi3` 标签仍需发布时外部参数或其他构建证据解释；本审计没有该私有发布 workflow 的命令。[bridge manifest 差异](diffs/litellm-rust/crates/python-bridge/Cargo.toml.diff)、[固定 maturin ABI3 判定代码](https://github.com/PyO3/maturin/blob/52dc989a9b3f86ce040be9c9037ca34038367559/src/build_options.rs#L1012)。该差异不构成投毒或篡改证据。

## 制品身份与静态覆盖

复用总管已保存的两份 sdist，没有重新下载。原始位置与所有成员 hash 记录于 [archive-analysis.json](archive-analysis.json)。2026-09-08T21:14:18.480319Z—21:14:19.061932Z 另读取两版 PyPI JSON，sdist 大小及 SHA-256 与实际文件相符；完整分发 URL、上传时间与响应 hash 见 [public-source-check.json](public-source-check.json)。hash 一致用于识别所读字节。

|版本|sdist SHA-256|PyPI 上传时间 UTC|归档常规文件 / Rust 子树文件|
|---|---|---|---|
|[1.99.0](https://pypi.org/pypi/litellm/1.99.0/json)|`594bf4b6ff6b79c6aa3c3b78c0e939d4afd12687e076ba3fb608d38a5aa7f9c6`|2026-09-01T00:43:07.434969Z|3507 / 150|
|[1.100.0](https://pypi.org/pypi/litellm/1.100.0/json)|`ece94e817a453a5b3a9517c03547c428d501cea719edb728c1b260e53f78ea35`|2026-09-06T00:22:46.023754Z|3555 / 153|

两份归档无特殊成员/链接、无重复路径。逐成员检索未出现 `.cargo/config`、`.cargo/config.toml`、`setup.py`、`setup.cfg`、`MANIFEST.in` 或 `Makefile`。每版有 4 个 Cargo.toml、1 个 Cargo.lock、1 个 build.rs、1 个 pyproject.toml。此处的“无”仅指归档成员，不覆盖构建主机用户级 Cargo 配置、环境或发布系统。

Rust 子树变化恰为 7 个文件：workspace Cargo.toml、Cargo.lock、bridge Cargo.toml、bridge src/lib.rs，以及新增 src/marshal.rs、benches/serialization.rs、tests/marshal_boundary.rs。其余 Rust 子树文件相同，包括 core 与 ai-gateway 的 manifests。所有实际差异保存于 [diffs](diffs/)。新的 marshal 用 pythonize 完成 Rust/Python 序列化转换，新增 bench/test 为相应验证代码；这些源码不会因读取 sdist 而运行。完整 native 运行入口的判定由其他专项负责。

## 入口及激活条件

### PEP 517 与包自身脚本

`tool.maturin.manifest-path` 指向 `litellm-rust/crates/python-bridge/Cargo.toml`，模块名为 `litellm.rust_bridge._native`，bindings 为 pyo3。`include` 将既有前端静态产物纳入包，未声明执行前端构建命令。三个 `[project.scripts]` 入口保持不变，属于安装后的命令入口。源码构建才触发后端及 Cargo；使用已有 wheel 的安装不需要执行该 sdist 的构建脚本。[配置原文](sources/1.100.0/pyproject.toml.txt)。

包自身 `build.rs` 只有 6 行：判断 `CARGO_CFG_TARGET_OS == macos` 后输出 `cargo:rustc-cdylib-link-arg=-undefined` 和 `dynamic_lookup`。无自定义网络请求、进程启动或文件读取入口；其他平台不输出该链接参数。它无第三方 build-dependencies。Cargo 将编译并运行 build.rs 是标准构建机制，脚本的任意代码能力本身不说明恶意。[脚本原文](sources/1.100.0/litellm-rust/crates/python-bridge/build.rs.txt)、[Cargo 官方构建脚本文档](https://doc.rust-lang.org/cargo/reference/build-scripts.html)。

### 后端和既有 PyO3 构建过程

为界定标准进程/网络入口，读取 maturin v1.9.4 的 4 个官方源码文件，并确认固定 commit `52dc989a9b3f86ce040be9c9037ca34038367559` 的相应字节一致。[URL、UTC、每文件 hash](backend-sources.json)。这确认了所读源码身份，未验证用户或发布主机实际安装的后端二进制与源码等价。

- PEP 517 `build_wheel` 调用 `maturin pep517 build-wheel -i <interpreter>`；Rust 后端再启动 Cargo rustc。`config_settings` / `MATURIN_PEP517_ARGS` 可以提供构建参数，Cargo 配置和 Rust 编译环境也会影响结果。[固定后端入口](https://github.com/PyO3/maturin/blob/52dc989a9b3f86ce040be9c9037ca34038367559/maturin/__init__.py#L35)、[固定 cargo 构建调用](https://github.com/PyO3/maturin/blob/52dc989a9b3f86ce040be9c9037ca34038367559/src/compile.rs#L494)。这里使用参数数组，不能把 shlex 的参数拆分直接称为 shell 执行。
- 当找不到 cargo 且未设置 `MATURIN_NO_INSTALL_RUST`，该固定后端的 `get_requires_for_build_wheel` 会追加 `puccinialin`，`_get_env` 调用其 `setup_rust()` 准备 Rust。此条件入口存在于两版共同后端；puccinialin 的实际解析版本、工具链下载实现和发布主机是否进入该分支均未核实。它不属于 1.100 新增 hook，且说明 `[build-system]` 一行依赖不必等于所有条件构建依赖。[固定后端第 68—75、159—168 行](https://github.com/PyO3/maturin/blob/52dc989a9b3f86ce040be9c9037ca34038367559/maturin/__init__.py#L68)。
- `pyo3 0.29.0` 与 `pyo3-ffi 0.29.0` 自身有既有 build.rs。后者经 `resolve_build_config` 选择显式配置文件、交叉编译配置或宿主解释器；宿主路径会执行固定探测脚本，获取 sysconfig 等信息。`pyo3-build-config` 本身 manifest 为 `build=false`，其库函数由其他 crate 的构建脚本调用；不能把它误报成独立 build.rs。[ffi build.rs](crates/pyo3-ffi-0.29.0/build.rs.txt)、[配置分支](crates/pyo3-build-config-0.29.0/src/lib.rs.txt)、[解释器进程实现](crates/pyo3-build-config-0.29.0/src/impl_.rs.txt)。
- Python 探测 `Command::new(interpreter)` 没有加 `-I/-S`；构建环境与解释器启动配置因而属于既有信任边界。这里没有执行探测，也没有读取本机凭据或启动文件。配置变量可影响构建不等于已经存在恶意配置。

### 新增第三方 build.rs

以下 9 项均由新增 criterion 开发依赖树引入。普通依赖构建不使用根包的 dev-dependencies；开发者主动编译 bench/test 等目标时才应再按 target/feature 判定。锁文件包含跨平台/可选边，不能推出这 9 个脚本会在每次构建中全数执行。[Cargo dev-dependencies 语义](https://doc.rust-lang.org/cargo/reference/specifying-dependencies.html#development-dependencies)、[bridge 声明](sources/1.100.0/litellm-rust/crates/python-bridge/Cargo.toml.txt)、[criterion 声明](crates/criterion-0.8.2/Cargo.toml.txt)。

|crate|所读代码行为|激活与边界|
|---|---|---|
|[alloca 0.4.0](crates/alloca-0.4.0/build.rs.txt)|通过 `cc::Build` 编译随包 `alloca.c`，输出 calloca 静态库；可加编译选项|criterion 的 `cfg(any(windows, unix))` 依赖；编译器/归档器由既有 cc 1.3.0 调用，CC 等构建配置可选定工具|
|[crossbeam-deque 0.8.7](crates/crossbeam-deque-0.8.7/build.rs.txt)、[crossbeam-epoch 0.9.20](crates/crossbeam-epoch-0.9.20/build.rs.txt)|读取 sanitizer 配置，输出 Cargo cfg|经 criterion 的 rayon 分支|
|[crossbeam-utils 0.8.22](crates/crossbeam-utils-0.8.22/build.rs.txt)|读取 TARGET/sanitizer，以随包固定 target 表输出 cfg|引用 `no_atomic.rs` 与 `build-common.rs`；两文件已读，后者只规范化 Linux target 字符串|
|[crunchy 0.2.4](crates/crunchy-0.2.4/build.rs.txt)|将预定义展开模板与生成的分支写到 OUT_DIR/lib.rs，并输出路径后缀|经 ciborium/half 相关目标分支；生成的 Rust 宏不在此审计中执行|
|[rayon-core 1.13.0](crates/rayon-core-1.13.0/build.rs.txt)|只输出 rerun-if-changed|随 rayon 开发依赖分支；脚本为 links 唯一性声明配套|
|[winapi 0.3.9](crates/winapi-0.3.9/build.rs.txt)|使用内嵌映射计算 feature 闭包和系统库链接参数|只有 TARGET 的系统字段为 windows 时进入映射逻辑|
|[winapi-i686 0.4.0](crates/winapi-i686-pc-windows-gnu-0.4.0/build.rs.txt)、[winapi-x86_64 0.4.0](crates/winapi-x86_64-pc-windows-gnu-0.4.0/build.rs.txt)|输出随包 lib 目录的链接搜索路径|仅对应 Windows GNU target，且未设置 WINAPI_NO_BUNDLED_LIBRARIES|

alloca 的具体进程路径为 `build.rs → cc::Build::compile/try_compile → compiler.to_command → command_helpers::spawn`；源文件为 [alloca.c](crates/alloca-0.4.0/alloca.c.txt)、[cc lib](crates/cc-1.3.0/src/lib.rs.txt)、[工具选择](crates/cc-1.3.0/src/tool.rs.txt)、[进程启动](crates/cc-1.3.0/src/command_helpers.rs.txt)。这是标准 C 编译行为。上述新增脚本及其引用文件没有呈现网络下载调用或固定 shell payload；Cargo 拉取 registry 包是独立工具链过程。没有把字符串无命中或 checksum 一致升级为安全结论，也未审计未变更依赖的全部代码。

## ABI3 配置缺口与可判别的后续证据

1.99 bridge 直接声明 `features=[extension-module, abi3-py310]`；1.100 通过默认 feature 保留 extension-module，所有包内 manifests 均未设置 abi3-py310。pythonize manifest 的 pyo3 依赖还明确关闭 default-features，未补入 ABI3。固定 maturin 的 `has_abi3` 从 Cargo resolve 的 feature 集识别 abi3/abi3-pyXY，不能仅凭 Python `requires-python` 或模块名推导 ABI3。[workspace diff](diffs/litellm-rust/Cargo.toml.diff)、[bridge diff](diffs/litellm-rust/crates/python-bridge/Cargo.toml.diff)、[pythonize manifest](crates/pythonize-0.29.0/Cargo.toml.txt)、[maturin 判定源码](backend/src/build_options.rs.txt)。

因此，按归档默认字段推断，1.100 不再声明旧版的 ABI3 最低版本 feature；这只是静态配置推断，未实际构建。发布流程可以用 `--features pyo3/abi3-py310` 等额外配置恢复它。要闭合公开 cp310-abi3 wheel 的来源，需要原始 PyPI 发布 run 的完整构建参数、有效 feature 图/编译日志，以及制品对应关系。总管已说明已取回镜像 attestation 不覆盖原始 PyPI wheel 构建，私有 project-releaser workflow 未取得；本报告不以镜像证明补足这个缺口，也不重复请求私有 workflow。

同理，两版 tool.maturin 没有显式 locked/frozen 字段；锁文件精确版本可供构建使用，但它不证明发布调用未接受外部参数、配置或更新。标准工具链调用和可配置性不足以支持“投毒”的定性。当前证据支持缩小新增构建入口范围，保留实际构建环境、旧依赖全树、后端实际制品和发布参数的未审计边界。

## 复核材料与工具限制

- [collect.py](collect.py)：使用 tarfile 逐成员读取、TOML 静态解析与精确 diff；没有 tar.extractall 或目标导入。
- [read_crates.py](read_crates.py)：从 static.crates.io 定点读取 41 个归档，核验 Cargo checksum 后仅保存数据；共 11,260,373 字节，请求开始时间为 2026-09-08T21:11:33.145030Z—21:11:36.863019Z。这里保存的是各请求开始时间，不声称所有响应在该区间内完成。
- [complete_sources.py](complete_sources.py)：补齐本地归档引用成员和计算锁图归属；[verify_sources.py](verify_sources.py) 核对固定后端源码、当前 PyPI 元数据。
- 默认 python3 首次因缺少 tomllib 在 import 阶段停止，未运行分析主体；改用已安装 `/opt/homebrew/bin/python3.14 -I -S`。曾按其他专项 manifest 尝试读取其未保存的 pyo3 构建文件，得到文件不存在；随后从正式源读取本专项所需的定点归档，未以缺文件推断没有构建脚本。
- 第三方源文件以 `.txt` 保存供审阅。`.inputs/` 仅存 crate 原始归档并被 gitignore 排除；不属于公开清单。没有 stage、commit、push 或修改其他专项目录。

公开材料以 [publication-manifest.json](publication-manifest.json) 白名单为准；交付 hash 与静态检查结果见 [delivery.json](delivery.json)。白名单自身及 delivery 为避免递归 hash 单独记录。
