--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
--

-- General config
require('mattjamesdev.options')

-- Plugins
require('mattjamesdev.lazy_init') -- Lazy.nvim

-- Keymaps
require('mattjamesdev.keymaps')

-- Highlights
require('mattjamesdev.highlights')

-- Autocommands
require('mattjamesdev.autocommands')

-- Colourscheme
vim.opt.background = 'dark'
vim.cmd.colorscheme('tundra')
