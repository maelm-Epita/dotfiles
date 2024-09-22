return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- custom module to show if sudo
    local function sudo()
      local sc = os.getenv("SUDO_COMMAND")
      if (sc == nil)
      then
        return "NOT SUDO"
      else
        return "SUDO"
      end
    end
    require('lualine').setup({
      options = {
        theme = 'rose-pine',
        component_separators = { left = ' ', right = ' '},
        section_separators = { left = ' ', right = ' '},
        globalstatus = true
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {sudo},
        lualine_y = {'encoding, fileformat, filetype'},
        lualine_z = {'location'},
      },
      tabline = {
        lualine_z = {'buffers'},
      }
    })
  end
}
