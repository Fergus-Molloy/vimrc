-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
if vim.g.vscode then
  require 'keymaps'
else
  require 'keymaps'
  require 'plugins'
  require 'options'
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
