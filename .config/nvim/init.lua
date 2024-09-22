-- basic options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- relativenb
vim.cmd("set relativenumber")

-- remaps
vim.keymap.set('n', '<Tab>', ':bn<CR>')
vim.keymap.set('n', '<C-c>', ':bd<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- lazy
require("config.lazy")
