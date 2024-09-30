return {
  'jbyuki/nabla.nvim',
  config = function()
    vim.keymap.set('n','<leader>nb',':lua require("nabla").popup(single)<CR>')
  end
}
