local configs = require 'plugins.config'
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
    {
        -- git commands in vim
        'tpope/vim-fugitive',
        cmd = 'Git',
        keys = {
            { '<c-g>', '<cmd>Git<cr>', desc = 'Open git preview' },
        },
    },

    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {}, event = 'LspAttach' },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = "LspAttach",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
        },
    },

    {
        -- auto formatter
        'stevearc/conform.nvim',
        event = "LspAttach",
        opts = {
            formatters_by_ft = {
                rust = { 'rustfmt' },
            },
            format_on_save = {
                timeout = 500,
                lsp_fallback = true,
            },
        },
    },

    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim',  event = "VeryLazy", opts = {} },

    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        event = "BufReadPost",
        opts = configs.gitsigns,
    },

    {
        -- colorscheme
        'sainnhe/gruvbox-material',
        lazy = false, -- load this first
        priority = 1000,
        config = function()
            vim.cmd [[ colorscheme gruvbox-material ]]
        end
    },

    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
    },

    {
        "ribru17/bamboo.nvim",
        priority = 1000,
        opts = {
        },
        -- config = function()
        --     require('bamboo').setup({
        --         style = "vulgaris",
        --     })
        --     require('bamboo').load()
        -- end,
    },
    {
        -- Add indentation guides even on blank lines
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        main = "ibl",
        opts = {
            scope = {
                enabled = true,
                highlight = { "Function", "Label", "Keyword", "Namespace" },
            },
        },
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {},          event = 'BufEnter' },

    {
        -- toggle-able terminal
        'akinsho/toggleterm.nvim',
        version = '~2.7',
        opts = {
            open_mapping = [[<C-t>]],
            shade_terminals = false,
        },
        keys = { "<c-t>" },
    },

    {
        -- switch between often used files easily
        'ThePrimeagen/harpoon',
        config = {},
        keys = {
            {
                '<leader>ha',
                function() require('harpoon.mark').add_file() end,
                desc = 'Add file to harpoon',
            },
            {
                '<leader><space>',
                function() require('harpoon.ui').toggle_quick_menu() end,
                desc = 'toggle harpoon menu',
            },
            {
                '<tab>',
                function() require('harpoon.ui').nav_next() end,
                desc = 'goto next harpoon item',
            },
            {
                '<s-tab>',
                function() require('harpoon.ui').nav_prev() end,
                desc = 'goto prev harpoon item',
            },
        },
    },

    {
        -- open files where i left them
        'farmergreg/vim-lastplace',
    },

    {
        --better f and t
        'justinmk/vim-sneak',
        keys = { 's', 'S' },
    },

    {
        -- make f and t easy to use
        'unblevable/quick-scope',
        event = "VeryLazy",
    },

    {
        -- file manipulation in a vim buffer
        'stevearc/oil.nvim',
        opts = {},
        cmd = { 'Oil' },
        keys = { { '<c-f>o', '<cmd>Oil --float<cr>', desc = "[F]older [O]pen" } },
    },

    {
        -- surround plugin
        'tpope/vim-surround'
    },

    require 'plugins.lualine',
    require 'plugins.telescope',
    require 'plugins.treesitter',
    require 'plugins.lspsaga',

    -- require 'plugins.autoformat',
}, {})

-- [[ Configure Plugins ]]
require 'plugins.lsp'
