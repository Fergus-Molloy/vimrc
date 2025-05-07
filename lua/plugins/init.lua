return {
  -- NOTE: [ THEMES ]
  -- {
  -- 'yorumicolors/yorumi.nvim',
  -- },
  -- {
  --  'savq/melange-nvim',
  -- },
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   config = function()
  --     vim.g.gruvbox_material_background = 'medium'
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.cmd 'colorscheme gruvbox-material'
  --   end,
  -- },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    config = function()
      vim.cmd 'colorscheme kanagawa'
    end,
  },

  { -- Git integrations
    'tpope/vim-fugitive',
    cmd = { 'G', 'Git' },
    keys = {
      { '<leader>gg', '<cmd>Git<cr>', desc = 'Open git fugitive' },
    },
  },

  { -- traverse undotree
    'mbbill/undotree',
    keys = {
      { '<leader>fu', '<cmd>UndotreeToggle<cr>', desc = 'Toggle undotree' },
    },
  },

  { -- better f motions
    'justinmk/vim-sneak',
    keys = {
      { 's', '<Plug>Sneak_s', desc = 'Sneak forward' },
      { 'S', '<Plug>Sneak_S', desc = 'Sneak backwards' },
    },
  },

  { -- surround motions
    'kylechui/nvim-surround',
    opts = {},
    event = 'VeryLazy',
  },

  { -- put cursor where you left it
    'farmergreg/vim-lastplace',
    lazy = false,
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  {
    'nmac427/guess-indent.nvim',
    Event = 'BufEnter',
    opts = {},
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'j-hui/fidget.nvim',
    version = '*',
    opts = {},
    lazy = false,
  },
}
