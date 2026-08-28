local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('i', '(', '()<Left>', opts)
keymap('i', '[', '[]<Left>', opts)
keymap('i', '{', '{}<Left>', opts)
keymap('i', '"', '""<Left>', opts)
keymap('i', "'", "''<Left>", opts)
keymap('i', '`', '``<Left>', opts)
