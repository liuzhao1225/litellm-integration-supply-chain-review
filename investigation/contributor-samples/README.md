# LiteLLM 集成的五个固定提交样本

观察日期：2026-09-09，北京时间。调查主体为 LiteLLM 及其供应链。从此前 45 条 RheagalFire 外部集成 PR 中尚未固定比较的 23 条里，选择五个样本，覆盖 Python 库、默认容器安装、Home Assistant 集成及 JS proxy 对照。本文只分析公开元数据、固定代码差异和静态文件；未安装或运行 LiteLLM、PR 代码、测试或容器。原有报告未修改。

## 可支持的结论

- **MemoryOS #74 的可选性说明与安装路径不一致。** PR 正文称 LiteLLM 为可选依赖；固定代码在基础 requirements 添加 `litellm>=1.80.0`，现有默认 Dockerfile 和 README 的源码安装步骤均读取这份 requirements。选择默认 OpenAI provider 不会从该安装清单排除 LiteLLM。[PR](https://github.com/BAI-LAB/MemoryOS/pull/74)、[requirements](https://github.com/BAI-LAB/MemoryOS/blob/aa78e1d7f5583bb57e9171f486bac9e995d0beed/memoryos-pypi/requirements.txt)、[Dockerfile](https://github.com/BAI-LAB/MemoryOS/blob/aa78e1d7f5583bb57e9171f486bac9e995d0beed/Dockerfile)
- **ha-llmvision #685 将 SDK 放入整个集成的启动依赖。** `manifest.json` 的 requirements 新增 `litellm>=1.80,<1.88`。按 Home Assistant 的清单机制，该依赖安装范围对应集成加载，不限于用户选择 LiteLLM provider 后的请求路径。[固定清单](https://github.com/valentinfrlch/ha-llmvision/blob/9aeaeb78816aad92b1af7df174f97c23eadd7cfa/custom_components/llmvision/manifest.json)、[官方清单说明](https://developers.home-assistant.io/docs/creating_integration_manifest/#requirements)
- **PyRIT #2154 的最终版本上限不能归为初始作者单独决定。** 当前 head 声明 `>=1.83.0,<1.92.0`，uv.lock 固定 `1.91.3`。十条分支提交中，第一条 author/committer 为 RheagalFire，后九条均为 richlundeen；收紧上限的提交由后者署名，讨论同时给出 Windows/Rust 兼容性解释。[提交链](pr-evidence.json)、[版本上限提交](https://github.com/microsoft/PyRIT/commit/d268c2334de93c7c862c1ddecaf0d28ee96b31c0)、[解释](https://github.com/microsoft/PyRIT/pull/2154#discussion_r3574711212)
- **代码调用 SDK、修改依赖清单、proxy 接入是三个需要分别确认的事实。** bot-on-anything #469 添加 Python SDK 调用但没有修改依赖声明；deep-research-web-ui #88 在已有 JS 客户端上添加本地 proxy 配置，没有新增包清单或锁文件改动。[前者 PR](https://github.com/zhayujie/bot-on-anything/pull/469)、[后者 PR](https://github.com/AnotiaWang/deep-research-web-ui/pull/88)
- 五个样本的新增执行路径中未识别出凭据外传端点、`.pth` / `sitecustomize` 启动载荷或新增 shell 安装钩子。该结论不覆盖 LiteLLM 制品内部，也不等于证明账号动机或依赖整体安全。当前 PR 正文与 26 项讨论中，未找到 RheagalFire 可归属的委托、付费或商业推广关系披露。[讨论元数据](discussion-evidence.json)

## 固定范围与证据等级

五条 PR 的 REST `changed_files` 均与固定 base/head compare 的文件数相等；每份 patch 的新增、删除行数也与对应 API 计数一致，包含空文件。五棵递归树均 `truncated=false`。[完整元数据、固定 SHA 与文件列表](pr-evidence.json)

| 样本 | 固定 head | 文件数 | 当前状态 | 本次证据等级 |
| --- | --- | --- | --- | --- |
| [PyRIT #2154](https://github.com/microsoft/PyRIT/pull/2154) | `245f74c12a6a776a4acf024de909b6ecf7137f14` | 15 | 07-14T04:48:05Z 合并，merged_by=richlundeen | 完整 patch；13 份完整文件，含全部改动的生产 Python 文件、pyproject、uv.lock、CI、devcontainer、Docker |
| [MemoryOS #74](https://github.com/BAI-LAB/MemoryOS/pull/74) | `aa78e1d7f5583bb57e9171f486bac9e995d0beed` | 6 | open | 完整 patch；8 份完整文件，含生产改动、requirements、Docker、英文/中文 README |
| [bot-on-anything #469](https://github.com/zhayujie/bot-on-anything/pull/469) | `f469c228a06b50562ea1fd0f582da00896bdef4e` | 7 | open | 完整 patch；6 份完整文件，含新增 SDK 模块与 Docker；完整 requirements 读取失败 |
| [deep-research-web-ui #88](https://github.com/AnotiaWang/deep-research-web-ui/pull/88) | `d0b6eee8a7b3179b6b65350d046d82a0e034e7ca` | 8 | 08-12T07:22:51Z 合并 | 完整 patch 与完整树；未取得额外完整源文件 |
| [ha-llmvision #685](https://github.com/valentinfrlch/ha-llmvision/pull/685) | `9aeaeb78816aad92b1af7df174f97c23eadd7cfa` | 8 | open | 完整 patch 与完整树；未取得额外完整源文件 |

完整文件共 **27 份**，全部重新计算 Git blob SHA 并与固定 head 的树核对。[完整文件清单与 SHA-256](source-manifest.json)。此前 22 条固定比较加上这五条，共有 27 条具备固定比较证据；45 条集合中仍有 18 条仅有搜索元数据。这个计数不表示 27 条都完成全仓库审计。

## PyRIT：最终依赖、锁文件与作者参与

[最终 pyproject](https://github.com/microsoft/PyRIT/blob/245f74c12a6a776a4acf024de909b6ecf7137f14/pyproject.toml)在 `litellm` extra 和 `all` extra 中均添加 `litellm>=1.83.0,<1.92.0`，基础 dependencies 未添加它。[最终 uv.lock](https://github.com/microsoft/PyRIT/blob/245f74c12a6a776a4acf024de909b6ecf7137f14/uv.lock)固定到 `1.91.3`，源为 `https://pypi.org/simple`，两个制品均来自 files.pythonhosted.org：

| 制品 | SHA-256 |
| --- | --- |
| `litellm-1.91.3-py3-none-any.whl` | `5be4df2bdf5459f46a6224a75046f365dc979995a37a81f5aa3ce29f92f534cf` |
| `litellm-1.91.3.tar.gz` | `096cee401dfd353f050422adc6ed9b25da0fc5e110fc923ce3f0ffa5bc5c2957` |

上述 URL 和哈希与[当前 PyPI 1.91.3 JSON](https://pypi.org/pypi/litellm/1.91.3/json)一致。[核对摘要](lock-evidence.json)。仅验证索引对应关系，未下载制品、检查其内部代码或确认发布者。

安装范围具有条件性：[现有 CI](https://github.com/microsoft/PyRIT/blob/245f74c12a6a776a4acf024de909b6ecf7137f14/.github/workflows/build_and_test.yml)部分任务及[devcontainer setup](https://github.com/microsoft/PyRIT/blob/245f74c12a6a776a4acf024de909b6ecf7137f14/.devcontainer/devcontainer_setup.sh)使用 `uv sync --extra all`，会把该 extra 纳入解析/安装；另有基础 `uv sync` 任务。[Dockerfile](https://github.com/microsoft/PyRIT/blob/245f74c12a6a776a4acf024de909b6ecf7137f14/docker/Dockerfile)显式安装的 extras 列表未含 `litellm` 或 `all`。这些 CI/安装脚本在这条 PR 的差异中均未改动；新增依赖会通过已有选项进入相应路径，未验证实际 CI 执行结果。

[SDK 模块](https://github.com/microsoft/PyRIT/blob/245f74c12a6a776a4acf024de909b6ecf7137f14/pyrit/prompt_target/litellm_chat_target.py)以函数内导入加载 LiteLLM，模型、API key 与 endpoint 来自显式参数或对应环境变量，再交给 `litellm.acompletion`。新增 Base64 处理用于图像/音频消息及音频响应存储；检查到的代码没有将其交给 `exec` 或 shell 执行。

作者参与的可核验分层：

1. [首条分支提交 42d212b…](https://github.com/microsoft/PyRIT/commit/42d212b3d5483f2df9cc96ba59d9a3b072451421)：author/committer=RheagalFire，author_date=2026-07-09T17:27:57Z。仅取得其提交元数据，没有取得该初始 SHA 的完整 pyproject；初始准确版本范围保留未知。
2. richlundeen 在[评论](https://github.com/microsoft/PyRIT/pull/2154#issuecomment-4930759113)明确表示会向分支继续提交并补齐功能；后九条提交 author/committer 均映射到该账号。其[review](https://github.com/microsoft/PyRIT/pull/2154#pullrequestreview-4687202979)也说明写了大量代码，要求另一个人复核。
3. 当前 PR 正文仍写 `>=1.83.0,<2.0.0`；已有[行内 review 的 diff_hunk](https://github.com/microsoft/PyRIT/pull/2154#discussion_r3562286712)在中间提交 `e27b6141b181d48cf5ae8906219946954f2c5466` 也显示这个范围。两者不能替代最终 head。
4. [d268c23…](https://github.com/microsoft/PyRIT/commit/d268c2334de93c7c862c1ddecaf0d28ee96b31c0)由 richlundeen 于 07-13T23:15:25Z 署名，提交标题说明收紧到 `<1.92.0` 是为了跨平台安装。最终文件确为此上限；维护者给出的 Windows/Rust 原因属于公开解释，本次未重现其兼容性测试。

因此，此样本有明确的后续维护者参与和版本约束解释，可反驳“最终上限必然代表初始账号刻意固定某个攻击版本”的直接推断。

## 其余样本的安装与执行边界

| 样本 | SDK、版本与锁定 | 新增执行路径及反证 |
| --- | --- | --- |
| MemoryOS | SDK；基础 requirements 为 `>=1.80.0`，无上限；完整树未发现锁文件，无法指定最终制品哈希 | [LiteLLMClient](https://github.com/BAI-LAB/MemoryOS/blob/aa78e1d7f5583bb57e9171f486bac9e995d0beed/memoryos-pypi/utils.py)在构造/调用时导入；默认 provider 仍为 openai，选用 litellm 后调用 SDK；凭据与额外参数由调用者传入。默认 Git 源码及 Docker 安装会读取新增依赖，但本次未核实已发布的 memoryos-pro PyPI 制品。 |
| bot-on-anything | 新增 SDK 调用；PR 未修改 requirements，代码错误提示和正文只给出未限版本的 `pip install litellm`；未在完整树发现锁文件 | [模块](https://github.com/zhayujie/bot-on-anything/blob/f469c228a06b50562ea1fd0f582da00896bdef4e/model/litellm/litellm_model.py)在 factory 选择该 provider 时导入，缺少 SDK 时抛 ImportError；api_base、api_key 取自用户配置。完整原 requirements 因超时未取得，不能断言原清单从未声明 LiteLLM。 |
| deep-research-web-ui | JS 客户端 → proxy；八个改动文件均非包清单/锁文件，未新增 SDK 安装；树中存在 pnpm-lock.yaml，本次未读取其完整内容 | [固定差异中的路由](https://github.com/AnotiaWang/deep-research-web-ui/blob/d0b6eee8a7b3179b6b65350d046d82a0e034e7ca/shared/utils/ai-model.ts)默认 `http://localhost:4000/v1`，允许用户覆盖；UI 增加官方 docs 链接。维护者[指出](https://github.com/AnotiaWang/deep-research-web-ui/pull/88#issuecomment-4899306270)旧校验阻止无认证本地 proxy，最终 patch 同步修改 UI/校验。 |
| ha-llmvision | SDK；集成级 manifest requirements 为 `>=1.80,<1.88`；完整树未发现锁文件，无确定版本或制品哈希 | [新增 provider 差异](https://github.com/valentinfrlch/ha-llmvision/blob/9aeaeb78816aad92b1af7df174f97c23eadd7cfa/custom_components/llmvision/providers.py)在请求和配置验证时导入并调用 `litellm.acompletion`，传入用户 API key、模型及图像/文本；没有新增指定第三方 proxy。依赖安装先于这些可选调用路径。 |

MemoryOS 与 ha-llmvision 的范围从版本比较上均涵盖历史恶意版本 `1.82.7/1.82.8`，也涵盖其他版本；两者均没有锁定到这两个版本。仅凭范围不能推断 pip 当时实际安装了什么，更不能确定恶意意图。历史恶意版本事实见 [PyPA 公告](https://github.com/pypa/advisory-database/blob/b0f7a727494c977b29c998bc9199de5891f8f302/vulns/litellm/PYSEC-2026-2.yaml)。

## 披露、测试及未闭合项

读取五个 PR 当前正文，以及 issue comments、reviews、inline comments 共 15 个端点集合、26 项讨论；各页不足 100 项，当前列表分页完整。仅 deep-research 的讨论中有 RheagalFire 请求 review 的留言。未找到作者披露受 LiteLLM、Atlas Cloud 或其他主体委托/付费推广的文字。PyRIT 的后续协作证据只证明项目参与，不能推出雇佣或发布权限。[讨论快照](discussion-evidence.json)

PR 作者声称的测试通过未在本次重跑。MemoryOS 新测试构造假的 litellm 模块；这些测试可覆盖调用适配，却不能证明真实 SDK 的安装、导入或网络请求成功。PyRIT 包含集成测试文件，但文件存在本身也不证明执行结果。

完整源文件采集在 `repos/zhayujie/bot-on-anything/git/blobs/3306c27cd7bb7dca09ad3d1f01d0e8bbf2220cc3` 因 **`net/http: TLS handshake timeout`** 终止，未重试或改用另一来源。后续所缺完整文件保持未知；完整 patch、完整树与已下载且验过 SHA 的文件分别标注。源文件清单采用本地写入时间，明确区别于独立记录的 HTTP 查询时间。

没有联系作者、发布评论、安装依赖或执行测试。当前最有区分力的待查证据仍是具体恶意制品、外传路径或可归属的任务委托。

## 公开白名单

仅公开本目录的 `README.md`、`targets.json`、`pr-evidence.json`、`source-manifest.json`、`discussion-evidence.json`、`lock-evidence.json` 及它们的 `publishable.sha256` 清单。`responses/`、`sources/`、`*-diff-local.txt`、采集脚本均仅本地保留；没有在公开快照中保留原始评论正文、commit 邮箱或凭据。
