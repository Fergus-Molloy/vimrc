-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
return {
  -- Fuzzy Finder (files, lsp, etc)
  -- TODO: add all keys here
  'nvim-telescope/telescope.nvim',
  event = 'LspAttach',
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
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
  },
  config = function()
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
  keys = {
    {
      '<c-t>h',
      function()
        require('telescope.builtin').colorscheme()
      end,
      desc = 'Change [Th]eme',
    },
    {
      '<leader>b',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = '[b] Find existing buffers',
    },
    {
      '<leader>gf',
      function()
        require('telescope.builtin').git_files()
      end,
      desc = 'Find [G]it [F]iles',
    },
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fw',
      function()
        require('telescope.builtin').grep_string()
      end,
      desc = '[F]ind current [W]ord',
    },
    {
      '<leader>fg',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = '[F]ind by [G]rep',
    },
    {
      '<leader>fd',
      function()
        require('telescope.builtin').diagnostics()
      end,
      desc = '[F]ind [D]iagnostics',
    },
    {
      'gr',
      function()
        require('telescope.builtin').lsp_references()
      end,
      desc = '[G]oto [R]eferences',
    },
    {
      '<leader>ds',
      function()
        require('telescope.builtin').lsp_document_symbols()
      end,
      desc = '[D]ocument [S]ymbols',
    },
    {
      '<leader>ws',
      function()
        require('telescope.builtin').lsp_dynamic_workspace_symbols()
      end,
      desc = '[W]orkspace [S]ymbols',
    },
  },
}
