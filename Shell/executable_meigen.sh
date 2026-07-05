#!/bin/bash

API_URL="https://meigen.doodlenote.net/api/json.php?c=1"

# curl: -f でエラー時に終了、-s でサイレント、-S でエラー表示、-w でHTTPコード出力
response=$(curl -fsS -w "%{http_code}" -o /tmp/meigen_response.json "$API_URL" 2>/tmp/meigen_error.log)
status=$?

# curlコマンド自体が失敗した場合
if [ $status -ne 0 ]; then
  echo "❌ ネットワークエラーが発生しました"
  echo "詳細: $(cat /tmp/meigen_error.log)"
  exit 1
fi

# HTTPステータスコードを確認
http_code=$(tail -n1 <<<"$response")
if [ "$http_code" != "200" ]; then
  echo "❌ APIエラー: HTTPステータスコード $http_code"
  exit 1
fi

# JSONの中身を取得
json=$(cat /tmp/meigen_response.json)

# jqのパース確認
if ! echo "$json" | jq empty >/dev/null 2>&1; then
  echo "❌ JSONの解析に失敗しました"
  echo "レスポンス内容:"
  cat /tmp/meigen_response.json
  exit 1
fi

# データが空でないか確認
if [ "$(echo "$json" | jq length)" -eq 0 ]; then
  echo "⚠️ データが空です。APIが正しく応答していない可能性があります。"
  exit 1
fi

# 正常にデータを出力
echo "$json" | jq -c '.[]' | while read -r array; do
  meigen=$(echo "$array" | jq -r '.meigen')
  author=$(echo "$array" | jq -r '.auther')
  echo "🗣️ 名言: $meigen"
  echo "👤 著者: $author"
  echo "--------------------------------"
done
