return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {
      { '<leader>gb', '<cmd>Gitsigns blame<cr>', desc = 'Show blame for current buffer' },
      { '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Preview hunk' },
    },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
