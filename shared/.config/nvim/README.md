# my super cool nvim config

## package manager
- lazy

## plugins
- lualine
- neo-tree
- telescope
- treesitter
- mason with lsp-config
- none-ls
- nvim-cmp with Luasnip, friendlysnippets and Nvim-cmp-lsp
- dashboard

## sensible options
- relative line numbers
- 2 space tabs

## remaps
- easily switch between buffers with tab
- easily close buffers with Ctrl+c
- easily save modifications with Ctrl+s
- open floating diagnostics with Ctrl+g

## color schemes
- rose-pine (default)

## LSPs
- python
- c and cpp
- html
- javascript
- lua

## dependencies
- ripgrep

## todo
harpoon
flash

# Important keybinds
- ```<leader>tt``` Opens a terminal
- ```<leader>gt``` Goes to terminal buffer / opens a terminal if none exist
- s Goes into jump mode from flash

# Workflow
- Use ```hjkl``` with count operators
- Use ```gg``` and ```G``` to move through an entire file
- Use ```Ctrl-U``` and ```Ctrl-D``` to move the screen up or down the page
- Use ```f``` or ```t``` and ;, to find on the same line
- Use ```i``` or ```a``` to operate within blocks
- Use ```s``` to jump on the same screen
- Use ```<leader>fg``` to search text in a file
- Use ```<leader>ff``` to search files in a directory
- Use ```<leader>t``` to open or jump to a terminal buffer
- Use ```Ctrl-S``` to save a file
- Use ```Ctrl-C``` to close a buffer
- Use ```Ctrl-G``` to open a diagnostic
