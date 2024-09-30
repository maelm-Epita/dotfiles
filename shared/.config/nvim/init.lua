-- basic options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- relativenb
vim.cmd("se rnu!")
vim.cmd("se nu!")

-- remaps
vim.cmd("let mapleader = ' '")
-- buffers
vim.keymap.set('n', '<Tab>', ':bn<CR>')
vim.keymap.set('n', '<S-Tab>', ':bp<CR>')
vim.keymap.set('n', '<C-c>', ':bd<CR>')
-- save
vim.keymap.set('n', '<C-s>', ':w<CR>')
-- open diagnostic
vim.keymap.set('n', '<C-d>', vim.diagnostic.open_float)
-- terminal
vim.keymap.set('n', '<leader>tt', ':terminal<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
-- setup markdown preview
vim.cmd([[
  function OpenMarkdownPreview (url)
    execute "! firefox --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])

-- lazy
require("config.lazy")
