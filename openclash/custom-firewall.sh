#!/bin/sh
# ==============================================================================
# OpenClash 开发者选项自定义防火墙与启动脚本
# 使用方法: 将本脚本内容复制到 OpenClash -> 插件设置 -> 开发者选项 中保存并应用
# ==============================================================================

if [ -f /usr/share/openclash/log.sh ]; then
    . /usr/share/openclash/log.sh
fi
if [ -f /lib/functions.sh ]; then
    . /lib/functions.sh
fi
if ! command -v LOG_OUT >/dev/null 2>&1; then
    LOG_OUT() { echo "$1"; }
fi

ANTI_AD_URL="https://anti-ad.net/anti-ad-for-dnsmasq.conf"
CACHE_DIR="/etc/openclash/cache"
CACHE_FILE="${CACHE_DIR}/anti-ad-for-dnsmasq.conf"
TARGET_DIR="/tmp/dnsmasq.d"
TARGET_FILE="${TARGET_DIR}/anti-ad-for-dnsmasq.conf"
TMP_FILE="${CACHE_DIR}/anti-ad-for-dnsmasq.conf.tmp.$$"

LOG_OUT "Tip: [ApClash] 正在加载开发者选项自定义规则..."

mkdir -p "$CACHE_DIR" "$TARGET_DIR"

# 1. 本地缓存缺失或超过 2 天时，原子拉取并校验 anti-AD 广告拦截规则
NEED_UPDATE=0
if [ ! -s "$CACHE_FILE" ] || [ -n "$(find "$CACHE_FILE" -mtime +1 2>/dev/null)" ]; then
    NEED_UPDATE=1
fi

if [ "$NEED_UPDATE" -eq 1 ]; then
    LOG_OUT "[ApClash] 正在获取 anti-AD 广告拦截规则..."
    if curl -fsSL --connect-timeout 10 -m 20 "$ANTI_AD_URL" -o "$TMP_FILE" \
        && [ -s "$TMP_FILE" ] && grep -q '^address=/' "$TMP_FILE"; then
        mv -f "$TMP_FILE" "$CACHE_FILE"
        LOG_OUT "[ApClash] anti-AD 规则校验通过并更新缓存"
    else
        rm -f "$TMP_FILE"
        LOG_OUT "[ApClash] anti-AD 规则下载或格式校验失败，保留现有缓存"
    fi
else
    LOG_OUT "[ApClash] anti-AD 本地缓存尚在有效期内，跳过下载"
fi

# 2. 注入至 Dnsmasq 并安全重载缓存
if [ -s "$CACHE_FILE" ] && grep -q '^address=/' "$CACHE_FILE"; then
    cp -f "$CACHE_FILE" "$TARGET_FILE"
    LOG_OUT "[ApClash] 正在重载 Dnsmasq 缓存..."
    /etc/init.d/dnsmasq reload
else
    LOG_OUT "[ApClash] 未找到可用的 anti-AD 规则文件，跳过 Dnsmasq 注入"
fi

LOG_OUT "Tip: [ApClash] 开发者选项自定义规则执行完毕！"
exit 0
