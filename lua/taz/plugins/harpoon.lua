return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    commit = 'bfd649328a7effe4b7c311d39e97059d31144632',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon Add' })

      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon menu' })

      vim.keymap.set('n', '<C-j>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-k>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-l>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-;>', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-K>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-J>', function()
        harpoon:list():next()
      end)

      -- snacks picker configuration for harpoon
      local function toggle_harpoon(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, { text = item.value, file = item.value })
        end

        Snacks.picker {
          title = 'Harpoon',
          items = file_paths,
          format = 'file',
        }
      end

      vim.keymap.set('n', '<leader>e', function()
        toggle_harpoon(harpoon:list())
      end, { desc = 'Open harpoon window' })
    end,
  },
}
