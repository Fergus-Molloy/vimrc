return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function(_, opts)
      require('obsidian').setup(opts)
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('MarkdownConceal', {}),
        pattern = 'markdown',
        callback = function(ev)
          vim.opt_local.conceallevel = 2
        end,
      })
    end,
    opts = {
      workspaces = {
        {
          name = 'notes',
          path = '~/notes',
        },
      },
    },
  },
}
