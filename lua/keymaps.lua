-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<C-h>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- disable help button
vim.keymap.set({ 'n', 'v', 't', 'i' }, '<F1>', '<Nop>')
-- disable space
vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>')

-- disable cmd mode (as best we can)
vim.keymap.set('n', 'q:', '<Nop>')
vim.keymap.set('n', 'Q', '<Nop>')

-- center the cursor on big jumps
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- better handling of wrapped lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>j', '<cmd>bprev<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>k', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>x', '<cmd>bd<cr>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>b', '<cmd>b#<cr>', { desc = 'Last buffer' })
vim.keymap.set('n', '<c-w>b', '<cmd>w<bar>%db<bar>e#<bar>bd#<cr>', { desc = 'Delete all buffers apart from current' })

-- better visual mode pasting
vim.keymap.set('v', 'p', 'pgvy', { silent = true })
vim.keymap.set('v', 'P', 'Pgvy', { silent = true })
