return {
  -- auto formatter
  'stevearc/conform.nvim',
  event = 'LspAttach',
  opts = {
    formatters_by_ft = {
      rust = { 'rustfmt' },
      lua = { 'stylua' },
      nix = { 'nixpkgs-fmt' },
    },
    format_on_save = {
      timeout = 500,
      lsp_fallback = true,
    },
  },
}
