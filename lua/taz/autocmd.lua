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

-- vim.api.nvim_create_autocmd('ExitPre', {
--   desc = 'Autosave on BufferLeave',
--   group = vim.api.nvim_create_augroup('Exit confirmation', { clear = true }),
--   callback = function()
--     local bufnr = vim.api.nvim_create_buf(false, true)
--
--     vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { 'Do you want to exit vim?', '[Y]es  [N]o' })
--     local width = 30
--     local height = 10
--
--     local row = math.floor((vim.o.lines - height) / 2)
--     local col = math.floor((vim.o.columns - width) / 2)
--
--     local opts = {
--       relative = 'editor',
--       width = width,
--       height = height,
--       row = row,
--       col = col,
--       style = 'minimal',
--       border = 'rounded',
--     }
--
--     local winnr = vim.api.nvim_open_win(bufnr, true, opts)
--
--     local function closewin()
--       vim.api.nvim_win_close(winnr, true)
--     end
--
--     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'y', ':qa<CR>', { noremap = true, silent = true })
--     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'n', ':q<CR>', { noremap = true, silent = true })
--
--     vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
--     vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
--     vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'delete')
--   end,
-- })
