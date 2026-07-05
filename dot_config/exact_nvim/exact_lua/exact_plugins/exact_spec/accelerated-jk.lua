return {
  'rainbowhxch/accelerated-jk.nvim',
  -- キーを押しっぱなしにした時に発動させるため、キーマップをトリガーにして読み込みます
  keys = {
    { 'j', '<Plug>(accelerated_jk_gj)', mode = 'n', desc = 'Accelerated gj' },
    { 'k', '<Plug>(accelerated_jk_gk)', mode = 'n', desc = 'Accelerated gk' },
  },
  config = function()
    require('accelerated-jk').setup({
      mode = 'time_driven', -- または 'count_driven'
      buffer_time = 150,
      acceleration_limit = 150,
      acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
    })
  end,
}
