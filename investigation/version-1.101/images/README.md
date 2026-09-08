# 1.101 候选镜像：签名与构建声明

对[候选版公告](https://github.com/BerriAI/litellm/releases/tag/v1.101.0-rc.1)指定的 `ghcr.io/berriai/litellm:v1.101.0-rc.1` 进行了只读元数据核验。固定公钥的 OpenSSL 验证通过；两个平台的构建声明经哈希链关联到该签名索引。没有拉取镜像文件系统层，也没有启动容器。[逐次读取、哈希和验证结果](verification.json)

## 验证了什么

- 索引摘要为 `sha256:32c04b00bc1a720e6d5eeb56a7e72f4e1e7d1e538e779c59b990cbddfd5e27da`，原文见 [index.json](index.json)。
- 使用公告指定的[固定 commit 公钥](https://raw.githubusercontent.com/BerriAI/litellm/0112e53046018d726492c814b3644b7d376029d0/cosign.pub)，SHA-256 为 `ff8869bf14ba9d10af7b64b9d479543b44daec0165e715753c43ff8a998f6dd3`。这是此前 1.99/1.100 验证使用的同一把公钥。
- Cosign payload 中的仓库和索引 digest 均与目标相同，OpenSSL 返回 `Verified OK`。仅核验固定密钥签名，未验证附带透明日志 bundle 或证书身份。
- 索引列出的两个 Linux 平台 manifest、config、两个 attestation manifest 以及两个 in-toto statement 的内容摘要均吻合。每份 statement 的 subject 与索引注解对应平台一致。

完整签名 payload、签名 base64、来源 URL、抓取时间及摘要见 [verification.json](verification.json)；[采集与验证脚本](collect.py)仅读取有大小界限的元数据。原始声明含额外 CI 事件信息，保存在本地忽略目录；公开摘要仅选取与技术来源有关的字段。

## 声明内容及来源界限

两份 SLSA v1 声明均指向发布方的 `BerriAI/project-releaser` 构建任务 `34007455118/attempts/1`，workflow SHA 为 `bf703759a46aa779d0ffb8d4e2a64dc8b9a11650`，actor 字段为 `yuneng-berri`。这些字段是已绑定签名的发布方陈述，未通过该任务的原始日志独立核实实际操作者。[来源摘要](verification.json)

| 平台 | 声明的构建开始 UTC | 声明的构建结束 UTC | VCS revision |
| --- | --- | --- | --- |
| Linux amd64 | 2026-09-06 03:08:36.784244185 | 2026-09-06 03:12:10.797247902 | eeb7732fc11fd47762ca84cc3fb7cc74235d7097 |
| Linux arm64 | 2026-09-06 03:07:21.374106122 | 2026-09-06 03:13:36.700336076 | eeb7732fc11fd47762ca84cc3fb7cc74235d7097 |

镜像标签、声明和配置均使用候选版固定源码 revision。与[1.100 的镜像声明](../../publishing-provenance/README.md)相比，这次输入标为 `release_type=rc`、`allow_republish=false`，没有 `skip_components` 字段；不能从字段缺省推断 wheel 上传已被验证。

两份声明仍将 `request` 与 `resolvedDependencies` 完整性标为 false，列出的本地 context 包括 context、dockerfile、ui-builder。固定基础镜像摘要提供部分构建材料身份，不能还原全部本地输入。**这些声明的 subject 是镜像平台摘要，没有将八个 PyPI 文件哈希绑定为构建产物。** PyPI wheel 来源仍需对应构建记录或证明。[PyPI 八文件身份](../availability.json)

签名验证没有证明构建环境未被入侵，也没有证明镜像内容或全部运行行为安全；它提供的是当前已记录内容的密钥和摘要绑定。公开文件身份见 [evidence-sha256.json](evidence-sha256.json)。
