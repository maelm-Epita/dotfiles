-- basic options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- relativenb
vim.cmd("se rnu!")
vim.cmd("se nu!")
-- folding settings
vim.opt.fillchars = {fold = " "}
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.cmd("let g:markdown_folding = 1")

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
-- fold
vim.keymap.set('n', ',', 'za')


-- functions 
-- setup markdown preview
vim.cmd([[
  function OpenMarkdownPreview (url)
    silent execute "! firefox --new-window " . a:url . "& disown"
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])
-- auto cmds
vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})

-- lazy
require("config.lazy")
