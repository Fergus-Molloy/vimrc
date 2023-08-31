# vimrc

loosely based on https://github.com/nvim-lua/kickstart.nvim

## structure
init.lua -- entrypoint
lua/keymaps.lua -- basic keymaps, not related to plugin specific keymaps
lua/options.lua -- general option setting
lua/plugins/init.lua -- all plugins are installed and configuration is loaded from here
lua/plugins/autoformat.lua -- autoformat code taken from kickstart.nvim
lua/plugins/debug.lua -- dap config taken from kickstart.nvim
lua/plugins/lsp.lua -- lsp and cmp configuration including keybinds
lua/plugins/config/* -- other plugin configuration to be loaded outside of lazy
