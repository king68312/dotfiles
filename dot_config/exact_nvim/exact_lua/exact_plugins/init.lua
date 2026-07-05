return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

{ import = "plugins.spec.copilot" },
{ import = "plugins.spec.dashboard-nvim" },  
{ import = "plugins.spec.nvim-tree"},
{ import = "plugins.spec.hlcunk"},
{ import = "plugins.spec.nvim-treesitter"},
{ import = "plugins.spec.dropbar"},
{ import = "plugins.spec.accelerated-jk"},
{ import = "plugins.spec.telescope"},
-- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
