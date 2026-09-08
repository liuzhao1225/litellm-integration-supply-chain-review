# LiteLLM 1.100 制品与发布链调查

此目录维护同一条发布链线索的当前证据。采集日期：2026-09-08 UTC。调查对象为 LiteLLM 1.100.0 全部 8 个 PyPI 制品，以及 1.99.0 manylinux x86_64 wheel 基线。源码比较固定到 `e4f25265704e2b2c6cf6e81be2e4c5cffff896f4`（1.100）和 `fa647f742d7baefe8eb1181899d9c81b41559772`（1.99）。

**当前结论：公开构建证明缺口覆盖 1.100 的全部八个制品；原生制品存在跨平台编译器版本分叉。九个 JS chunk 的主要功能变化已映射到固定提交源码，其余 13 个模块及额外编译变体仅通过绑定名称规范化就达到 AST 一致，实际导入顺序没有变化。当前静态证据没有给出可以确认恶意植入的异常调用链。** 两个大型 UI 模块的完整编译等价和原生构建来源仍未闭合；源码归因、字段一致及语法树结果均不构成整包安全认证。

这里只读取归档、解析 JS 语法树、使用系统已有 LLVM 查看文件头/导入符号；没有安装、导入或执行 LiteLLM，没有运行输入 JS 或容器，没有安装分析工具。已完成的[制品哈希与 RECORD 核验](../artifact-records/README.md)由总管提供，本调查沿用该证据，没有重复下载制品。

## 证据与剩余问题

| 分类 | 当前发现 | 适用条件与限制 | 下一项能区分解释的检查 |
| --- | --- | --- | --- |
| 事实 | 8/8 PyPI Integrity 查询返回 404、对应文件 `No provenance available` | 仅此次查询的八个具体文件；不证明历史上从未存在证明 | 获取发布方对应构建 run 的 attestation/SLSA 记录 |
| 事实 | Linux 扩展带 Rust 1.98.1 指纹，macOS/Windows 带 1.98.0 指纹 | 嵌入路径可伪造；尚无构建日志确认实际编译器 | 各平台 `rustc -Vv`、镜像 digest、编译参数与构建 run 对照 |
| 事实及推断 | Linux x86_64 增加 34 个 Python C API 导入；唯一新增可辨认 crate 路径为 pythonize 0.29.0 | 与声明的新依赖相符；不能覆盖静态链接代码或间接调用 | 使用匹配工具链在隔离环境复现，再定位差异函数 |
| 事实 | JS 模块 ID 集合一致；13 个差异模块及一个额外编译变体在纯绑定名称规范化后 AST 一致 | 未调整导入或语句顺序；13 个配对模块的完整 e.i 调用序列一致 | 将模块工厂排列变化与实际执行顺序区分，继续固定构建来源核验 |
| 事实 | MCP API 包装模块只新增一个导出及对应函数，移除后 AST 在规范化条件下相同 | 这项证明只适用于模块 602869 | 与上游网络客户端及新接口鉴权实现关联审核 |
| 事实/未知 | 三个变化模块的全部新增字符串及关键行为均映射到固定 TS 源码 | 3/3、49/49、27/27 是分模块字符串映射数量；两个大型 UI 模块全部逻辑仍未证明等价 | 对应 TSX 的构建输出与 sourcemap/固定构建对照 |

## 1. 全部八个制品的公开 Integrity 证据

使用[官方接口](https://docs.pypi.org/api/integrity/) `GET /integrity/litellm/1.100.0/<filename>/provenance`，请求开始时间范围为 **2026-09-08T20:10:49.193417+00:00 至 2026-09-08T20:10:49.895540+00:00**。八次响应均为 HTTP 404，JSON 明确写明对应文件没有 provenance。每份记录含请求时间、响应 Date、完整 URL、上传时间、制品 SHA-256：[汇总](integrity-all8.json)、[逐文件原始响应](integrity-responses/)。

下表文件名统一使用前缀 `litellm-1.100.0`；wheel 后缀包含 `cp310-abi3`。

| 文件后缀 | SHA-256 | 状态 |
| --- | --- | --- |
| `-cp310-abi3-macosx_10_12_x86_64.whl` | `098a413e398e2220734cf9c8dd75fb34a38b65b64090619c2869af1fdeaf4ae5` | 404 |
| `-cp310-abi3-macosx_11_0_arm64.whl` | `0f87fae695edbca27e5cf970bea52fa405fa9910fdf7c29c963d6413db767299` | 404 |
| `-cp310-abi3-manylinux_2_28_aarch64.whl` | `a07370d116905485e9ac99679bac991a0a6c81e13c99ca3f007128fbdf2b0082` | 404 |
| `-cp310-abi3-manylinux_2_28_x86_64.whl` | `8224c8eed9cab3319a88e6665d1275ad8faf21d353b1b22223a6d6115a302ea2` | 404 |
| `-cp310-abi3-musllinux_1_2_aarch64.whl` | `e3787fb7ad1f20aebdde7686a85061880bba6550c9d62bfa1cf8df089fe7899b` | 404 |
| `-cp310-abi3-musllinux_1_2_x86_64.whl` | `0b7ec93013e18535481cd811b776ee95c6b957b3a9fb44dc53f7c459e7e60e38` | 404 |
| `-cp310-abi3-win_amd64.whl` | `c6f2f56808d05d8d2a7766129d958101eafb1a47e30ba5ddcfa900cdbc50af67` | 404 |
| `.tar.gz` | `ece94e817a453a5b3a9517c03547c428d501cea719edb728c1b260e53f78ea35` | 404 |

该结果将原先仅两个 Linux wheel 的观察扩展到 1.100 当前全部公开文件。合理解释包括发布方未上传 attestation；Trusted Publishing、文件 hash 和镜像签名分别提供不同控制。没有 provenance 无法单独证明投毒。当前没有重复请求已知不可公开访问的发布仓库。

## 2. 原生扩展：编译器分叉与导入差异

静态采集时间 **2026-09-08T20:12:00.808190+00:00 至 2026-09-08T20:12:03.019535+00:00**，系统工具为 Apple LLVM 21.0.0 的 `objdump`/`nm`。读取 10 个 native 成员：1.100 七个平台的 `_native`、两个 musllinux 捆绑 libgcc，及 1.99 Linux x86_64 基线。每个成员的完整 SHA、所属制品 SHA、导入符号及 crate 路径见[native-fingerprints.json](native-fingerprints.json)，格式头见[native-headers/](native-headers/)，对照见[native-comparison.json](native-comparison.json)。

### 编译器来源指纹

| 制品 | 嵌入 Rust 源码提交 | 对应 Rust 源码版本 |
| --- | --- | --- |
| 1.99 manylinux x86_64 | `88d9e12ae178fab0fb5cc050a94da85685d449ea` | 1.98.0 |
| 1.100 macOS x86_64、arm64、Windows amd64 | `88d9e12ae178fab0fb5cc050a94da85685d449ea` | 1.98.0 |
| 1.100 manylinux 与 musllinux，x86_64、aarch64 | `48a229ceaefd4985c50990b14116b6d856af0985` | 1.98.1 |

这些 SHA 来自二进制中的 `/rustc/<sha>/` 路径，已与 Rust 官方固定提交的 `src/version` 对照：[1.98.0 提交](https://github.com/rust-lang/rust/commit/88d9e12ae178fab0fb5cc050a94da85685d449ea)、[1.98.1 提交](https://github.com/rust-lang/rust/commit/48a229ceaefd4985c50990b14116b6d856af0985)。对应 commit UTC 为 `2026-08-18T19:58:58Z`、`2026-09-01T06:56:03Z`；采集记录见[rust-compiler-revisions.json](rust-compiler-revisions.json)。

推断：平台构建环境或工具链升级不同步可以解释这一分叉。不能仅凭字符串确定实际编译器，更不能据此认定植入。该差异说明全平台重建时必须先固定各自工具链；把两版本二进制直接比较会混入编译器升级造成的变化。

### 同平台导入与加载路径

1.99→1.100 manylinux x86_64 的系统库 `NEEDED` 列表完全相同：libgcc、pthread、libm、libdl、libc、ELF loader；都没有 RPATH/RUNPATH。未定义符号数从 204 增至 238，新增 34 个全部是 Python C API，例如 `PyDict_Keys`、`PyObject_GetIter`、`PyLong_AsLong`；没有删除符号。可辨认的新增 crate 路径只有 `pythonize-0.29.0`，与已知 Cargo 依赖变更相符。这是有限静态匹配，不覆盖机器码全部行为。

Linux x86_64 `_native.abi3.so` 成员 SHA：

- 1.99：`2345a380bce52f040ff2ea0a7b1988e8f682a40e63bcb3b8ac822c53149e09a6`
- 1.100：`c6992e805578007dc61f872127fb164490751adc6556c6b37e58f550a0f23951`

musllinux 扩展通过 `$ORIGIN/../../litellm.libs` 引用随 wheel 打包的 libgcc，捆绑库带 `GCC: (Alpine 14.2.0) 14.2.0` 字符串。macOS 仅记录 Security/CoreFoundation 系统框架、libiconv 与 libSystem 链接；Windows 的静态 DLL 列表由 Python、Windows 系统 API 和 VC runtime 构成。网络、文件、动态加载 API 的存在符合网关库能力，也足以说明“没有新增危险导入”不能排除凭证读取或外传逻辑。

七个 ELF 成员（含基线和 libgcc）都具有非执行栈 `rw-`，未见 `rwx` LOAD 段，存在 RELRO 段。Windows PE 标志包含 HIGH_ENTROPY_VA、DYNAMIC_BASE、NX_COMPAT。这些仅是文件头标志，无法证明运行时防护完整或内容可信。

Windows 的 COFF 时间戳解析为 **2026-09-06T00:16:35Z**，早于该 wheel 上传时间 `2026-09-06T00:22:42.783558Z`。[记录](windows-coff-timestamp.json)明确将其视为可伪造的链接器字段，未将其当作可信构建时间。

**是否已有定向反汇编锚点：**当前没有新增系统导入、异常加载目录或可执行栈变化足以指向特定恶意路径。更有效的下一步是先取得平台构建参数并复现；若仍有无法解释的机器码差异，再定位初始化段、Python 模块入口和对应差异函数。当前没有做全量反汇编或可复现构建。

### 原生来源链还缺哪些发布者证明

来源链需要把**具体制品 → 可验证的构建运行 → 精确源码及构建输入**连接起来。[PyPI 发布证明](https://docs.pypi.org/attestations/publish/v1/)与[SLSA 构建证明](https://slsa.dev/spec/v1.2/build-provenance)承担不同用途。当前镜像签名、wheel hash、源码相同和 rustc 路径字符串没有完成这一关联。

| 发布者需要提供的材料 | 对本次制品应核对的内容 | 当前缺口 |
| --- | --- | --- |
| 每制品签名证明及发布身份 | subject 为上述八个文件名/SHA-256；可信发布者身份、workflow、签名/证书和透明日志证明可验证 | 八个公开 Integrity URL 均无证明 |
| 构建运行与源码关联 | buildType、builder.id、invocationId、准确源码 commit/tree 与工作目录修改状态，绑定到最终输出 digest | 无可公开验证的运行记录；PyPI 早于 Docker 修复和最终标签，不能用同一版本字符串代替实际 checkout |
| 平台工具链与依赖输入 | Linux/Mac/Win 分别的 rustc -Vv、cargo、target triple、maturin、C 编译器/linker、SDK或容器 digest、Cargo.lock/registry checksum、环境参数 | 指纹显示 1.98.0/1.98.1 分叉，缺平台构建记录解释；记录还需覆盖静态链接依赖 |
| 构建后加工与打包步骤 | auditwheel/delocate、捆绑 libgcc 来源及 hash、strip/签名操作、native 成员 hash 到最终 wheel hash 的关联 | 当前仅有最终成员及包的 hash，无完整加工链 |
| 可复核重建或明确差异清单 | 在对应固定输入的隔离环境独立重建，对 native 成员逐字节比对，解释时间戳、路径、签名等非确定性项 | 尚未重建；需先取得足够构建输入，避免混入工具链差异 |

表中是调查需要的具体证据，部分属于复现辅助信息，不把所有字段都宣称为 SLSA 的强制要求。签名构建证明仍依赖对构建平台的信任；独立复现能提供额外核对，二者都不能替代源码安全审查。当前没有为取得这些材料绕过私有仓库访问限制，也没有运行被调查构建。

## 3. 九个 JS chunk 的模块级归因

前提沿用已完成的七平台比较：各 wheel 的 179 个 JS 在统一 CRLF 后完全一致，因此选一个 wheel 作为语法比较输入。与 Git 标签同路径匹配的 167 个 JS 和仅构建目录变化的三个 manifest 不重复处理。

使用本机已有 Acorn 8.15.0 把九个差异 chunk 解析成语法树，只读取数据，未运行 JS。按 Turbopack 数字模块 ID 分组，同时保留同 ID 在不同 chunk 内的多个编译变体：[模块清单](js-module-inventory.json)、[比较结果](js-module-comparison.json)。Git 有 383 个 ID 组、396 个 AST 变体；wheel 有同样 383 个 ID 组、397 个变体。没有新增或删除模块 ID。

其中 366 个 ID 组的变体集合完全相同。另有 16 个 ID 组各有一个配对差异，模块 768371 在 wheel 多出一个编译变体。部分 ID 组同时含一致与不同的变体，因此不能将“380 个相同 AST 变体”当成“380 个模块全部一致”。

### 编译层面差异

对 16 个配对差异中的 13 个模块只做词法作用域绑定名称规范化和对象 shorthand 元信息去除，**不排序导入、不重排语句**，AST 仍相同；额外变体 768371 也与其余既有变体相同。模块 ID：450240、738014、868499、655063、438847、822315、133356、162386、902555、276173/907308、294612、153472、895751，以及变体组 768371。[纯绑定规范化记录](js-alpha-only-comparison.json)，UTC `2026-09-08T20:29:57.917Z`。

13 个配对模块的全部 `e.i(数字ID)` 调用序列完全一致；[导入顺序检查](import-order-effects.json)找到 **0 处**实际纯导入声明调序，因此没有可据此开展副作用对比的“被调序导入模块”。chunk 内模块工厂的排列变化不能直接当作导入执行顺序变化。该结果只适用于上述模块，不外推所有 runtime；结构归一也不替代独立编译器验证或整个程序等价证明。

### 新增 MCP API 包装函数已经隔离

模块 602869 的导出集合仅多出 `importMCPServers`，没有删除导出。对应新增 arrow function 调用既有客户端的 `post('/v1/mcp/server/import', {accessToken, body})`，失败时记录错误并重新抛出。移除这个导出和函数绑定后，其余模块的规范化 AST 完全相同：SHA-256 均为 `a7f0a055da556ff99e4c5786f6234798cd8a6e495a027c797c2d8508181f7bb3`。[隔离证据](mcp-wrapper-isolation.json)，UTC `2026-09-08T20:20:27.050Z`。

该变化与[官方 MCP 批量导入 PR #38444](https://github.com/BerriAI/litellm/pull/38444)对应。它没有新增独立外部 URL；相对 URL 仍交由现有客户端决定服务器和请求头。

### 三个模块已映射到固定 TypeScript 源码

[ts-source-inventory.json](ts-source-inventory.json)记录 23 份固定提交源码的 Git blob、SHA-256、来源 URL 和采集 UTC。[ts-literal-mapping.json](ts-literal-mapping.json)逐一映射三个模块的全部新增解码字符串：602869 为 3/3、664307 为 49/49、366321 为 27/27，无未映射值。JSX 换行和 `&apos;`/`&quot;` 的文本规范化另行标注，未将字符串相同当作行为等价。

| 模块 | 固定源码与关键位置 | 静态确认的触发条件 |
| --- | --- | --- |
| 602869 | [networking.tsx:4994](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/ui/litellm-dashboard/src/components/networking.tsx#L4994) | 定义 importMCPServers 函数；被调用时向既有 apiClient 提交相对 URL、显式 token 和 payload |
| 366321 | [importConnectorConfig.ts:27](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/ui/litellm-dashboard/src/app/%28dashboard%29/mcp-servers/_components/importConnectorConfig.ts#L27)、[ImportMCPServers.tsx:39](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/ui/litellm-dashboard/src/app/%28dashboard%29/mcp-servers/_components/ImportMCPServers.tsx#L39)、[mcp_servers.tsx:485](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/ui/litellm-dashboard/src/app/%28dashboard%29/mcp-servers/_components/mcp_servers.tsx#L485) | 管理员可见按钮打开对话框；用户点击 Import 后 JSON.parse 并校验对象/数组，再发请求。此解析器没有 eval 或扫描本机配置文件的操作 |
| 664307 | [useModelAccessGroups.ts:11](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/ui/litellm-dashboard/src/app/%28dashboard%29/hooks/modelAccessGroups/useModelAccessGroups.ts#L11)、[AccessGroupBudgetsPanel.tsx:37](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/ui/litellm-dashboard/src/app/%28dashboard%29/models-and-endpoints/panels/AccessGroupBudgetsPanel.tsx#L37) | 预算页 GET 查询由有 token 且为管理员的 query 启用；PUT/DELETE 在提交或清理预算的 mutation 回调执行 |

[11 处行为映射](ts-behavior-mapping.json)保留精确文件、行、blob 和代码摘录。新增预算相关源码的模块顶层有 query-key 构造及 Zod schema 构造，网络调用位于 query/mutation 函数内部；MCP 导入组件顶层定义 placeholder/组件/解析函数，实际请求在点击回调内。这些是新增源码的直接调用位置检查，未证明所有依赖初始化无副作用，也未动态运行 UI。

模块 664307 唯一消失的字符串 `, ]` 已定位到 Git 内旧预编译输出的“Connection Test Results”对话框页脚。固定源码 [AddModelForm.tsx:478](https://github.com/BerriAI/litellm/blob/e4f25265704e2b2c6cf6e81be2e4c5cffff896f4/ui/litellm-dashboard/src/components/add_model/AddModelForm.tsx#L478)仅保留 Close 按钮，没有这段多余文本，blob `ad0f749b1894e29fea2d840629068a027f540bc6`。[删除文本定位](removed-footer-text.json)。这解释了一处超出预算功能的显示差异，未将其当作网络或执行逻辑。

功能来源分别对应[官方 #38444](https://github.com/BerriAI/litellm/pull/38444)、[官方 #38843](https://github.com/BerriAI/litellm/pull/38843)，均列在 [1.100 发布说明](https://github.com/BerriAI/litellm/releases/tag/v1.100.0)。证据支持发布时重新构建前端、Git 内部分预编译内容较旧的解释。**当前未闭合点是两个大型 UI 模块的完整编译等价/重现性，以及原生制品的可验证构建来源。** 没有发现无源码对应的新字符串或独立外传 URL，不等于已排除动态拼接、隐藏调用或上游源码本身的恶意逻辑。

## 4. 工具边界、可复核材料与协调

主要脚本：

- [check_integrity.py](check_integrity.py)：仅查询上述八个 Integrity URL；404 作为显式数据记录，其他 HTTP 错误直接失败。
- [native_fingerprints.py](native_fingerprints.py)：静态提取成员到本目录临时输入目录，调用系统 LLVM，读取完成后删除自身提取的文件。
- [compare_js_modules.cjs](compare_js_modules.cjs)：用 Acorn 解析已有 JS，保留重复模块变体；[normalize_js_bindings.cjs](normalize_js_bindings.cjs)记录限定规范化；[isolate_mcp_wrapper.cjs](isolate_mcp_wrapper.cjs)仅从 AST 去除已定位新增函数验证余部。

JS 脚本输入为之前核验并保存的 `/tmp/litellm-version-research-20260909/frontend-git/`；原生输入为同目录 `artifacts-<version>/`。这些路径用于读取，当前输出均在本目录。制品持久副本由总管的 artifact-records 线索维护。基础 JS 复跑顺序为 compare → normalize → isolate；[confirm_alpha_only.cjs](confirm_alpha_only.cjs)直接读取留存模块文本，关闭导入排序进行严格检查。[fetch_ts_sources.py](fetch_ts_sources.py)按固定 Git blob 获取缺少的 TS 源码，[map_ts_literals.cjs](map_ts_literals.cjs)只进行文本/AST 映射。体积较大的中间 AST 可重新生成，不纳入仓库。

分析器显式保留跨 chunk 重复模块的所有变体，并按实际 AST 识别 arrow-function 绑定；所有比较均为静态结构结果，未进行形式化验证或动态执行。

关键发现已通过恢复的 `send_message_to_thread` 向总管任务 `01a0825f-0ed4-70c0-abc1-5b03271efadd` 送达。此目录只维护技术材料；公开发言、主报告、commit 和 push 由总管统一处理。
