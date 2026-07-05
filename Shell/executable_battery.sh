#!/bin/bash
# バッテリー残量を取得
CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
# 充電状態（Charging / Discharging）を取得
STATUS=$(cat /sys/class/power_supply/BAT1/status)

if [ "$STATUS" = "Charging" ]; then
    echo "⚡ $CAPACITY%"
else
    echo "🔋 $CAPACITY%"
fi
