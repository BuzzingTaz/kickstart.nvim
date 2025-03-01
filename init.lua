vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'taz.opts'
require 'taz.keymaps'
require 'taz.autocmd'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]

local plugins = {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  require 'taz.plugins.which-key',
  require 'taz.plugins.telescope',
  require 'taz.plugins.lsp',
  require 'taz.plugins.autoformat',
  require 'taz.plugins.cmp',
  require 'taz.plugins.treesitter',
  require 'taz.plugins.treesitter-context',
  require 'taz.plugins.colorscheme',
  require 'taz.plugins.mini',
  require 'taz.plugins.oil',
  require 'taz.plugins.fterm',
  require 'taz.plugins.nekifoch',
  require 'taz.plugins.incline',
  require 'taz.plugins.neoscroll',
  require 'taz.plugins.confirm-quit',
  require 'taz.plugins.ufo',
  require 'taz.plugins.harpoon',
  require 'taz.plugins.auto-session',
  -- require 'taz.plugins.lualine',
  require 'taz.plugins.lazygit',
}

require('lazy').setup(plugins, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require 'current-theme'
