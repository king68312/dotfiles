return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- configs/lint.lua に設定があるが plugins へ未登録だったため追加
  { import = "configs.lint" },

  -- LSP / formatter で使っている言語のパーサを自動導入
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c",
        "cpp",
        "haskell",
        "elm",
      },
    },
  },

  { import = "plugins.spec.copilot" },
  { import = "plugins.spec.dashboard-nvim" },
  { import = "plugins.spec.nvim-tree" },
  { import = "plugins.spec.hlcunk" },
  { import = "plugins.spec.nvim-treesitter" },
  { import = "plugins.spec.dropbar" },
  { import = "plugins.spec.accelerated-jk" },
  { import = "plugins.spec.telescope" },
  -- { import = "nvchad.blink.lazyspec" },
}
