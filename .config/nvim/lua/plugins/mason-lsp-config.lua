return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls", "pylsp", "html", "ts_ls", "bashls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({}) -- c
      lspconfig.lua_ls.setup({}) -- lua
      lspconfig.pylsp.setup({}) -- python
      lspconfig.html.setup({}) -- htlm
      lspconfig.ts_ls.setup({}) -- javascript
      lspconfig.bashls.setup({}) -- bash

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
