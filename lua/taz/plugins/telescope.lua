return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'BurntSushi/ripgrep',
      'nvim-lua/plenary.nvim',
      'stevearc/oil.nvim',
      'jvgrootveld/telescope-zoxide',
      'andrewberty/telescope-themes',
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      local oil = require 'oil'
      local z_utils = require 'telescope._extensions.zoxide.utils'
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          mappings = {
            i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          },
        },
        pickers = {},
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {
              winblend = 10,
            },
          },
          ['zoxide'] = {
            prompt_title = '[ Walking on the shoulders of TJ ]',
            mappings = {
              default = {
                after_action = function(selection)
                  print('Update to (' .. selection.z_score .. ') ' .. selection.path)
                  oil.open(selection.path)
                end,
              },
              ['<C-s>'] = {
                before_action = function(selection)
                  print 'before C-s'
                end,
                action = function(selection)
                  vim.cmd.edit(selection.path)
                end,
              },
              -- Opens the selected entry in a new split
              ['<C-q>'] = { action = z_utils.create_basic_command 'split' },
            },
          },
          ['themes'] = {
            layout_config = {
              horizontal = {
                width = 0.8,
                height = 0.7,
              },
            },

            enable_previewer = true,

            persist = {
              enable = true,
            },
            mappings = {},
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'zoxide')
      pcall(require('telescope').load_extension 'themes')

      -- [[ KEYBINDS ]]
      --
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      local pickers = require 'taz.pickers.telescopePickers'
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = '[F]ind [T]elescope' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
      vim.keymap.set('n', '<leader>fw', function()
        pickers.prettyGrepPicker { picker = 'grep_string' }
      end, { desc = '[F]ind current [W]ord' })
      vim.keymap.set('n', '<leader>fg', function()
        pickers.prettyGrepPicker { picker = 'live_grep' }
      end, { desc = '[F]ind by [G]rep' })
      vim.keymap.set('n', '<leader>ff', function()
        pickers.prettyFilesPicker { picker = 'find_files' }
      end, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>f.', function()
        pickers.prettyFilesPicker { picker = 'oldfiles' }
      end, { desc = '[F]ind Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', pickers.prettyBuffersPicker, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>fs', function()
        pickers.prettyDocumentSymbols()
      end, { desc = '[s] Find Document Symbols' })
      vim.keymap.set('n', '<leader>ws', function()
        pickers.prettyWorkspaceSymbols()
      end, { desc = '[s] Find workspace symbols' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      -- Extension keybinds
      vim.keymap.set('n', '<leader>cd', require('telescope').extensions.zoxide.list)
      vim.keymap.set('n', '<leader>kt', ':Telescope themes<CR>', { noremap = true, silent = true, desc = 'Theme Switcher' })
    end,
  },
}
