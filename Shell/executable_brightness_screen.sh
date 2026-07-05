#!/bin/bash


# カンマの3番目（生の数値）を取得するように変更

BRIGHTNESS=$(brightnessctl -m | cut -d, -f3)


echo "BRI $BRIGHTNESS"
# スクリプトの最終行にこれを追記
