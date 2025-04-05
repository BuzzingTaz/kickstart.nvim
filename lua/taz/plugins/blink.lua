return {
  {
    'saghen/blink.nvim',
    -- all modules handle lazy loading internally
    lazy = false,
    dependencies = {
      {
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
            highlight = {
              'RainbowDelimiterRed',
              'RainbowDelimiterYellow',
              'RainbowDelimiterBlue',
              'RainbowDelimiterOrange',
              'RainbowDelimiterGreen',
              'RainbowDelimiterViolet',
              'RainbowDelimiterCyan',
            },
          }
        end,
      },
    },

    opts = {
      indent = {
        enabled = true,
        -- start with indent guides visible
        visible = true,
        blocked = {
          buftypes = {},
          filetypes = {},
        },
        static = {
          enabled = true,
          char = '▎',
          priority = 1,
          -- specify multiple highlights here for rainbow-style indent guides
          -- highlights = { 'BlinkIndentRed', 'BlinkIndentOrange', 'BlinkIndentYellow', 'BlinkIndentGreen', 'BlinkIndentViolet', 'BlinkIndentCyan' },
          highlights = { 'BlinkIndent' },
        },
        scope = {
          enabled = true,
          char = '▎',
          priority = 1024,
          -- set this to a single highlight, such as 'BlinkIndent' to disable rainbow-style indent guides
          -- highlights = { 'BlinkIndent' },
          highlights = {
            'BlinkIndentRed',
            'BlinkIndentYellow',
            'BlinkIndentBlue',
            'BlinkIndentOrange',
            'BlinkIndentGreen',
            'BlinkIndentViolet',
            'BlinkIndentCyan',
          },
          underline = {
            -- enable to show underlines on the line above the current scope
            enabled = true,
            highlights = {
              'BlinkIndentRedUnderline',
              'BlinkIndentYellowUnderline',
              'BlinkIndentBlueUnderline',
              'BlinkIndentOrangeUnderline',
              'BlinkIndentGreenUnderline',
              'BlinkIndentVioletUnderline',
              'BlinkIndentCyanUnderline',
            },
          },
        },
      },
    },
  },
}
