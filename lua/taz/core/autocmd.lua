local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local ThePrimeagenGroup = augroup('ThePrimeagen', { clear = true })
local yankGroup = augroup('yankHighlight', { clear = true })

autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = yankGroup,
  callback = function()
    vim.hl.on_yank {
      'IncSearch',
      { timeout = 50 },
      { on_visual = true, on_macro = true, on_yank = true },
    }
  end,
})

autocmd({ 'BufWritePre' }, {
  group = ThePrimeagenGroup,
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

autocmd('FileType', {
  desc = 'Makes vertical splits the default when a new split is created',
  group = vim.api.nvim_create_augroup('vert-default', { clear = true }),
  pattern = { 'help', 'man' },
  command = 'wincmd L',
})
