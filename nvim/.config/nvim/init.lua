--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
--

-- General config
require('mattjamesdev.options')

-- Neovim Python
--PYTHON_PATH = vim.fn.stdpath('data') .. '/python-venv'
--vim.g.python3_host_prog = PYTHON_PATH .. '/bin/python'

-- Plugins
require('mattjamesdev.lazy_init') -- Lazy.nvim
require('mattjamesdev.plugins') -- Plugin configs

-- Keymaps
require('mattjamesdev.keymaps')

-- Highlights
require('mattjamesdev.highlights')

-- Autocommands
require('mattjamesdev.autocommands')
