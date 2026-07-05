#!/bin/bash

# デフォルトの出力デバイス名を取得
SINK=$(pactl get-default-sink)

# 現在の音量（%）を取得
VOLUME=$(pactl get-sink-volume "$SINK" | grep -oE '[0-9]+%' | head -n1)

# 現在のミュート状態（yes または no）を取得
MUTE=$(pactl get-sink-mute "$SINK" | awk '{print $2}')

echo "🔊 $VOLUME"  # バーに表示される文字（例: 🔊 50%）
echo "$VOLUME"     # 省略時の文字
## デフォルトの出力デバイス（シンク）を取得
#SINK=$(pactl get-default-sink)
#
## 音量（%）を取得
#VOLUME=$(pactl get-sink-volume "$SINK" | grep -oE '[0-9]+%' | head -n1)
#
## ミュート状態（yes / no）を取得
#MUTE=$(pactl get-sink-mute "$SINK" | awk '{print $2}')
#
## i3blocksへの出力
#if [ "$MUTE" = "yes" ]; then
#    echo "VOL Muted"
#else
#    echo "VOL $VOLUME"
#fi
