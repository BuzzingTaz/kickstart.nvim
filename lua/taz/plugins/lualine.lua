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
        tabline = {
          lualine_a = { 'buffers' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { { 'lsp_status', ignore_lsp = { 'null-ls', 'GitHub Copilot' } } },
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
