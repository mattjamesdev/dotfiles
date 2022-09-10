-- Config for some colourschemes
-- Gruvbox
require('gruvbox').setup({
  -- overrides = {
  --   Normal = { bg = "none" },
  -- }
})

-- Tundra
require('nvim-tundra').setup({
  transparent_background = false,
})

-- Apply the colour scheme
vim.opt.background = 'dark'

-- vim.cmd('colorscheme coal')
-- vim.cmd('colorscheme gruvbox')
vim.cmd('colorscheme tundra')
-- vim.cmd('colorscheme vscode')
