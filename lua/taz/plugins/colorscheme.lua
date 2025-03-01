local catpucccin_overrides = {
  ['vscode_pastel'] = {
    color_overrides = {
      mocha = {
        base = '#121917',
        blue = '#22d3ee',
        green = '#86efac',
        flamingo = '#D6409F',
        lavender = '#DE51A8',
        pink = '#f9a8d4',
        red = '#fda4af',
        maroon = '#f87171',
        mauve = '#D19DFF',
        text = '#E8E2D9',
        sky = '#7ee6fd',
        yellow = '#fde68a',
        rosewater = '#f4c2c2',
        peach = '#fba8c4',
        teal = '#4fd1c5',
      },
    },
  },
  ['pretty'] = {
    highlight_overrides = {
      all = function(colors)
        return {
          CurSearch = { bg = colors.sky },
          IncSearch = { bg = colors.sky },
          CursorLineNr = { fg = colors.blue, style = { 'bold' } },
          DashboardFooter = { fg = colors.overlay0 },
          TreesitterContextBottom = { style = {} },
          WinSeparator = { fg = colors.overlay0, style = { 'bold' } },
          ['@markup.italic'] = { fg = colors.blue, style = { 'italic' } },
          ['@markup.strong'] = { fg = colors.blue, style = { 'bold' } },
          Headline = { style = { 'bold' } },
          Headline1 = { fg = colors.blue, style = { 'bold' } },
          Headline2 = { fg = colors.pink, style = { 'bold' } },
          Headline3 = { fg = colors.lavender, style = { 'bold' } },
          Headline4 = { fg = colors.green, style = { 'bold' } },
          Headline5 = { fg = colors.peach, style = { 'bold' } },
          Headline6 = { fg = colors.flamingo, style = { 'bold' } },
          rainbow1 = { fg = colors.blue, style = { 'bold' } },
          rainbow2 = { fg = colors.pink, style = { 'bold' } },
          rainbow3 = { fg = colors.lavender, style = { 'bold' } },
          rainbow4 = { fg = colors.green, style = { 'bold' } },
          rainbow5 = { fg = colors.peach, style = { 'bold' } },
          rainbow6 = { fg = colors.flamingo, style = { 'bold' } },
        }
      end,
    },
    color_overrides = {
      mocha = {
        rosewater = '#F5B8AB',
        flamingo = '#F29D9D',
        pink = '#AD6FF7',
        mauve = '#FF8F40',
        red = '#E66767',
        maroon = '#EB788B',
        peach = '#FAB770',
        yellow = '#FACA64',
        green = '#70CF67',
        teal = '#4CD4BD',
        sky = '#61BDFF',
        sapphire = '#4BA8FA',
        blue = '#00BFFF',
        lavender = '#00BBCC',
        text = '#C1C9E6',
        subtext1 = '#A3AAC2',
        subtext0 = '#8E94AB',
        overlay2 = '#7D8296',
        overlay1 = '#676B80',
        overlay0 = '#464957',
        surface2 = '#3A3D4A',
        surface1 = '#2F313D',
        surface0 = '#1D1E29',
        base = '#0b0b12',
        mantle = '#11111a',
        crust = '#191926',
      },
    },
    integrations = {
      telescope = {
        enabled = true,
        style = 'nvchad',
      },
    },
  },
}

choices = { -- colorscheme.
  {
    'nuvic/flexoki-nvim',
    name = 'flexoki',
    priority = 1000,
    config = function()
      require('flexoki').setup {
        variant = 'moon',
        enable = {
          terminal = true,
        },
      }
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('tokyonight').setup {
        transparent = true,
      }
      -- Load the colorscheme here.
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      local opts = { transparent_background = true, show_end_of_buffer = true }
      local overrides = catpucccin_overrides['pretty']
      for k, v in pairs(overrides) do
        opts[k] = v
      end
      require('catppuccin').setup(opts)
    end,
  },
  {
    'vague2k/vague.nvim',
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require('vague').setup {
        transparent = true,
      }
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {
        options = {
          transparent = true,
        },
      }

      -- vim.cmd 'colorscheme github_dark'
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    name = 'vscode-theme',
    config = function()
      require('vscode').setup {
        transparent = true,
        underline_links = true,
      }
    end,
  },
}

return choices
