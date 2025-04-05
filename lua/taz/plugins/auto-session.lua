return {
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },

    init = function()
      vim.keymap.set('n', '<leader>st', '<cmd>SessionToggleAutoSave<cr>', { desc = 'Session | Toggle', silent = true })
      vim.keymap.set('n', '<leader>sS', '<cmd>SessionSearch<cr>', { desc = 'Session | Search', silent = true })
      vim.keymap.set('n', '<leader>sd', '<cmd>SessionDelete<cr>', { desc = 'Session | Delete', silent = true })
      vim.keymap.set('n', '<leader>sr', '<cmd>SessionRestore<cr>', { desc = 'Session | Restore', silent = true })
      vim.keymap.set('n', '<leader>ss', '<cmd>SessionSave<cr>', { desc = 'Session | Save', silent = true })
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
        previewer = true,
      },
    },
  },
}
