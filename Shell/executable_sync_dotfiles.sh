#!/bin/bash

# 1. chezmoiの実際のGitリポジトリ（ソースディレクトリ）のパスを取得して移動
CHEZMOI_SRC=$(chezmoi source-path)
cd "$CHEZMOI_SRC" || exit 1

# 2. リモートの最新状態を裏で取得だけしておく（エラーを生まない安全な方法）
git fetch origin main

if [ -d "$HOME/.config/nvim" ]; then
    # もしnvimの設定ディレクトリが存在する場合、chezmoiに追加
    chezmoi add --exact --recursive "$HOME/.config/nvim"
fi


# 3. すでにchezmoiに追加されているファイルの変更を一括取り込み
chezmoi re-add

# 4. 変更があるか確認
if [ -n "$(git status --porcelain)" ]; then
    # すべての変更をステージング
    git add -A
    # 日時を入れたコミットメッセージでコミット
    git commit -m "Auto-update dotfiles via chezmoi: $(date +'%Y-%m-%d %H:%M:%S')"
    # GitHubへ強制プッシュ（これで競合もエラーもすべて無視して上書きできます）
    git push -f origin main
fi
