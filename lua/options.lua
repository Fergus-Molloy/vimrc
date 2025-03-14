-- Show which line your cursor is on
vim.o.cursorline = true

-- highligt vertical column
vim.o.colorcolumn = '100'

-- better diff
vim.o.diffopt = 'internal,filler,closeoff,iwhiteall'

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
-- search and replace
vim.o.gdefault = true
vim.o.hlsearch = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Minimal number of screen lines to keep around the cursor.
vim.opt.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- better grepping
vim.o.grepprg = 'rg --vimgrep --smart-case'
vim.o.grepformat = '%f:%l:%c:%m'

vim.o.termguicolors = true

-- enable spell checking
vim.o.spell = true
vim.o.spelllang = 'en_gb'
