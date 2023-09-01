-- [[ Setting options ]]

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Don't sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.o.clipboard = ''

-- Enable break indent
vim.o.breakindent = true

-- set tab width default to 4
vim.o.joinspaces = false
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- automatically use /g for replace
vim.o.gdefault = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true
vim.o.guifont = "Fira Code:h16"

-- better cursor visibility
vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
