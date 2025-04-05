-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Makes vertical splits the default when a new split is created',
  group = vim.api.nvim_create_augroup('vert-default', { clear = true }),
  pattern = { 'help', 'man' },
  command = 'wincmd L',
})

-- vim.api.nvim_create_autocmd('DirChanged', {
--   desc = 'Adds cwd to zoxide whenever directory is changed',
--   group = vim.api.nvim_create_augroup("CwdZoxideAdd", {clear = true}),
--   pattern = {'global'},
--   callback = function(v)
--   end
-- })
