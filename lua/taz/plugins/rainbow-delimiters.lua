local rainbow = require 'taz.core.rainbow-colors'

return {
  'HiPhish/rainbow-delimiters.nvim',
  init = function()
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = 'rainbow-delimiters.strategy.global',
        vim = 'rainbow-delimiters.strategy.local',
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = rainbow.delimiters,
    }
  end,
}
