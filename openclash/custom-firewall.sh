#!/bin/sh
# ==============================================================================
# OpenClash 开发者选项自定义防火墙与启动脚本
# 使用方法: 将本脚本内容复制到 OpenClash -> 插件设置 -> 开发者选项 中保存并应用
# ==============================================================================

. /usr/share/openclash/log.sh
. /lib/functions.sh

LOG_OUT "Tip: [ApClash] 正在加载开发者选项自定义规则..."

# 1. 拉取 anti-AD 广告拦截规则并注入到 Dnsmasq
LOG_OUT "[ApClash] 正在获取 anti-AD 广告拦截规则..."
mkdir -p /tmp/dnsmasq.d
curl -s -m 15 https://anti-ad.net/anti-ad-for-dnsmasq.conf -o /tmp/dnsmasq.d/anti-ad-for-dnsmasq.conf
if [ $? -eq 0 ]; then
    LOG_OUT "[ApClash] anti-AD 规则更新成功"
else
    LOG_OUT "[ApClash] anti-AD 规则下载超时或失败，保持现有配置"
fi

# 2. 清理并刷新 DNS 缓存
LOG_OUT "[ApClash] 正在重载 Dnsmasq 缓存..."
/etc/init.d/dnsmasq reload

LOG_OUT "Tip: [ApClash] 开发者选项自定义规则执行完毕！"
exit 0
