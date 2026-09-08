# LiteLLM 1.101.0rc1 源码构建对照

本报告比较发布的 **1.100.0 与 1.101.0rc1 sdist**。总管在 2026-09-08T21:27:14Z 记录正式版 `1.101.0` 的 PyPI/GitHub release 查询为 404；本报告使用该时点可取得的候选版，不将候选结论写成正式版结论。[查询快照](availability-input.json)、[候选发布页](https://github.com/BerriAI/litellm/releases/tag/v1.101.0-rc.1)。

所有归档和源码均作为数据读取。未安装、导入、编译或执行目标，未运行 Cargo metadata/tree/build、PEP 517 hooks、crate 宏、测试或构建后端。没有下载 wheel、修改旧报告/根文件、提交或发布。

## 结论与身份

候选改变了构建后端、PyO3 和 Rust workspace；LiteLLM 自身唯一 build.rs 保持不变。新增普通依赖构建脚本用于 MIME 映射代码生成，新增测试宏有编译器探测与 Cargo manifest 读取/进程入口。maturin 新增 PGO 命令执行能力，但本候选缺少激活所需的 pgo-command。以下结论不能证明完整运行行为或制品安全。

|对象|实际读取与核验|
|---|---|
|1.100.0 sdist|复用既有制品；SHA-256 `ece94e817a453a5b3a9517c03547c428d501cea719edb728c1b260e53f78ea35`，17,287,857 字节|
|[1.101.0rc1 sdist](https://files.pythonhosted.org/packages/3c/a5/082f14658811b6541c1052797f723696af4f33cc615418151cc90978fd02/litellm-1.101.0rc1.tar.gz)|17,956,868 字节；SHA-256 `acb7a84fdc8f19fc79e73df29b5fec4e8a3de9a4e74f41cbc14bd2ef1e7e8aae`，匹配 PyPI 制品记录；核验 UTC 2026-09-08T21:41:51.541431Z|
|固定候选 tag|`v1.101.0-rc.1` → `eeb7732fc11fd47762ca84cc3fb7cc74235d7097`；tree `502d9ab4cdfaade8c91f78ef81096724c6c68000`；复用制品专项的 [tag 响应](tag-input.json)|
|[maturin 1.15.0 sdist](https://files.pythonhosted.org/packages/b9/c8/22e5e21b2679c9bce6415ca578034ca2cc9316be0642ae21e051a2d5198c/maturin-1.15.0.tar.gz)|SHA-256 `94b26cc8e8aba61a5f2099715fe640e18c5f678e9a500408b38761263954228a`，匹配该版本 PyPI JSON；用于读取后端源码，不执行|

制品、成员路径/大小/hash、完整构建/Rust 差异见 [sdist-analysis.json](sdist-analysis.json)。两版常规成员分别 3555/3637，Rust 子树 153/177；未出现特殊成员或重复路径。候选包含 6 个 Cargo.toml、1 个 Cargo.lock、1 个 build.rs、1 个 pyproject.toml；归档成员检索无 `.cargo/config*`、setup.py、setup.cfg、MANIFEST.in、Makefile。主机构建环境未检查。

## 构建字段的准确变化

[pyproject diff](diffs/pyproject.toml.diff)、[workspace diff](diffs/litellm-rust/Cargo.toml.diff)、[bridge diff](diffs/litellm-rust/crates/python-bridge/Cargo.toml.diff) 是以下变化的直接依据。

- PEP 517 后端仍为 `maturin`，要求从 `maturin==1.9.4` 改为 `maturin==1.15.0`，LiteLLM pyproject 没有 backend-path。tool.maturin 新增 `features=[extension-module]`、`profile=release`、`editable-profile=dev`，以及 complexity_router 的 JSON 产物 include；没有新增任意命令字段。
- bridge 默认 feature 改为 `abi3`，其定义是 `pyo3/abi3-py310`。extension-module 保留为单独 feature，由 tool.maturin 显式启用；另增加 `panic-test`、`trace-parity` 可选诊断特性。候选默认字段已明确提供 Python 3.10 ABI3 最低版本，仍不能证明实际 wheel 构建采用了哪些外部参数。
- workspace 显式列出 core/config/ai-gateway/python-interop/python-bridge。新增两个本地 crate 为 `litellm-config` 与 `litellm-python-interop`，没有新增本地 build.rs 或 proc-macro crate。前者把 Python 配置装载放在可选 `python` feature；后者承接 Pythonize 转换和 GIL 操作。
- PyO3 版本约束 0.29.0→0.29.2；reqwest 加 multipart feature；serde_json 加 float_roundtrip；增加 tracing、tracing-subscriber、rstest 的 workspace 声明。release profile 明确 opt-level=3、thin LTO、codegen-units=1、panic=unwind、无 debug/incremental、strip=symbols。这些均为编译配置，单独不能说明恶意。
- 两版 [build.rs](sources/1.101.0rc1/litellm-rust/crates/python-bridge/build.rs.txt) 逐字相同，只有在目标 macOS 时输出 `-undefined` / `dynamic_lookup` 链接参数。该包自身脚本没有网络请求或进程调用。
- Python 基础 14 依赖声明、requires-python 与 console scripts 均不变。proxy/extra_proxy/mongodb 等 extras 及 dev group 有变更；它们不属于 LiteLLM 的 PEP 517 build-system requirements，准确内容保留在 pyproject diff，未扩展成完整 Python 安装求解。

## Cargo 锁文件与新增执行面

锁文件从 295 项变为 313 项。按 `(name, version, source)` 计，新增 23 项、删除 5 项：2 个新增本地 crate；5 个 PyO3 系列 0.29.2 条目替换 0.29.0；另外 16 个新增 registry 名称。3 个既有本地 crate 的依赖列表变化；reqwest 0.12.28 的版本/checksum 不变，依赖列表加入 mime_guess。其余既有条目未变。[完整锁文件 diff](diffs/litellm-rust/Cargo.lock.diff)、[结构化精确比较](sdist-analysis.json)。

读取了候选 21 个新增/升级 registry 条目、5 个 PyO3 旧版本基线，以及新增 rstest build.rs 直接调用的既有 rustc_version 0.4.1，共 27 个 crate 归档；逐个 SHA-256 与相应锁文件 checksum 一致。[26 个记录](crate-analysis.json)、[rustc_version 记录](rustc-version-source.json)。hash 证明所读字节与锁文件对应，无法证明代码行为安全。未重复下载整个旧依赖树。

|入口|来源与激活条件|所读执行行为|
|---|---|---|
|mime_guess 2.0.5 build.rs|reqwest multipart 新增的普通依赖路径|读取随包 `src/mime_types.rs` 常量表，使用 unicase，在 OUT_DIR 生成 MIME 映射 Rust 源码；默认 rev-mappings。脚本无进程/网络调用。[源码](crates/mime_guess-2.0.5/build.rs.txt)|
|rstest_macros 0.26.1 build.rs|core、python-interop 的 rstest **开发依赖**|rustc_version 的 version/version_meta 启动 `RUSTC_WRAPPER`/`RUSTC` 指定的编译器，加 `-vV`，按 nightly/dev 输出 cfg。该程序路径由构建环境指定。[脚本](crates/rstest_macros-0.26.1/build.rs.txt)、[实际进程实现](crates/rustc_version-0.4.1/src/lib.rs.txt)|
|rstest_macros 过程宏|只有相关测试宏被编译/展开时；crate-name 为默认 feature|proc-macro-crate 读取调用方/工作区 Cargo.toml，并经 `CARGO locate-project --workspace --message-format=plain --manifest-path=...` 找工作区。文件参数功能还支持 glob 和环境变量解析。[宏路径](crates/rstest_macros-0.26.1/src/render/crate_resolver.rs.txt)、[Cargo 进程与文件读取](crates/proc-macro-crate-3.5.0/src/lib.rs.txt)、[files 参数实现](crates/rstest_macros-0.26.1/src/parse/rstest/files.rs.txt)|
|PyO3 0.29.2 构建/过程宏|普通 Rust bridge 构建中的升级依赖|pyo3 build.rs 逐字不变；pyo3-ffi build.rs 改变 Windows raw-dylib 选择、库名别名及链接输出；pyo3-build-config 改变 stable ABI/跨编译/平台处理。后者 manifest 为 build=false，其函数供其他脚本调用。[ffi diff](diffs/crates/pyo3-ffi/build.rs.diff)、[build-config diff](diffs/crates/pyo3-build-config/src/impl_.rs.diff)|

16 个新 registry 名称按 manifest 引入原因归属：mime_guess/unicase 为 multipart 路径；tracing-subscriber/lazy_static/sharded-slab/thread_local 为可选 observability 或 dev 路径；rstest、rstest_macros、futures-timer、glob、relative-path、proc-macro-crate、toml_datetime、toml_edit、toml_parser、winnow 为测试相关路径。此归属是静态声明与锁图读数，未运行 Cargo feature/target 求解，不表示每个平台都编译所有条目。

PyO3 五个 crate 的 Rust/TOML 差异共 65 个文件，均有 [diff 索引](pyo3-diff-index.json)。构建配置层重点检查了 ffi build.rs、build-config lib/impl 和宏后端差异；旧的解释器探测、编译器探测能力仍存在。pyo3-macros 入口 Rust 源码逐字不变，pyo3-macros-backend 有代码生成变化。没有穷尽升级后 PyO3 的全部运行时语义或编译器生成的机器码。

## maturin 升级的边界

对照 1.9.4 与 1.15.0 的 PEP 517 Python wrapper、构建选项/编译实现及后端 bootstrap；为追新增行为补读新版 builder/orchestrator/PGO。1.15.0 的原始 sdist hash 与 PyPI 一致；[来源与每文件 hash](backend-analysis.json)、[补充原始成员及旧版 sdist 来源](backend-extra-sources.json)。这是官方源码字节对照，不能替代发布主机实际后端二进制的来源证明。

PEP 517 wrapper 的可见变化包括：尊重已显式传入的解释器参数；通过 MATURIN_PEP517_METADATA_DIR 传递已准备元数据目录；修正 Windows cargo PATH 查找；cffi 条件排除 PyPy（LiteLLM 使用 pyo3）。执行 maturin/Cargo 的参数数组路径仍存在。找不到 cargo 且未禁用时调用 puccinialin.setup_rust 的条件路径两版都有。[wrapper 完整 diff](diffs/backend/maturin/__init__.py.diff)。

**新增 PGO 路径包含真实 shell 执行能力，但候选配置不启用该路径。** `--pgo` 或 MATURIN_PGO 提供开关；[builder 第252行](backend/1.15.0/src/build_context/builder.rs.txt) 要求 tool.maturin.pgo-command 存在且非空，否则直接报错。满足条件后，后端创建临时 venv、安装 instrumented wheel 与 requires-dist 依赖（pip 分支还尝试 dev group），再运行 `sh -c <pgo-command>` 或 `cmd /C <pgo-command>`，最后合并 profile。[PGO 实现](backend/1.15.0/src/pgo.rs.txt)、[PEP 517 开关](backend/1.15.0/src/commands/pep517.rs.txt)、[orchestrator](backend/1.15.0/src/build_orchestrator.rs.txt)。两版 LiteLLM pyproject 及候选固定 Git 均没有 pgo-command；不能据此声称候选默认构建会运行用户命令或联网安装训练依赖。这是后端新增的条件能力，不是已观察到的恶意行为。

若安装 maturin 自身也选中 sdist，会进入独立 bootstrap 层：setuptools>=77、setuptools-rust>=1.11、旧 Python 的 tomli，以及无 cargo 时 puccinialin>=0.1,<0.2；setup.py 使用 RustBin，默认 no-default-features 并给 Cargo 加 --locked。这些 bootstrap 行为在两版的所读源码中相同，差异只涉及格式/注释及可选 zig 依赖上界。[bootstrap diff](diffs/backend/maturin/bootstrap.py.diff)、[setup diff](diffs/backend/setup.py.diff)、[backend pyproject diff](diffs/backend/pyproject.toml.diff)。未审计 setuptools-rust/puccinialin 的完整依赖或后端全部 Rust 依赖。

## wheel 自报生成器与 sdist 后端要求的差异

制品专项读取的候选 7 个 wheel 的 WHEEL 字段全部为 `Generator: maturin (1.9.4)`；本专项复用该已落盘数据，未下载 wheel。[制品专项元数据副本](wheel-metadata-input.json)。候选 sdist 与固定 Git 的 `[build-system]` 则均要求 maturin==1.15.0。

在已核验的 maturin 1.15.0 原始源码中，[src/module_writer/mod.rs:531—538](backend/1.15.0/src/module_writer/mod.rs.txt) 的 `wheel_file` 通过 `env!("CARGO_PKG_NAME")` 与 `env!("CARGO_PKG_VERSION")` 格式化 Generator；没有把 1.9.4 写为固定字符串。[定向源码位置/hash](wheel-generator-source.json)。该版本源包 Cargo.toml 的 package.version 为 1.15.0，因此按该原样版本编译并走此生成函数，预期写入1.15.0。这是源码推断，未运行后端。

该差异需要原始发布命令/实际后端制品来解释。直接调用环境中旧版 maturin CLI 构建可以绕开 PEP517 build-system 的自动依赖准备，是一种合理替代解释；也不能排除制品字段被改写等其他来源。WHEEL 的 Generator 是制品自报文本，既不能单独证明用了哪个二进制，也不能据此认定投毒。本专项仅记录这两个来源及字段生成位置；不以镜像构建声明补足 PyPI wheel 来源证明。

## 固定 Git 与原生 bridge 对照

读取固定 commit 的 28 个构建控制文件/bridge 与 interop Rust 文件，25 个逐字一致；3 个精确差异是：workspace members 数组换行变成单行、ai-gateway manifest 补 `readme=README.md`、pyproject 项目版本 `1.101.0` 变为 `1.101.0rc1`。没有把这些差异定性为投毒，也未证明每项转换具体由哪个发布步骤产生。[28项源码URL/UTC/hash](git-comparison.json)、[精确 Git→sdist diff](diffs/git-to-sdist/)。ABI3 feature 与选中的 bridge 源码均与固定 Git 一致。此处不声称整个 sdist 与 Git 完全相同。

Rust 子树加 pyproject 的路径比较记录为 79 修改、33 新增、9 删除；其中包括文档和文件拆分，不能直接解释成 121 个新增行为。bridge 把原本集中于 lib.rs 的 route、错误、序列化、执行逻辑拆到模块和 python-interop。本专项确认以下入口，并向 native 制品专项提供路径：

- [src/lib.rs:65](sources/1.101.0rc1/litellm-rust/crates/python-bridge/src/lib.rs.txt) 的 `_native` 使用 `#[pymodule(gil_used=false)]` / pymodule_init；init 依次注册错误、routes、ResponsesWebSocketConnection、diagnostics。这是扩展模块初始化时的注册路径；未执行目标或验证其完整运行行为。
- [src/execution.rs:46、89—102](sources/1.101.0rc1/litellm-rust/crates/python-bridge/src/execution.rs.txt)：同步调用释放 GIL，经 runtime.block_on(wait_for_sync_result) 等待，在 50ms timer 分支执行 `Python::attach(|py| py.check_signals())`。这为 native 专项观察的 PyErr_CheckSignals 新导入提供源码候选，不据此证明编译产物与源码完全对应。
- 新增 panic-test / trace-parity 的诊断路径有 feature 条件；本次未开启。测试中的本机 TCP listener、Python asyncio 执行均在 cfg(test) 代码范围，不能算作包安装动作。[diagnostics](sources/1.101.0rc1/litellm-rust/crates/python-bridge/src/diagnostics.rs.txt)、[feature 声明](sources/1.101.0rc1/litellm-rust/crates/python-bridge/Cargo.toml.txt)。

背景约束：总管/ABI 专项已说明 1.99 sdist 在固定 Git 基础上额外加入 ABI3 单行，1.100 相应文件与 Git 相同且无该 feature；本报告不修改旧报告，也不从该历史配置差异推出恶意。候选包内已恢复 ABI3，与历史发布命令的证据缺口分别记录。

## 覆盖限制与交付

公开材料包含精确 diffs、读取过的文本源码、manifest/锁文件、原始成员与来源 hash。`.inputs/` 中的 LiteLLM/maturin/crate 原始归档被 gitignore 排除；本目录不含 wheel、凭据或测试运行结果。

采集默认使用已安装 Python3.14 的 `-I -S` 静态分析。一次后端采集因旧路径 `src/build_context.rs` 在新归档中不存在而在断言处停止，后按实际目录拆分继续读取，并复用已核验归档；没有执行或回退安装目标。辅助 rg 曾因拼写错误的 glob 被 zsh 拒绝，随后改为具体已存在的文件路径读取。首次依赖读取脚本的旧缓存根目录计算多了一层，导致该批 5 个 PyO3 基线归档重新从官方源读取；字节核验通过，后已修正路径。

后续能区分来源与行为的证据仍是：原始 PyPI 发布命令/有效 features、rustc/后端制品身份与产物关联，以及隔离环境的实际构建/运行验证。本专项授权范围不执行这些工作。签名、hash、静态源码和配置一致均不单独构成安全证明。

可公开白名单与最终 hash 见 [publication-manifest.json](publication-manifest.json)、[delivery.json](delivery.json)；两者避免递归 hash 单独记录。总管统一决定提交与发布。
