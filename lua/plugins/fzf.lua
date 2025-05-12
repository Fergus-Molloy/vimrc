return {
  {
    'ibhagwan/fzf-lua',
    opts = {},
    keys = {
      {
        '<leader>ff',
        function()
          require('fzf-lua').files()
        end,
        desc = 'Find files',
      },
      {
        '<leader>fw',
        function()
          require('fzf-lua').live_grep_glob { rg_glob = true }
        end,
        desc = 'Find word',
      },
      {
        '<leader>fb',
        function()
          require('fzf-lua').buffers()
        end,
        desc = 'Find buffer',
      },

      -- lsp
      {
        '<leader>gr',
        function()
          require('fzf-lua').lsp_references()
        end,
        desc = 'Find references',
      },
      {
        '<leader>ds',
        function()
          require('fzf-lua').lsp_document_symbols()
        end,
        desc = 'Find document symbols',
      },
      {
        '<leader>dd',
        function()
          require('fzf-lua').diagnostics_document()
        end,
        desc = 'Find document diagnostics',
      },
      {
        '<leader>dw',
        function()
          require('fzf-lua').diagnostics_workspace()
        end,
        desc = 'Find workspace diagnostics',
      },

      -- dap
      {
        '<leader>dc',
        function()
          require('fzf-lua').dap_configurations()
        end,
        desc = 'Run DAP configuration',
      },
      {
        '<leader>dq',
        function()
          require('fzf-lua').dap_commands()
        end,
        desc = 'Send DAP command',
      },
    },
  },
}
