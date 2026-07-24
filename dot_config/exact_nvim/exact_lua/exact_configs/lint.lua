return {
  'mfussenegger/nvim-lint',
  event = { "BufReadPost", "BufWritePost", "InsertLeave" }, -- ファイルを開いた時、保存した時などに実行
  config = function()
    local lint = require('lint')

    -- 言語ごとに、Masonで入れたリンターの名前を指定します
    lint.linters_by_ft = {
      lua = { "luacheck" },
      cpp = { "cpplint" },
      c = { "cpplint" },
      haskell = { "hlint" }, -- filetype は "hlint" ではなく "haskell"
      -- python = { "pylint" },
      -- javascript = { "eslint_d" },
    }

    -- ファイル保存時や編集を離れた時に、自動でLinterを実行する設定
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
