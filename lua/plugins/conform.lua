return {
  {
    'stevearc/conform.nvim',
    event = 'LspAttach',
    ft = { 'lua', 'elixir', 'go', 'erlang', 'typescriptreact', 'typescript', 'json' },
    cmd = 'Format',
    keys = {
      {
        '<leader>fm',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        desc = 'Format buffer',
      },
    },
    config = function()
      require('conform').setup {
        notify_on_error = true,
        format_on_save = function(bufnr)
          local cwd = vim.fn.getcwd()
          if cwd:match '/cashout' then
            vim.notify_once('Detected cashout repo, auto format disabled', vim.log.levels.WARN)
            return
          elseif vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout = 500, lsp_fallback = true }
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          go = { 'gofmt', 'goimports' },
          typescript = { 'prettier' },
          typescriptreact = { 'prettier' },
          json = { 'prettier' },
        },
      }
      vim.api.nvim_create_user_command('Format', function(args)
        require('conform').format { async = true, lsp_format = 'fallback' }
      end, { desc = 'Format buffer' })
      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })
      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
  },
}
