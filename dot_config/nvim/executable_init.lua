-- システムのクリップボードと常に同期
vim.opt.clipboard = "unnamedplus"

-- ビジュアルモードで選択したものに上書きペーストしても、ヤンク内容を維持する
vim.keymap.set("x", "p", '"_dP')
