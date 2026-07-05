#!/bin/sh
# 電池節約型ロック＆画面オフ

# i3lockをバックグラウンドで起動（描画だけして待機）
i3lock -c 000000 &

# 少し待ってから画面オフ
sleep 0.2 # 0.1〜0.5秒で調整可
xset dpms force off

# i3lockが解除されるまで待つ
wait
