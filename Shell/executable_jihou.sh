#!/bin/bash

# i3blocks実行用のパス
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# 【超重要】cronから音声システム(PulseAudio/PipeWire)にアクセスするための呪文
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# 1. メッセージ作成
CURRENT_HOUR=$(date +"%H")
MESSAGE="🔔 ${CURRENT_HOUR}:00 になりました！"

# 2. 一時ファイルに保存
echo "$MESSAGE" > /tmp/jihou_message

# 3. i3blocksをリアルタイム更新
pkill -RTMIN+12 i3blocks

# 4. 音を鳴らす（一番確実な paplay でシステム音を叩きます）
paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null || echo -e "\a"

# 5. 10秒後に消す
sleep 10
echo "" > /tmp/jihou_message
pkill -RTMIN+12 i3blocks
