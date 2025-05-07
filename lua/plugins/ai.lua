local file = vim.fn.glob '~/projects/cdy-nvim'
if file ~= '' then
  return {
    {
      'projects/cdy-nvim',
      dir = '~/projects/cdy-nvim',
      cmd = { 'CodyChat', 'CodyAsk', 'CodySetModel', 'CodyToggleFileContext', 'CodyToggleRepoContext', 'CodyNew' },
      dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
      },
      keys = {
        { '<leader>cc', '<cmd>CodyChat<cr>', desc = 'Open cody chat' },
        { '<leader>cn', '<cmd>CodyNew<cr>', desc = 'Start new cody chat' },
      },
      dev = true,
      opts = {
        include_file = true,
        include_repo = true,
      },
    },
  }
else
  return {
    {
      'olimorris/codecompanion.nvim',
      lazy = false,
      opts = {
        strategies = {
          chat = {
            adapter = 'anthropic',
          },
          inline = {
            adapter = 'anthropic',
          },
        },
      },
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
      },
    },
    -- {
    --   'pasky/claude.vim',
    --   lazy = false,
    --   config = function()
    --     local api_key = os.getenv 'ANTHROPIC_API_KEY'
    --     vim.g.claude_api_key = api_key
    --     vim.cmd [[
    --       let g:claude_map_implement = "<Leader>ci"
    --       let g:claude_map_open_chat = "<Leader>cc"
    --       let g:claude_map_send_chat_message = "<C-]>"
    --       let g:claude_map_cancel_response = "<Leader>cx"
    --     ]]
    --   end,
    -- },
  }
end
