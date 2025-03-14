return {
  {
    'stevearc/oil.nvim',
    opts = {
      skip_confirm_for_simple_edits = true,
    },
    keys = {
      { '<leader>fo', '<cmd>Oil --float<cr>', desc = 'Open oil' },
    },
  },
}
