return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
    },
    ft = { 'go' },
    event = 'LspAttach',
    keys = {
      { '<F7>', '<cmd>DapStepInto<cr>' },
      { '<F8>', '<cmd>DapContinue<cr>' },
      { '<F9>', '<cmd>DapStepOver<cr>' },
      {
        '<leader>dt',
        function()
          require('dap-go').debug_test()
        end,
        desc = 'Debug closest go test',
      },
    },
    config = function()
      require('dap-go').setup {
        dap_configurations = {
          {
            type = 'go',
            name = 'Debug COSCT',
            request = 'launch',
            mode = 'test',
            program = '${file}',
            buildFlags = { '-tags=service_legacy' },
            outputMode = 'remote',
          },
        },
      }
    end,
  },
  {
    'weissle/persistent-breakpoints.nvim',
    ft = { 'go' },
    event = 'LspAttach',
    opts = {
      load_breakpoints_event = { 'Lazy' },
    },
    keys = {
      { '<leader>db', '<cmd>PBToggleBreakpoint<cr>', desc = 'Toggle breakpoint' },
      { '<leader>dB', '<cmd>PBSetConditionalBreakpoint<cr>', desc = 'Set conditional breakpoint' },
      { '<leader>db', '<cmd>PBSetLogPoint<cr>', desc = 'Set log point' },
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      require('dapui').setup()

      vim.api.nvim_create_autocmd('BufWinLeave', {
        group = vim.api.nvim_create_augroup 'dapui-extra',
        pattern = '*',
        callback = function(_)
          require('dapui').close()
        end,
      })
    end,
    keys = {
      {
        '<leader>du',
        function()
          require('dapui').toggle()
        end,
        desc = 'toggle dap ui',
      },
      {
        '<leader>de',
        function()
          require('dapui').eval()
        end,
        desc = 'open floating dap eval',
      },
    },
  },
}
