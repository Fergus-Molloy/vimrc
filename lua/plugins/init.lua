local configs = require "plugins.config"
-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- git commands in vim
    {
        'tpope/vim-fugitive',
        cmd = "Git",
        keys = {
            { "<c-g>", "<cmd>Git<cr>", desc = "Open git preview" }
        },
    },

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {}, event = "LspAttach" },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
        },
    },

    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim',  opts = {} },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = configs.gitsigns,
    },

    -- colorscheme
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function() vim.cmd("colorscheme gruvbox-material") end
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'gruvbox-material',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        },
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {}, event = "BufEnter" },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    -- better f motion
    {
        "justinmk/vim-sneak",
        event = "BufEnter",
    },

    {
        'akinsho/toggleterm.nvim',
        version = "~2.7",
        cmd = "ToggleTerm",
        opts = {
            open_mapping = [[<C-t>]],
            shade_terminals = false,
        }
    },

    {
        "ThePrimeagen/harpoon",
        config = {},
        keys = {
            { "<c-a>",           "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Add file to harpoon" },
            { "<leader><space>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "toggle harpoon menu" },
            {
                "<tab>",
                "<cmd>lua require('harpoon.ui').nav_next()<cr>",
                desc =
                "goto next harpoon item"
            },
            {
                "<s-tab>",
                "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
                desc =
                "goto prev harpoon item"
            },
        },
    },

    require 'plugins.autoformat',
}, {})

-- [[ Configure Plugins ]]
require "plugins.treesitter"
require "plugins.telescope"
require "plugins.lsp"
