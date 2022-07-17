-- Config for gruvbox
require('gruvbox').setup({
  overrides = {
    Normal = { bg = "none" },
  }
})

-- Apply the colour scheme
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')
