return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'ibhagwan/fzf-lua',
    },
    keys = {
      {
        '<leader>i',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'add current buffer to harpoon',
      },
      {
        '<leader>u',
        function()
          local harpoon = require 'harpoon'
          local harpoon_files = harpoon:list()
          local file_paths = {}

          for _, item in ipairs(harpoon_files.items) do
            if item.value ~= nil or item.value ~= '' then
              table.insert(file_paths, item.value)
            end
          end

          require('fzf-lua').fzf_exec(file_paths, {
            fn_transform = function(x)
              return require('fzf-lua').make_entry.file(x, { file_icons = true, color_icons = true })
            end,
            actions = {
              ['default'] = require('fzf-lua').actions.file_edit,
              ['ctrl-x'] = function(selected, _)
                for i, item in ipairs(harpoon_files.items) do
                  if item.value == selected[1] then
                    harpoon:list():remove_at(i)
                    return
                  end
                end
                vim.notify('Could not find item ' .. selected[1] .. ' in harpoon list', vim.log.levels.WARN)
              end,
            },
          })
        end,
        desc = 'Find in harpoon list',
      },
      {
        '<leader>fy',
        function()
          local harpoon = require 'harpoon'
          local harpoon_files = harpoon:list 'yeet'
          local file_paths = {}

          for _, item in ipairs(harpoon_files.items) do
            if item.value ~= nil or item.value ~= '' then
              table.insert(file_paths, item.value)
            end
          end

          require('fzf-lua').fzf_exec(file_paths, {
            actions = {
              ['default'] = function(selection)
                require('yeet').execute(selection[1])
              end,
              ['ctrl-x'] = function(selected, _)
                for i, item in ipairs(harpoon_files.items) do
                  if item.value == selected[1] then
                    harpoon:list('yeet'):remove_at(i)
                    return
                  end
                end
                vim.notify('Could not find item ' .. selected[1] .. ' in harpoon list [yeet]', vim.log.levels.WARN)
              end,
            },
          })
        end,
        desc = 'Find yeet',
      },
      {
        '<leader><BS>',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list 'yeet')
        end,
        desc = 'Open yeet cache',
      },
    },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {
        yeet = {
          select = function(list_item, _, _)
            require('yeet').execute(list_item.value)
          end,
        },
      }
    end,
  },
}
