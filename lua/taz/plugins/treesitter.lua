return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local parsers = {
        'bash',
        'c',
        'cpp',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'xml',
      }
      require('nvim-treesitter').install(parsers)

      -- Highlighting and folding are managed by nvim
      -- Indentation is managed by nvim-treesitter so use autocmd to enable
      vim.api.nvim_create_autocmd('FileType', {
        pattern = parsers, -- Might cause issues when parser name != filetype
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.bo.indentkeys = "0{,0},0),0],0\\,,!^F,o,O,e" -- auto indent when these keys are pressed
        end,
      })
    end,
  },
}
