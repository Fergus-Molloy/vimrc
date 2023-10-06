return {
    'nvimdev/lspsaga.nvim',
    opts = {},
    cmd  = "Lspsaga",
    keys = {
        { '<leader>ca', '<CMD>Lspsaga code_action<CR>', desc = "Code Actions" },
        { '<leader>rn', '<CMD>Lspsaga rename<CR>',      desc = "Rename" },
        -- See `:help K` for why this keymap
        { 'K',          '<CMD>Lspsaga hover_doc<CR>',   desc = "Hover Documentation" },
        { '<C-K>',      vim.lsp.buf.hover,              desc = "Hover Documentation 2" },
        --nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    }
}
