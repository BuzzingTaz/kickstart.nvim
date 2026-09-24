local M = {}

M.colors = {
  { name = 'Red', fg = '#E06C75' },
  { name = 'Orange', fg = '#D19A66' },
  { name = 'Yellow', fg = '#E5C07B' },
  { name = 'Green', fg = '#98C379' },
  { name = 'Blue', fg = '#61AFEF' },
  { name = 'Cyan', fg = '#56B6C2' },
  { name = 'Violet', fg = '#C678DD' },
}

M.delimiters = {
  'RainbowDelimiterRed',
  'RainbowDelimiterOrange',
  'RainbowDelimiterYellow',
  'RainbowDelimiterGreen',
  'RainbowDelimiterBlue',
  'RainbowDelimiterCyan',
  'RainbowDelimiterViolet',
}

M.hl_groups = {
  'RainbowRed',
  'RainbowOrange',
  'RainbowYellow',
  'RainbowGreen',
  'RainbowBlue',
  'RainbowCyan',
  'RainbowViolet',
}

function M.setup()
  local function set_highlights()
    for _, c in ipairs(M.colors) do
      vim.api.nvim_set_hl(0, 'Rainbow' .. c.name, { fg = c.fg })
      vim.api.nvim_set_hl(0, 'RainbowDelimiter' .. c.name, { fg = c.fg })
    end
  end

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('RainbowColors', { clear = true }),
    callback = set_highlights,
  })

  set_highlights()
end

M.setup()

return M
