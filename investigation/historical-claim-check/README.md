# 历史攻击编号、统计与执行条件核验

核查日期：2026-09-09 UTC。本目录记录 CISA/CVE 原始数据和 Python 启动条件，配合[历史发布链核查](../historical-release-claims/README.md)及[历史账号说法核查](../historical-account-claims/README.md)修订统一报告。各项历史事实与当前 1.100/1.101 的攻击归因分别判断。

## CVE 与 KEV 的准确范围

**CVE-2026-33634 确实列入 CISA KEV，加入日期为 2026-03-26。** CISA 目录条目的 vendor/product 为 Aquasecurity / Trivy，名称是 Trivy 嵌入恶意代码漏洞；CVE 原始记录的 affected 列表同时包含 BerriAI LiteLLM `>=1.82.7, <=1.82.8`、相关 Trivy 组件和 Telnyx 恶意版本。因此该编号覆盖有关供应链事件，可以关联到 LiteLLM 历史受影响版本；它没有列出 1.100.0 或 1.101.0rc1。[CISA 官方数据仓库](https://github.com/cisagov/kev-data)、[CVE 官方记录](https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/33xxx/CVE-2026-33634.json)。

本地取得的 KEV 目录版本为 `2026.09.08`，发布字段为 `2026-09-08T18:00:21.1079Z`，共 1699 项。按准确 CVE 编号及全文 `litellm` 搜索得到四项；[提取结果](kev-extract.json)保留全部匹配，避免把其他 LiteLLM 漏洞与此次历史投毒混用。其他匹配为 MCP 认证、命令注入及 SQL 注入漏洞，各有独立编号和版本范围；它们没有被当作当前投毒证据。

[CVE 原始文件](cve-record.json)及 [来源记录](source-records.json)保留原始字节/SHA-256、Git blob SHA 和采集 UTC。Git blob 标识已经按实际字节重新计算并匹配。KEV 全目录只留在 `.raw/`，公开文件是明确筛选后的记录。

## Python `.pth` 的实际触发条件

[Python 官方 `site` 文档](https://docs.python.org/3/library/site.html)说明，通常启动解释器会自动处理相应 site-packages 中的 `.pth` 文件，并执行其中以 `import` 开头的可执行行，不要求业务代码导入对应包。`-S` 可抑制自动加载 `site`；文件必须处于被处理的路径，才会通过这一机制触发。

因此 1.82.8 的恶意 `.pth` 可以在安装后的通常 Python 启动中执行，业务功能关闭或延迟导入 LiteLLM 不覆盖这条路径。单纯下载归档、安装到未被当前解释器处理的位置，以及真实执行成功，是不同事件。暴露应按恶意制品、路径、解释器启动及后续执行证据核对；下载数量不能直接转换成受害者或成功窃密数量。

## 访问与证明限制

CISA 官网 JSON 接口由网页工具读取时返回 403；NVD 详情页返回空的可读正文，CVE/NVD API 由网页工具拒绝打开，未取得其正文。随后分别读取 CISA 官方维护的 GitHub 数据仓库及 CVEProject 原始记录，没有把受阻页面记为“无此漏洞”。[访问记录](read-errors.json)。

当前 Git blob 和目录快照证明本次读取的内容身份，不证明历史各时间点的目录状态。KEV 中的加入日期是 CISA 记录字段；CVE 受影响版本来自 CNA 数据。它们确认历史已知利用信息，不能认证后来版本的安全，也不能识别下游 PR 作者的实际控制者。
