--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
--

---------------------------------- General config -------------------------------------
-- Global options
vim.o.ruler = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 99
vim.o.laststatus = 3
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.showmode = false -- Current mode already shown in Lightline

-- Window options
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.colorcolumn = '88'

-- Enable mouse for scrolling only
vim.o.mouse = 'a'
vim.keymap.set('n', '<LeftMouse>', '<nop>', {})
vim.keymap.set('i', '<LeftMouse>', '<nop>', {})
vim.keymap.set('v', '<LeftMouse>', '<nop>', {})
vim.keymap.set('n', '<2-LeftMouse>', '<nop>', {})
vim.keymap.set('i', '<2-LeftMouse>', '<nop>', {})
vim.keymap.set('v', '<2-LeftMouse>', '<nop>', {})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

----------------------------------- Neovim Python -------------------------------------
PYTHON_PATH = vim.fn.stdpath('data') .. '/python-venv'
vim.g.python3_host_prog = PYTHON_PATH .. '/bin/python'

-------------------------------------- Plugins ----------------------------------------
-- Load plugins (packer)
require('packer_init')

-- Plugin configs
require('plugins.colourscheme')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.treesitter')
require('plugins.nvim-lsp')
require('plugins.lspsaga')
require('plugins.nvim-autopairs')
require('plugins.toggleterm')
require('plugins.bufferline')
--require('plugins.null-ls')
require('plugins.efm-langserver')
require('plugins.alpha-nvim')
require('plugins.which-key')
require('plugins.neodim')
require('plugins.nvim-notify')

-------------------------------------- Keymaps ----------------------------------------
require('keymaps')

----------------------------------- Autocommands --------------------------------------
require('autocommands')
