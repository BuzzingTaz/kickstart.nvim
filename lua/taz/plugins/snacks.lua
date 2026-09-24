local rainbow = require 'taz.core.rainbow-colors'

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = {
      enabled = true,
      size = 2 * 1024 * 1024, -- 2MB
    },
    explorer = { enabled = true, replace_netrw = false },
    indent = {
      enabled = true,
      char = '│',
      only_scope = false,
      only_current = false,
      hl = 'SnacksIndent',
      animate = {
        enabled = false,
      },
      scope = {
        enabled = true,
        char = '│',
        underline = false,
        only_current = false,
        hl = rainbow.delimiters,
      },
    },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
  },
  keys = {
    {
      '\\',
      function()
        Snacks.explorer()
      end,
      desc = 'Snacks Explorer',
    },
  },
}
