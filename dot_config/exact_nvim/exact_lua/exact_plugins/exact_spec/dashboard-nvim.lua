return {

  'nvimdev/dashboard-nvim',

  event = 'VimEnter', -- 起動時にしっかり読み込むためのイベント追加

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()

    -- db.setup ではなく require('dashboard').setup を使用します

    require('dashboard').setup({

      theme = 'hyper',

      config = {

        week_header = {

          enable = true,

        },

        shortcut = {

          { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },

          { desc = ' Files', group = 'Label', action = 'Telescope find_files', key = 'f' },

          { desc = ' Apps', group = 'DiagnosticHint', action = 'Telescope app', key = 'a' },

          { desc = ' dotfiles', group = 'Number', action = 'Telescope dotfiles path=' .. os.getenv('HOME') .. '/.dotfiles', key = 'd' },

        },

      },

    })

  end,

}
