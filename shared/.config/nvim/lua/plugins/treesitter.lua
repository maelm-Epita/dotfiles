return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        -- nvim and plugins related languages
        "vim", "vimdoc", "query",
        -- programming languages
        "javascript", "html", "c", "cpp", "lua", "python", "bash"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
