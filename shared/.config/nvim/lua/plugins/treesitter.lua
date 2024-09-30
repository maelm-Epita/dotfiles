return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        -- nvim and plugins and notes related languages
        "vim", "vimdoc", "query", "markdown", "markdown_inline", "latex",
        -- programming languages
        "javascript", "html", "c", "cpp", "lua", "python", "bash"
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
