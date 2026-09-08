# LiteLLM 调查期间收到的伪装登录通知：账号与公开活动

观察时间：2026-09-08T20:42:12Z～20:47:25Z。通过 GitHub REST 提取白名单字段；未执行外链页面脚本，未提交登录信息，未读取用户完整原邮件。四个入口均已按固定提交静态解码，未执行脚本或访问外部目标。本文判断通知来源与公开行为，不能替代 GitHub 真实安全日志。

## 结论

当前证据支持一个重复发送伪装登录通知的账号集群：**11 个 issue 作者、14 条可读 issue、4 个 GitHub Pages 入口**。所有 issue 同标题、同一声称 IP、同按钮文案、每条提及一个账号；13 条在创建后 21～27 秒关闭。相同 IP 出现在多个作者给其他账号发送的模板中，不能把它认作针对用户的真实登录证据。尚未建立这一集群与 `prodmanpd`、`RheagalFire` 或 TeamPCP 的实际控制关系。[脱敏逐条证据与交集结果](public-summary.json)

用户通知引用的 [7051294/notification #1](https://github.com/7051294/notification/issues/1) 在本次 REST 读取时返回 **404**。不能据此判断删除原因，也未将其正文冒充为当前公开可读内容。这个原 issue 没有计入下述 14 条。

## 当前可核验的重复行为

[7051294/warning #1](https://github.com/7051294/warning/issues/1) 创建于 **19:42:21Z**，25 秒后关闭；[7051294/Security #1](https://github.com/7051294/Security/issues/1) 创建于 **19:45:32Z**，26 秒后关闭。两条作者均为 `7051294`，关联为 OWNER，标题均为 `Suspicious sign in prevented`，正文均包含 `This wasn't me` 与声称 IP `62.109.182.255`，分别指向 `profilesecurity-io.github.io`、`support-message.github.io`。它们提及的账号均非本任务用户及两个 LiteLLM 集成作者；公开摘要省略实际被提及的第三方登录名。

按这个声称 IP 搜索正文，GitHub 当前索引返回 14 条。全部已逐条重新读取 REST；每条都位于作者自己的仓库，每条仅一个 mention。**14 条 mention 不等于已经去重的 14 位收件人**，本报告未对第三方收件人做身份分析。当前可读最早记录是 [7052849/notification #1](https://github.com/7052849/notification/issues/1)，实际创建于 **2026-09-08T15:08:24Z**。这个时间来自 API 的 `created_at`，与正文声称的登录时间属于不同字段。

| issue 作者 | 账号创建时间 UTC | 当前匹配 issue 数 |
| --- | --- | --- |
| [00705812](https://api.github.com/users/00705812) | 2026-09-05T07:04:57Z | 1 |
| [705019](https://api.github.com/users/705019) | 2026-09-05T17:42:38Z | 1 |
| [7052908](https://api.github.com/users/7052908) | 2026-09-08T06:04:03Z | 1 |
| [7051392](https://api.github.com/users/7051392) | 2026-09-08T06:13:02Z | 1 |
| [7052849](https://api.github.com/users/7052849) | 2026-09-08T06:19:10Z | 3 |
| [705390](https://api.github.com/users/705390) | 2026-09-08T11:59:49Z | 1 |
| [7051294](https://api.github.com/users/7051294) | 2026-09-08T14:27:31Z | 2 |
| [705182](https://api.github.com/users/705182) | 2026-09-08T14:33:50Z | 1 |
| [705214](https://api.github.com/users/705214) | 2026-09-08T14:37:54Z | 1 |
| [705039](https://api.github.com/users/705039) | 2026-09-08T17:19:51Z | 1 |
| [705219](https://api.github.com/users/705219) | 2026-09-08T17:34:06Z | 1 |

九个作者账号于 9 月 8 日创建，两个于 9 月 5 日创建。数字命名和创建日期只能辅助定位；这里的行为关联以相同通知模板、声称 IP 和复用外链为依据。[全部元数据](public-summary.json)

## 外链对应的 GitHub 账号

| GitHub 账号 | 创建时间 UTC | 14 条 issue 中使用其 Pages 主机的数量 |
| --- | --- | --- |
| [profilesecurity-io](https://api.github.com/users/profilesecurity-io) | 2026-08-29T17:06:59Z | 2 |
| [info-notify](https://api.github.com/users/info-notify) | 2026-08-29T17:13:51Z | 5 |
| [support-message](https://api.github.com/users/support-message) | 2026-09-05T13:17:02Z | 4 |
| [users-info](https://api.github.com/users/users-info) | 2026-09-05T17:49:15Z | 3 |

[705019/notification #1](https://github.com/705019/notification/issues/1) 提供了当前仍可核验的 `info-notify.github.io` 外链；[705214/Security #1](https://github.com/705214/Security/issues/1) 提供了 `users-info.github.io` 外链。这建立的是 issue 与入口主机之间的引用关系，不能独立确定背后的真实操作者。

`info-notify/info-notify.github.io` 仓库创建于 08-29T17:15:45Z，公开主分支当前只有 [1c60464c0e2d1a82493b26969d043f1a2656c155](https://github.com/info-notify/info-notify.github.io/commit/1c60464c0e2d1a82493b26969d043f1a2656c155) 一个提交；账号归属 author=info-notify、committer=web-flow，提交时间 17:16:00Z，verification.verified=true。树只有 `index.html`，blob SHA 为 `6258cb06dd936c9220713a953048cf7e67db7aa7`。签名记录证明此 GitHub 提交的验证状态，不能证明网页可信。

另两个已查仓库主分支的可见提交作者分别为 `profilesecurity-io`（两个提交）和 `support-message`（一个提交），committer 均为 web-flow：[前者提交](https://github.com/profilesecurity-io/profilesecurity-io.github.io/commit/55b4c7427341186d1f2d953bb062096e943f60ab)、[后者提交](https://github.com/support-message/support-message.github.io/commit/9259084900847f11d44dc5cfc029ebfe229daa29)。这些可见提交没有两个 LiteLLM 集成作者的账号归属。[users-info 当前唯一主分支提交](https://github.com/users-info/users-info.github.io/commit/82ef4150ad8a3bbb646e57de303f3b6b42c9508a)创建于 09-05T17:51:52Z，author=users-info、committer=web-flow、verified=true。

## 四个入口的固定源码关联

固定提交中的 `index.html` 分别使用三种编码包装：info-notify 为整数数组，profilesecurity-io 为十六进制字符串，support-message 与 users-info 为 Base64 字符串。只用 Python 字符转换及 Base64 解码后，**四份解码文本完全一致**，SHA-256 均为 `7ae96917990839cd00f52bb1a2268dc5e5a5ed42f88f450cc8b0a99124178f96`。[固定 SHA、原文哈希与静态特征](static-summary.json)

四份文本均先请求 `hxxps://user-github[.]com/generate`，读取响应文本，再将其赋给 `window.location.href`。因此它们共享相同跳转调度入口及完全相同的内层代码。support-message 与 users-info 连外层文件也完全一致，Git blob 均为 `0a342d64d8534b9bedf76b2a2626bf0883a165db`。这是将四个通知入口归入同一技术集群的强证据。[support-message 固定源码](https://github.com/support-message/support-message.github.io/blob/9259084900847f11d44dc5cfc029ebfe229daa29/index.html)、[users-info 固定源码](https://github.com/users-info/users-info.github.io/blob/82ef4150ad8a3bbb646e57de303f3b6b42c9508a/index.html)

没有请求 `/generate`，没有跟随返回地址；最终登录页、凭据接收端及运行时响应均未知。共享技术入口仍不能单独确认实际操作者，也没有把它与 LiteLLM PR 作者关联起来。

## 与 LiteLLM 账号的关联边界

- 11 个 issue 作者与 4 个 Pages 账号，共 15 个当前登录名，与 LiteLLM 扩展搜索的 **416 个候选作者登录名没有交集**。
- 这 15 个登录名与 3 月 24 日披露 issue 中的 **115 个重复评论账号没有交集**。
- 当前 14 条通知均未提及 prodmanpd 或 RheagalFire；info-notify 的作者 issue 搜索为零，7051294 的作者 issue 搜索仅返回上述两条。
- 这些是当前公开范围内的阴性证据。尚未核实账号控制权、后台登录日志或操作设备，不能由无交集推导不同操作者，也不能由用户先后收到 PR 与通知推导“PR 作者试图登录并自行 merge”。

检索和静态元数据能证明伪装通知的发送模式。确认真实登录事件应依据 GitHub 安全日志；确认与某个 PR 作者同源则需要独立的控制关系证据。

## 公开范围

可公开文件为本文、`public-summary.json` 与 `static-summary.json`。摘要保留来源端点、观察时间、原响应哈希、账号元数据、issue 元数据及有限的正文特征，不包含完整 issue 正文、第三方收件人名单、完整邮件、邮箱地址、邮件通知 token、退订 token 或 commit 邮箱。其余查询中间文件及收集脚本保留本地。没有保存用户完整原邮件。
