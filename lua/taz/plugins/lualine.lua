return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          section_separators = { left = '', right = '' },
          component_separators = { left = '|', right = '|' },
          theme = 'ayu_dark',
        },
        sections = {
          lualine_c = { { 'filename', path = 1 } },
        },
        inactive_sections = {
          lualine_b = { 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } },
        },
      }
    end,
  },
}
