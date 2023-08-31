-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', }, ';', ':', { silent = true, nowait = true, desc = 'quick access to command mode' })
vim.keymap.set({ 'n', }, 'n', 'nzz', { silent = true, desc = 'Center search results' })
vim.keymap.set({ 'n', }, 'N', 'Nzz', { silent = true, desc = 'Center search results' })
vim.keymap.set({ 'n', }, '<C-h>', '<cmd>nohl<cr>', { silent = true, desc = 'Remove search highlight' })
vim.keymap.set({ 'n', }, '<leader>fm', '<cmd>Format<cr>', { silent = true, desc = 'Format the current document' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
