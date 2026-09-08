# 伪装登录通知与 LiteLLM 调查的时间、来源对照

这条线索源自维护者提供的 GitHub 通知摘录。原邮件、通知 token、退订链接及私人邮箱不公开。邮件中的登录时间、IP 和地区均由 issue 作者写入，不能作为 GitHub 实际登录日志。

## 通知如何产生

GitHub 官方说明，通知邮件可以包含 [issue 原文及 @mention](https://docs.github.com/en/subscriptions-and-notifications/get-started/configuring-notifications)，[mention 邮件原因](https://docs.github.com/en/subscriptions-and-notifications/reference/email-notification-headers)表示账号被提及。因此，来自 notifications@github.com 的正常投递不认证正文作者自称的安全事件。

[公开活动分析](../identity-network/phishing-link/README.md)核实 11 个 issue 作者、14 条当前可读 issue 和 4 个 Pages 入口。通知重复使用同一个声称 IP，每条提及一个账号；13 条在 21～27 秒内被关闭。用户原 [notification #1](https://github.com/7051294/notification/issues/1)读取返回 404，未计入该集合，也没有推定删除原因。

四个入口虽使用不同编码，解码后的完整 HTML 字节相同，并从 `hxxps://user-github[.]com/generate` 获取下一跳地址后跳转。[静态源码证据](../identity-network/phishing-link/static-summary.json)记录固定提交、blob 和哈希。没有执行脚本、请求该调度端点或访问最终登录页面。

## 与 YouDub PR 的时间对照

| 事件 | UTC 时间 | 来源与含义 |
| --- | --- | --- |
| 原通知正文自称的登录 | 2026-09-08 15:11:54 | 来自维护者提供的摘录，属于正文主张。Gmail 显示 23:12，若使用北京时间，对应约 15:12 UTC。原始邮件头未独立读取。 |
| 当前可读同模板 issue 的最早实例 | 2026-09-08 15:08:24 | [7052849/notification #1](https://github.com/7052849/notification/issues/1)的 API created_at；属于真实 issue 时间。 |
| LiteLLM #130 创建 | 2026-09-08 18:46:05 | [PR #130](https://github.com/liuzhao1225/YouDub-webui/pull/130)，作者 prodmanpd；比通知正文时间晚 3 小时 34 分 11 秒。 |
| Atlas Cloud #109 创建 | 2026-07-25 11:22:40 | [PR #109](https://github.com/liuzhao1225/YouDub-webui/pull/109)，作者 binyangzhu000-sudo。 |
| Atlas Cloud #109 合并 | 2026-09-08 18:57:51 | [固定 PR 元数据](youdub-atlas-pr.json)，merge commit ce9946334b0de3a7935eb011cc4a9a8998a358cb。 |

现有时间与账号记录不足以证明 PR 作者试图登录维护者账号并自行合并。通知集群与两个 LiteLLM 集成作者之间未建立控制关系。维护者明确报告没有点击邮件按钮；此陈述不能替代全账户取证。

## Atlas Cloud 安装范围

#109 固定 head 为 a76c78bd7251a6fa70ab1ea6d79960b93c23bc0f，共 9 个改动文件，包含 UI 预设、环境变量别名、配置迁移和测试。没有改动依赖清单，也没有添加 LiteLLM import 或调用。它使用既有 OpenAI 兼容翻译路径，配置 Atlas Cloud 端点和专用凭据。[完整差异快照](youdub-atlas-pr.json)。

这个项目的 #109 与另两个使用已有 LiteLLM 的 Atlas Cloud 推广案例拥有不同实现；不能跨仓库转用依赖结论。#109 没有新增 LiteLLM 包，#130 引入 LiteLLM 默认依赖，两项分别核验。

## 被提及维护者的 PR 对照

按照用户请求，对 thatbrguy 的 24 个当前可见公开仓库逐个读取最新 PR（state=all、按 created 降序），其中只有 4 个仓库返回 PR。最新记录是 2023-03-19 的 [kornia #41](https://github.com/thatbrguy/kornia/pull/41)，作者 dependabot[bot]。其余三个仓库最新 PR 分别在 2021、2020、2019 年。未观察到与钓鱼通知邻近的新 PR。[逐仓库记录](thatbrguy-pr-check.json)。

公开搜索的 45 条 PR 也未出现此次调查的 LiteLLM/Atlas 集成账号。最新逐仓库检查支持该时间下限；私有、删除、组织名下仓库及未索引记录不在此结论内。个人站点 pushed_at 的较新日期不能当成 PR 或新源码提交时间，已另存默认分支可见提交对照。

2026-09-08T20:46:01Z 已按维护者要求在 [warning #1 留下英文提醒](https://github.com/7051294/warning/issues/1#issuecomment-5591634274)，告知 thatbrguy 通知机制及官方安全日志入口。[发送与回读记录](warning-receipt.json)确认作者为 liuzhao1225。提醒没有指控 LiteLLM PR 作者参与此钓鱼行为。

2026-09-08T20:56:13Z 已按维护者要求在 [Security #1 留下英文提醒](https://github.com/7051294/Security/issues/1#issuecomment-5591750437)，告知 Vegetebird 相同的通知机制、静态跳转证据及官方安全日志入口。[发送与回读记录](vegetebird-warning-receipt.json)确认发布账号为 liuzhao1225。

该钓鱼分支作为调查期间发现的独立安全事件留档。后续主线继续核对 LiteLLM 制品与发布来源；新增归因结论须有连接两者的独立证据。
