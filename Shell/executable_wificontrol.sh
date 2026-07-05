#!/bin/bash


# パスを確実に通す

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


# 【最軽量】現在のアクティブなWi-Fi名(SSID)を一瞬で取得

SSID=$(nmcli -t -f NAME connection show --active | grep -v -E "lo|docker|vbox" | head -n 1)


# 電波強度の代わりに、デバイスの状態から簡易的に取得（または固定表示）

# ここは遅延をなくすために、まずはSSIDの表示だけに集中します！


if [ -z "$SSID" ]; then

    echo "📶 接続なし"

else

    echo "📶 $SSID"

fi
