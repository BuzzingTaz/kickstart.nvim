return {
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {},

    init = function()
      vim.keymap.set('n', '<leader>St', '<cmd>AutoSession toggle<cr>', { desc = 'Session Toggle', silent = true })
      vim.keymap.set('n', '<leader>SS', '<cmd>AutoSession search<cr>', { desc = 'Session Search', silent = true })
      vim.keymap.set('n', '<leader>Sd', '<cmd>AutoSession delete<cr>', { desc = 'Session Delete', silent = true })
      vim.keymap.set('n', '<leader>Sr', '<cmd>AutoSession restore<cr>', { desc = 'Session Restore', silent = true })
      vim.keymap.set('n', '<leader>Ss', '<cmd>AutoSession save<cr>', { desc = 'Session Save', silent = true })
    end,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      cwd_change_handling = true,
      -- log_level = 'debug',
      show_auto_restore_notif = true,
      session_lens = {
        picker = 'snacks',
        previewer = true,
      },
    },
  },
}
