-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { silent = true, desc = 'Open parent directory' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, desc = 'Scroll down half page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, desc = 'Scroll up half page' })

vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })

vim.keymap.set('x', '<leader>p', '"_dP', { noremap = true, silent = true, desc = 'Paste without yanking' })
