return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'rafamadriz/friendly-snippets',
    'echasnovski/mini.snippets',
    'fang2hou/blink-copilot',
    'folke/lazydev.nvim',
    { 'L3MON4D3/LuaSnip', version = 'v2.*', opts = {} },
  },

  -- use a release tag to download pre-built binaries
  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      menu = { border = 'single' },
      documentation = { auto_show = true, auto_show_delay_ms = 100, window = { border = 'single' } },
    },
    signature = { enabled = true, window = { border = 'single' } },
    keymap = {
      preset = 'default',
      ['<C-space>'] = false,
      ['<C-s>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = {},
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true,
        },
      },
    },

    snippets = { preset = 'luasnip' },
    -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    -- snippets = {  'luasnip'  },
  },
  opts_extend = { 'sources.default' },
}
