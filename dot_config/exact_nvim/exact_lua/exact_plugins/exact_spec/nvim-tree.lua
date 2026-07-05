return {

  'nvim-tree/nvim-tree.lua',

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()

    -- 構文エラーを防ぐため、setup関数の中で設定を渡します

    require("nvim-tree").setup({

      sort = {

        sorter = "case_sensitive",

      },

      view = {

        width = 30,

        side = "left", -- ツリーを左側に表示

      },

      renderer = {

        group_empty = true, -- 空のディレクトリを1行にまとめる

        

        -- アイコン表示の設定（文字化け対策仕様）

        icons = {

          show = {

            file = false,   -- 特殊フォントがない場合は、一旦 false にすると安全です

            folder = true,

            folder_arrow = true,

            git = false,

          },

          glyphs = {

            folder = {

              arrow_open = "v",   -- 開いているときの矢印

              arrow_closed = ">", -- 閉じているときの矢印

              default = "[D]",    -- ディレクトリのマーク

              open = "[O]",       -- 開いたディレクトリ

              empty = "[E]",

              empty_open = "[EO]",

              symlink = "[L]",

            },

          },

        },

      },

      filters = {

        dotfiles = false, -- trueだと .gitignore や .config が非表示になります。一旦 false（表示）がおすすめ

      },

      -- 便利な機能：ファイルを開いたら、ツリー側もそのファイルの位置に自動で追従する

      update_focused_file = {

        enable = true,

        update_root = false,

      },

    })


    -- nvim-treeを開閉するためのショートカットキー設定（Ctrl + n）

    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

  end,

}
