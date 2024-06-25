-- Install package manager
return {
  {
    -- git commands in vim
    'tpope/vim-fugitive',
    cmd = 'Git',
    keys = {
      { '<leader>gf', '<cmd>Git<cr>', desc = 'Open git preview' },
    },
  },

  {
    -- lazygit in vim
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open lazy git' },
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
    event = 'LspAttach',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', event = 'VeryLazy', opts = {} },

  {
    -- colorscheme
    'sainnhe/gruvbox-material',
    lazy = false, -- load this first
    priority = 1000,
    config = function()
      vim.cmd [[ colorscheme gruvbox-material ]]
    end,
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPost',
    main = 'ibl',
    opts = {
      scope = {
        enabled = true,
        highlight = { 'Function', 'Label', 'Keyword', 'Namespace' },
      },
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, event = 'BufEnter' },

  {
    -- toggle-able terminal
    'akinsho/toggleterm.nvim',
    version = '~2.7',
    opts = {
      open_mapping = [[<C-t>]],
      shade_terminals = false,
    },
    keys = { '<c-t>' },
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
    event = 'VeryLazy',
  },

  {
    -- file manipulation in a vim buffer
    'stevearc/oil.nvim',
    opts = {},
    cmd = { 'Oil' },
    keys = { { '<c-f>o', '<cmd>Oil --float<cr>', desc = '[F]older [O]pen' } },
  },

  {
    -- surround plugin
    'tpope/vim-surround',
  },

  require 'plugins.lualine',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.lspsaga',
  require 'plugins.conform',

  -- require 'plugins.autoformat',
}
