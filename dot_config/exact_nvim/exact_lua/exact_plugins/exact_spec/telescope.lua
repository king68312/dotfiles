return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  -- ディレクトリを開いた時（VimEnter）にも起動するようにイベントを調整
  event = { 'VimEnter', 'BufReadPost' },
  dependencies = { 
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },
  keys = {
    { '<Leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Telescope find files' },
    { '<Leader>fg', '<cmd>Telescope live_grep<CR>',  desc = 'Telescope live grep' },
    { '<Leader>fb', '<cmd>Telescope buffers<CR>',    desc = 'Telescope buffers' },
    { '<Leader>fh', '<cmd>Telescope help_tags<CR>',   desc = 'Telescope help tags' },
    { '<Leader>fe', '<cmd>Telescope file_browser<CR>', desc = 'Telescope file browser' },
  },
  config = function()
    local telescope = require('telescope')
    
    telescope.setup({
      defaults = {
        layout_config = { width = 0.75 },
        file_ignore_patterns = { "%.git/", "vendor/" },
      },
      pickers = {
        find_files = { hidden = true },
      },
      extensions = {
        file_browser = {
          theme = "ivy",
          -- 👇 ここが重要！ディレクトリを開いた時にNetrwの代わりにTelescopeを開く
          hijack_netrw = true, 
          hidden = true,
        },
      },
    })
    
    -- 拡張機能をロード
    telescope.load_extension("file_browser")
  end,
}
