return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    lazy = false,
    config = function()
      require('oil').setup {
        lazy = false,
        columns = {
          'icon',
          'mtime',
          'size',
          'permissions',
        },
        win_options = {
          signcolumn = 'yes',
          foldcolumn = '1',
          list = true,
        },
        delete_to_trash = true,
        constrain_cursor = 'editable',
        watch_for_changes = true,
        keymaps = {
          ['<C-s>'] = false,
          ['<C-h>'] = false,
          ['<C-t>'] = false,
          ['-'] = false,
          ['~'] = false,
        },
        view_options = {
          show_hidden = true,
        },
        case_insensitive = true,
      }
    end,
  },
}
