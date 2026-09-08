# 公开沟通与说明核验

本方向用公开身份和具体技术问题收集可核验的说明。现有材料支持继续审查依赖与发布链；尚未确认 LiteLLM 1.100 投毒或某个贡献者参与攻击。沟通记录与代码、制品和构建记录交叉核对，不能用语气、沉默或回复速度判断是否说谎。

## 已有说明与待核验事实

| 对象及来源 | 已有陈述或操作 | 能改变判断的材料 |
| --- | --- | --- |
| prodmanpd：[Chartbrew 回复](https://github.com/chartbrew/chartbrew/pull/365#issuecomment-5207856315) | 承认跨项目提交 LiteLLM 集成，解释需求来自已有模型网关的团队；说明自己不是日常 Chartbrew 用户。 | 所述需求是否对应公开 feature request、项目讨论或可公开的委托说明；这条回复本身没有确立雇佣关系。 |
| prodmanpd：[YouDub #130 已有问询](https://github.com/liuzhao1225/YouDub-webui/pull/130#issuecomment-5590699738) | 已询问独立/赞助/委托关系、真实端点测试的可复现命令和准确包版本，以及从可选改为默认安装的理由。当前读取只有维护者的三条评论，没有作者回复。 | 固定 PR commit、Python/平台、LiteLLM 制品 hash、非敏感安装及测试命令、可公开测试结果，以及相关关系的明确说明。没有回复维持为未知。 |
| richlundeen：[接手说明](https://github.com/microsoft/PyRIT/pull/2154#issuecomment-4930759113)、[版本上限修改](https://github.com/microsoft/PyRIT/commit/d268c2334de93c7c862c1ddecaf0d28ee96b31c0) | 说明会继续实现功能；现有 compare 的十条提交中，首条归属 RheagalFire，后续九条归属 richlundeen，后者收紧 LiteLLM 上限至 1.92.0 以下。 | 按固定提交区分初始贡献与维护者修改。维护者自述与提交元数据相互支持；不能把最终 head 的所有决定归给 PR 发起者。 |
| LiteLLM 发布维护者：[八文件证明查询](../release-chain/integrity-all8.json)、[公开构建问题](https://github.com/BerriAI/litellm/pull/39992) | 当前公开查询没有取得八个 1.100 制品的 provenance；公开讨论记录 PyPI 发布成功后 Docker 构建另行修复。 | 将具体 wheel/sdist SHA-256 连接到实际构建 run、源码 commit、发布身份及平台工具链的可公开记录。查询缺口不能自动推导未授权发布。 |

PyRIT 的[固定 pyproject](https://github.com/microsoft/PyRIT/blob/245f74c12a6a776a4acf024de909b6ecf7137f14/pyproject.toml#L138)声明 `litellm>=1.83.0,<1.92.0`；该文件本地内容已对 Git blob `a4a88c776fbb768ba3dc73eb4bffe00d09c6d766` 验证。其 [PR 描述](https://github.com/microsoft/PyRIT/pull/2154)仍写 `<2.0.0`。这提供了“描述没有随着维护者修改同步”的具体对照，不能把每一处文字差异都解释为欺骗。

## 沟通顺序与证据标准

1. 先固定相关 head、已有评论和制品身份，再提出指向具体变化的问题。已在 #130 发布的问题维持同一条讨论，后续围绕新答复中的未决点补充。
2. 让负责依赖改动、测试和发布的各方分别说明自己完成的工作，引用各自有权公开的记录。问题保持中性，不暗示已经掌握投毒证据。
3. 比对说明与固定提交、锁文件、测试配置、构建时间和制品 hash。矛盾需要定位到具体字段；修改说明和正常工程原因同样保留。
4. 只请求与争议有关的非敏感记录，例如准确版本与脱敏命令。无需 API key、登录 token、完整环境变量或私人联系信息。
5. 需要发布来源说明时，先整理八个制品的准确身份与对应缺口，形成一条明确请求；本文中的发布方问题尚未对外发送。

## 供发布维护者核对的问题草稿

> We are reviewing the provenance of LiteLLM 1.100.0. Our saved PyPI Integrity responses did not provide provenance for its eight published artifacts. This does not establish a compromise. Could you point us to public build records that bind those artifact SHA-256 values to the actual source commit, build run and publishing identity? The Docker build repair appears to have followed the PyPI upload, so we would like to identify the source and toolchain used for the original wheels and sdist, separately from the later image build.

此草稿请求构建证据，不预设发布者恶意。公开讨论、技术归因与真实账号安全事件分别按各自证据处理。
