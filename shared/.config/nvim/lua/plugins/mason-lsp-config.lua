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
        ensure_installed = { "clangd", "lua_ls", "pylsp", "html", "ts_ls", "bashls", "intelephense", "rust_analyzer" },
        auto_install = true
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({capabilities = capabilities}) -- c
      lspconfig.lua_ls.setup({capabilities = capabilities}) -- lua
      lspconfig.pylsp.setup({capabilities = capabilities}) -- python
      lspconfig.html.setup({capabilities = capabilities}) -- htlm
      lspconfig.ts_ls.setup({capabilities = capabilities}) -- javascript
      lspconfig.bashls.setup({capabilities = capabilities}) -- bash
      lspconfig.intelephense.setup({capabilities = capabilities}) -- php
      lspconfig.rust_analyzer.setup({capabilities = capabilities}) -- rust

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

