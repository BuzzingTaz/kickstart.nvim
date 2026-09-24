local map = vim.keymap.set
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map({ 'n', 'x' }, 's', '<Nop>')

map('n', '-', '<CMD>Oil<CR>', { silent = true, desc = 'Open parent directory' })

map('n', '<C-d>', '<C-d>zz', { noremap = true, desc = 'Scroll down half page' })
map('n', '<C-u>', '<C-u>zz', { noremap = true, desc = 'Scroll up half page' })

map('n', 'n', 'nzz', { noremap = true })
map('n', 'N', 'Nzz', { noremap = true })

map('x', '<leader>p', '"_dP', { noremap = true, silent = true, desc = 'Paste without yanking' })

map('n', '<up>', '<C-w>k', { noremap = true, desc = 'Move window up' })
map('n', '<down>', '<C-w>j', { noremap = true, desc = 'Move window up' })
map('n', '<left>', '<C-w>h', { noremap = true, desc = 'Move window up' })
map('n', '<right>', '<C-w>l', { noremap = true, desc = 'Move window up' })

-- Quick esc
map("i", "jj", "<Esc>", opts)

map("n", "<leader>w", ":w!<CR>", opts)
map("n", "<leader>q", ":qa<CR>", opts)
