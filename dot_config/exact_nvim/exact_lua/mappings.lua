require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- 既存の設定の末尾に追記してください

-- nvim-cmpの読み込み（プラグインがロードされてから設定を適用）
pcall(function()
  local cmp = require("cmp")

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      -- Tabで補完を確定する (一番上の候補を自動選択)
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),

      -- Enterでの確定を無効化し、通常の改行にする
      ["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() then
            -- メニューが表示されていても確定せず、改行を挿入
            fallback()
          else
            fallback()
          end
        end,
      }),
    }),
  })
end)
  
