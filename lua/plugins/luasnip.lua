return {
  {
    'L3MON4D3/LuaSnip',
    ft = { 'go', 'elixir' },
    main = 'luasnip.configs',
    opts = {
      store_selection_keys = '<tab>',
    },
    config = function()
      require('luasnip').add_snippets('go', require 'snippets.go')
      require('luasnip').add_snippets('erlang', require 'snippets.erlang')
      require('luasnip').add_snippets('elixir', require 'snippets.elixir')
    end,
  },
}
