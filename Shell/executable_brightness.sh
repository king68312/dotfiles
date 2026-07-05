#!/bin/bash

# バックライトデバイス
DEV="/sys/class/backlight/intel_backlight"

# 増減値（デフォルト10）
STEP=${1:-10}

# 現在値と最大値を取得
CUR=$(cat "$DEV/brightness")
MAX=$(cat "$DEV/max_brightness")

# 新しい明るさを計算
NEW=$((CUR + STEP))

# 範囲制限
[ $NEW -lt 0 ] && NEW=0
[ $NEW -gt $MAX ] && NEW=$MAX

# 設定
echo $NEW | sudo tee "$DEV/brightness"

pkill -RTMIN+11 i3blocks
