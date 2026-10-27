# ⚡ ApClash - 现代化 OpenClash / Clash Meta 优雅分流配置

[![Lint and Validate Rules](https://github.com/Apocalypse-Long/clash/actions/workflows/lint.yml/badge.svg)](https://github.com/Apocalypse-Long/clash/actions/workflows/lint.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Core: Clash.Meta / Mihomo](https://img.shields.io/badge/Core-Clash.Meta%20%2F%20Mihomo-orange.svg)](https://github.com/MetaCubeX/mihomo)

专为 **OpenClash**、**Clash Verge Rev**、**FlClash** 以及 **Mihomo (Clash.Meta)** 定制的现代化精细分流规则库与 Subconverter 远程配置模板。

---

## 🌟 核心特性

- 🎯 **多维度精细分流**：
  - **🤖 AI 服务**：OpenAI / ChatGPT、Anthropic Claude、Google Gemini、xAI Grok、Perplexity、Meta AI、Cursor、Copilot 等专线调度（优先美国/英国/新加坡节点）。
  - **🔍 国际核心**：Google、YouTube、GitHub、Telegram、Twitter(X)、TikTok、Spotify、Facebook 独立策略组。
  - **🎮 游戏加速**：Steam、Epic Games、EA、战网，修复官方对局服务器路由，国内下载走直连加速。
  - **🪙 加密资产**：主流交易所 (Binance, OKX, Bybit 等) 与 Web3 钱包安全分流。
  - **💳 跨境金融**：PayPal、Stripe、Giffgaff 严格定向英美原生纯净节点，降低风控风险。
  - **🛡️ 隐私与直连**：PT 私网 Tracker、个人自建域名 (`aplong.space`)、国内常见银行与设计生产力软件强制直连，防止封号与流量浪费。
- ⚡ **智能测速与容灾**：
  - 提供 `所有-自动`、`所有-手动`、`港日-自动`、`香港-自动`、`日本-自动`、`新加坡-自动`、`美国-自动`、`英国-自动`、`台湾-自动` 及 `其他-自动`。
  - 基于 `gstatic.com/generate_204` 周期性低容差智能选优，节点掉线毫秒级自动切换。
- 📦 **双版本适配**：
  - **旗舰完整版 (`apclash.ini`)**：全场景精细分流，策略组丰富，适合大内存路由、PC 客户端与极致体验用户。
  - **极速轻量版 (`aplite.ini`)**：精简核心分组，低内存开销，适合便携随身 WiFi 或入门级软路由。
- 🚀 **多源 CDN 节点保障**：内置 Fastly、jsDelivr、ghproxy 等镜像加速，国内无代理环境下亦可秒级拉取最新配置。
- 🔄 **零感知平滑升级**：保留根目录原始兼容文件，已有路由器与历史订阅更新无缝继续生效，不出现 404 故障。

---

## 📂 仓库目录架构

```text
├── .github/
│   └── workflows/
│       └── lint.yml             # 自动化 CI：规则语法检测与安全性检查
├── profiles/                    # Subconverter 进阶转换配置模板
│   ├── apclash-full.ini         # 旗舰完整版配置
│   └── apclash-lite.ini         # 极速轻量版配置
├── rules/                       # 模块化纯净规则集 (.list)
│   ├── custom-direct.list       # 个人国内直连规则 (aplong.space, m-team, Steam下载等)
│   ├── custom-proxy.list        # 个人国外代理规则 (docker.io, fosshub, 海外资源等)
│   ├── ai.list                  # 现代综合 AI 规则 (ChatGPT, Claude, Gemini, Grok...)
│   ├── gaming.list              # 游戏平台与服务器规则 (Steam, EA, Blizzard, CS2...)
│   ├── crypto.list              # 加密货币交易平台规则
│   └── check.list               # IP 检测、防泄漏与测速工具规则
├── openclash/                   # OpenClash 路由辅助
│   ├── custom-firewall.sh       # 开发者选项防火墙脚本 (anti-AD 去广告、DNS自动重载)
│   └── openclash-template.uci   # 干净标准的 OpenClash UCI 配置备份参考
├── zashboard/                   # Zashboard Web 仪表盘个性化定制
│   ├── zashboard.json           # 控制面板外观与策略排序配置
│   ├── bg1.jpeg / bg2.jpeg / bg3.jpeg
├── apclash.ini                  # 根目录兼容文件 (等同于 profiles/apclash-full.ini)
├── aplite.ini                   # 根目录兼容文件 (等同于 profiles/apclash-lite.ini)
├── personallist.ini             # 根目录兼容文件 (等同于 rules/custom-direct.list)
├── personallistout.ini          # 根目录兼容文件 (等同于 rules/custom-proxy.list)
└── README.md                    # 本文档
```

---

## 🚀 快速上手使用

### 1. OpenClash (主路由 / 旁路由) 配置

1. 打开路由器后台：**服务** -> **OpenClash** -> **配置订阅**。
2. 点击 **添加**，填入你的机场订阅地址。
3. 勾选 **在线订阅转换**。
4. 在 **转换模板** 中选择 **自定义模板**，并在 **自定义模板 URL** 中填入以下任意一个地址：

> [!TIP]
> **推荐 CDN 链接（国内网络访问速度极快且稳定）：**
> ```text
> https://fastly.jsdelivr.net/gh/Apocalypse-Long/clash@main/apclash.ini
> ```

| 模板版本 | GitHub 原始源 (需外网良好) | Fastly jsDelivr 加速源 (推荐国内直连) |
| :--- | :--- | :--- |
| **旗舰完整版** | `https://raw.githubusercontent.com/Apocalypse-Long/clash/main/apclash.ini` | `https://fastly.jsdelivr.net/gh/Apocalypse-Long/clash@main/apclash.ini` |
| **极速轻量版** | `https://raw.githubusercontent.com/Apocalypse-Long/clash/main/aplite.ini` | `https://fastly.jsdelivr.net/gh/Apocalypse-Long/clash@main/aplite.ini` |

5. 转换服务后端推荐选择：
   - `https://api.wcc.best/sub`
   - `https://api.v1.mk/sub`
   - 或自建 Subconverter 后端
6. 保存配置并点击 **更新配置** 即可！

---

### 2. 在线 Subconverter 一键转换链接生成

若使用 FlClash、Clash Verge Rev 或纯客户端导入，可直接拼接生成订阅链接：

```text
https://api.v1.mk/sub?target=clash&url=【你的机场订阅链接】&insert=false&config=https%3A%2F%2Ffastly.jsdelivr.net%2Fgh%2FApocalypse-Long%2Fclash%40main%2Fapclash.ini&emoji=true&list=false&udp=true&tfo=false&scv=false&fdn=false&sort=false
```

---

### 3. OpenClash 开发者选项去广告脚本

OpenClash 提供了强大的自定义防火墙与启动钩子，本仓库提供了一个自动获取 anti-AD 广告拦截规则并注入到 Dnsmasq 的脚本：

1. 打开 **OpenClash** -> **插件设置** -> **开发者选项**。
2. 将 [`openclash/custom-firewall.sh`](file:///C:/Users/13708/.gemini/antigravity/scratch/clash/openclash/custom-firewall.sh) 中的内容复制粘贴到文本框中。
3. 点击 **应用设置**。
4. 每次 OpenClash 启动或重载时，将自动更新 anti-AD 规则并重载 DNS 缓存。

---

## 🛠️ 自定义规则修改指引

所有规则均置于 `rules/` 目录下，并以纯文本列表呈现。如需增加自己的个性化规则：

### 1. 增加国内直连域名 (不走代理)
编辑 [`rules/custom-direct.list`](file:///C:/Users/13708/.gemini/antigravity/scratch/clash/rules/custom-direct.list)：
```ini
DOMAIN-SUFFIX,your-company.com
DOMAIN,sub.your-nas.com
```

### 2. 增加国外代理域名 (强制翻墙)
编辑 [`rules/custom-proxy.list`](file:///C:/Users/13708/.gemini/antigravity/scratch/clash/rules/custom-proxy.list)：
```ini
DOMAIN-SUFFIX,example-overseas-site.com
```

### 3. 支持的规则语法
- `DOMAIN,example.com`：全域名精确匹配
- `DOMAIN-SUFFIX,example.com`：域名后缀匹配 (匹配 `*.example.com` 与 `example.com`)
- `DOMAIN-KEYWORD,keyword`：域名关键字匹配
- `IP-CIDR,1.2.3.0/24,no-resolve`：IPv4 网段（建议带 `no-resolve` 防 DNS 泄露）
- `IP-ASN,3259`：自治系统编号匹配
- `GEOSITE,category-games@cn`：GeoSite 规则匹配

修改后提交代码至 GitHub，Subconverter 将在下次定时更新订阅时自动同步生效！

---

## 🎨 Zashboard 仪表盘个性化

仓库的 [`zashboard/`](file:///C:/Users/13708/.gemini/antigravity/scratch/clash/zashboard) 目录包含了预设的美化面板配置文件与高清壁纸资源：
- `zashboard.json`：调优后的深色/翡翠绿主题、紧凑卡片宽度、智能延迟展示与分组展开收起逻辑。
- 可直接在 Zashboard 设置面板中导入本配置，享受视觉升级体验。

---

## 🛡️ 自动化持续集成 (CI)

本项目配置了 GitHub Actions 自动化工作流 [`lint.yml`](file:///C:/Users/13708/.gemini/antigravity/scratch/clash/.github/workflows/lint.yml)：
- 每次提交或 Pull Request 时，自动校验所有 `.list` 文件格式规范。
- 自动检测并阻止危险的超大子网掩码（如掩码 `/2`），确保路由稳定性。

---

## 🤝 鸣谢

- [Mihomo (Clash.Meta)](https://github.com/MetaCubeX/mihomo)
- [OpenClash](https://github.com/vernesong/OpenClash)
- [blackmatrix7/ios_rule_script](https://github.com/blackmatrix7/ios_rule_script)
- [Subconverter](https://github.com/tindy2013/subconverter)
