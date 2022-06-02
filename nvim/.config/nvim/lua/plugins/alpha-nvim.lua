local alpha = require('alpha')

local dashboard = require('alpha.themes.dashboard')

local function footer()
	local plugins = #vim.tbl_keys(packer_plugins)
	local v = vim.version()
	return string.format('Neovim v%d.%d.%d | Loaded %d plugins', v.major, v.minor, v.patch, plugins)
end

-- print(packer_plugins)

dashboard.section.buttons.val = {
  dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('SPC f f', '  Find file', '<cmd>Telescope find_files<CR>'),
  dashboard.button('SPC f g', '  Live grep', '<cmd>Telescope live_grep<CR>'),
  dashboard.button('SPC c', '   Select colourscheme', '<cmd>Telescope colorscheme<CR>'),
	dashboard.button('SPC f d', '  Configure', '<cmd>cd ~/.config/nvim<CR><cmd>e init.lua<CR>'),
  dashboard.button('q', '⎋  Quit', '<cmd>qa<CR>')
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)

--   New file                                      e

--   Find file                               SPC f f

--   Recently opened files                   SPC f h

--   Frecency/MRU                            SPC f r

--   Find word                               SPC f g

--   Jump to bookmarks                       SPC f m

--   Open last session                       SPC s l
