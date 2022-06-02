local alpha = require('alpha')

local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
  dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('SPC f f', '  Find file', '<cmd>Telescope find_files<CR>'),
  dashboard.button('SPC f g', '  Live grep', '<cmd>Telescope live_grep<CR>'),
  dashboard.button('SPC f d', '  Open personal dotfiles', '<cmd>cd ~/.config/nvim<CR><cmd>NvimTreeOpen<CR>'),
  dashboard.button('SPC c', '   Select colourscheme', '<cmd>Telescope colorscheme<CR>'),
  dashboard.button('q', '⎋  Quit', '<cmd>qa<CR>')
}

alpha.setup(dashboard.config)

--   New file                                      e

--   Find file                               SPC f f

--   Recently opened files                   SPC f h

--   Frecency/MRU                            SPC f r

--   Find word                               SPC f g

--   Jump to bookmarks                       SPC f m

--   Open last session                       SPC s l
