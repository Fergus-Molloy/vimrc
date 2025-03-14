-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- disable spell in terminals
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'disable spell in terminal',
  pattern = '*',
  callback = function(_)
    vim.wo[0].spell = false
  end,
})

vim.api.nvim_create_autocmd('BufRead', {
  desc = 'disable spell for certain filetypes',
  pattern = { '*.out', '*.log' },
  callback = function(_)
    vim.wo[0].spell = false
  end,
})
