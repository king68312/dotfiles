return {

  'Bekaboo/dropbar.nvim',

  -- 画面上部に常時表示されるwinbarプラグインのため、起動時に読み込むのがスムーズです

  event = 'BufReadPost',

  dependencies = {

    'nvim-telescope/telescope-fzf-native.nvim',

    build = 'make'

  },

  config = function()

    -- dropbar 本体のセットアップを明示的に呼び出します（これがないとデフォルト設定で起動しません）

    require('dropbar').setup()


    local dropbar_api = require('dropbar.api')

    vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })

    vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })

    vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })

  end

}
