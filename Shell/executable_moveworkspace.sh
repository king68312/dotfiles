#!/bin/sh
: <<'#COMMENT'
#!/bin/sh
current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')

# 移動方向
if [ "$1" = "next" ]; then
    target=$((current + 1))
else
    target=$((current - 1))
fi

# 0以下を防ぐ（必要なら削除）
if [ "$target" -le 0 ]; then
    target=1
fi

# 移動
i3-msg workspace number $target

# 現在のワーク`スペース番号
current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).num')

# 存在するワークスペース番号を昇順で取得
workspaces=$(i3-msg -t get_workspaces | jq '.[].num' | sort -n)

if [ "$1" = "next" ]; then
    target=$(echo "$workspaces" | awk -v c="$current" '$1 > c { print; exit }')
else
    target=$(echo "$workspaces" | awk -v c="$current" '$1 < c { t=$1 } END { print t }')
fi

# 移動先があれば移動
if [ -n "$target" ]; then
    i3-msg workspace number "$target"
fi

#COMMENT

# 現在のワークスペース番号
current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).num')

# 存在するワークスペース番号を昇順で取得
workspaces=$(i3-msg -t get_workspaces | jq '.[].num' | sort -n)

# 最小値と最大値を取得（ループ用）
first_ws=$(echo "$workspaces" | head -n 1)
last_ws=$(echo "$workspaces" | tail -n 1)

if [ "$1" = "next" ]; then
    # 現在地より大きいものを探す。なければ最初のワークスペース(first_ws)に戻る
    target=$(echo "$workspaces" | awk -v c="$current" -v f="$first_ws" '$1 > c { print; exit } END { if (!NR || $1 <= c) print f }')
else
    # 現在地より小さいものを探す。なければ最後のワークスペース(last_ws)にループする
    target=$(echo "$workspaces" | awk -v c="$current" -v l="$last_ws" '$1 < c { t=$1 } END { print (t != "" ? t : l) }')
fi

# 移動先があれば移動
if [ -n "$target" ]; then
    i3-msg workspace number "$target"
fi
