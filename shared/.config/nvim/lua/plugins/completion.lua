return {
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'saadparwaiz1/cmp_luasnip',
    dependencies = { 'L3MON4D3/LuaSnip', 'rafamadriz/friendly-snippets' }
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require'cmp'
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- the first 2 dont work for some reason
          ['<C-j>'] = cmp.mapping.scroll_docs(-4),
          ['<C-k>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-n'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
          })
      })
    end
  }
}
