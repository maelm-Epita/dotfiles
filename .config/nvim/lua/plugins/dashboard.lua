return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
      theme = 'doom',
      shortcut_type = 'letter',
      config = {
        header = {
          '                     ▓▓▓▓▓▓▓▓                 ',
          '              ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓             ',
          '           ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓           ',
          '         ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓         ',
          '       ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓        ',
          '       ▓▓▓▓▓▓▓▓█▓▓▓▓█▓█▓▓▓▓▓█▓▓▓▓▓▓▓▓▓        ',
          '      ▓▓▓█▓█▓▓█▓█▓▓▓█▓▓█▓▓▓▓██▓█▓▓▓▓▓▓▓       ',
          '      ▓▓█▓█▓▓████▓▓█▓█ ▒▓▓▓▓▓█▓ █▓▓▓▓▓▓▓      ',
          '      ▓▓█▓█▓▓▓  ███         ░▒▒ ▒▓▓▓▓▓▓▓      ',
          '       ▓▓█ █▓    █               █▓▓▓▓▓▓      ',
          '        ▓▓▓                      █▓▓▓▓▓▓      ',
          '       ▓▓▓█ ██████        █▓███▓▒█▓▓▓▓▓▓      ',
          '       ▓▓▓██     █        █      █▓▓▓▓▓▓      ',
          '       ▓▓▓██         ▓           ▓▓▓▓▓▓▓      ',
          '       ▓▓▓▓█                    █▓▓▓▓▓▓▓      ',
          '       ▓▓▓▓██      █    ██     ██▓▓▓▓▓▓▓      ',
          '       ▓▓▓▓█▓▓█     █████    ▓▓▓█▓▓▓▓▓▓▓      ',
          '       ▓▓▓▓▓▓▓▓▓▓██       ▓█▓▓▓▓█▓▓▓▓▓▓▓      ',
          '       ▓▓▓▓▓▓▓▓▓▓▓▓█       █▓▓▓▓▓▓▓▓▓▓▓▓      ',
          '       ▓▓▓▓▓▓▓▓▓▓▓██       ██▓▓▓▓▓▓▓▓▓▓▓      ',
          '        ▓▓▓▓▓▓▓▓█▒ █      ▒    █▓▓▓▓▓▓▓       ',
          '        ▓▓▓▓▓▓▓█    ▒    █      █▓▓▓▓▓▓       ',
          '         ▓▓▓▓▓█▒█     ███     █   ▒█▓▓        ',
          '          ▓█░    ▒  ░    ▓  ░▒                ',
          '          ▓        ▓      ▓                   ',
          '',
          '    --------------------------------------    ',
          '',
          '',
        },
        center = {
          {
            desc = 'Find File',
            key = 'f',
            key_format = '',
            keymap = 'SPC f f',
          },
          {
            desc = 'Find word',
            key = 'w',
            key_format = '',
            keymap = 'SPC f g',
          },
          {
            desc = 'Open file browser',
            key = 'n',
            key_format = '',
            keymap = 'CTRL n',
          },
        },
        footer = {
          '',
          'welcome to nvim',
          ''
        }
      },
      hide = {
        statusline = true,
        tabline = false,
        winbar = true
      },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
