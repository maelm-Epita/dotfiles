-- basic options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- relativenb
vim.cmd("set relativenumber")

-- remaps
-- buffers
vim.keymap.set('n', '<Tab>', ':bn<CR>')
vim.keymap.set('n', '<C-c>', ':bd<CR>')
-- save
vim.keymap.set('n', '<C-s>', ':w<CR>')
-- open diagnostic
vim.keymap.set('n', '<C-d>', vim.diagnostic.open_float)

-- lazy
require("config.lazy")
