#!/bin/bash

# ミュート状態をチェック
if pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"; then
    echo "🔊 MUTE"
else
    # デフォルトデバイスから音量（％）を1行で直接ブチ抜く
    VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oE '[0-9]+%' | head -n1)
    echo "🔊 $VOLUME"
fi
