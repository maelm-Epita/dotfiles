return {
  'MeanderingProgrammer/render-markdown.nvim',
  opts = {},
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, 
  config = function()
    require('render-markdown').setup({
      -- Whether Markdown should be rendered by default or not
      enabled = true,
      max_file_size = 10.0,
      preset = 'lazy',
      render_modes = true,
      anti_conceal = {
        -- This enables hiding any added text on the line the cursor is on
        enabled = true,
        -- Number of lines above cursor to show
        above = 0,
        -- Number of lines below cursor to show
        below = 0,
      },
      padding = {
        -- Highlight to use when adding whitespace, should match background
        highlight = 'Normal',
      },
      latex = {
        -- Whether LaTeX should be rendered, mainly used for health check
        enabled = false,
        -- Executable used to convert latex formula to rendered unicode
        converter = 'latex2text',
        -- Highlight for LaTeX blocks
        highlight = 'RenderMarkdownMath',
        -- Amount of empty lines above LaTeX blocks
        top_pad = 0,
        -- Amount of empty lines below LaTeX blocks
        bottom_pad = 0,
        left_pad = 0,
      },
    })
  end
}
