--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
--

-- ================================== Sets ====================================
vim.o.ruler = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 99

vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.colorcolumn = '80'

vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.smartindent = true

-- Enable mouse for scrolling only
vim.o.mouse = 'a'
vim.api.nvim_set_keymap('n', '<LeftMouse>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<LeftMouse>', '<nop>', {})
vim.api.nvim_set_keymap('v', '<LeftMouse>', '<nop>', {})
vim.api.nvim_set_keymap('n', '<2-LeftMouse>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<2-LeftMouse>', '<nop>', {})
vim.api.nvim_set_keymap('v', '<2-LeftMouse>', '<nop>', {})

-- Highlights
vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 'grey' })
vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 240 })
vim.api.nvim_set_hl(0, 'CursorLineNR', { cterm = nil, ctermbg = 240 })


------------------------------- Neovim Python ---------------------------------
vim.g.python3_host_prog = '~/.pyenv/versions/3.9.5/envs/neovim/bin/python'

----------------------------------- Plugins -----------------------------------
-- Load plugins (packer)
require('packer_init')
require('plugin.packer_compiled')

require('plugins.colourscheme')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.treesitter')
require('plugins.nvim-lsp')
require('plugins.nvim-autopairs')
require('plugins.toggleterm')
require('plugins.bufferline')
--require('plugins.null-ls')
require('plugins.efm-langserver')
require('plugins.alpha-nvim')
require('plugins.which-key')

----------------------------------- Keymaps -----------------------------------
require('keymaps')

-- Hide current mode (already shown in Lightline)
vim.o.showmode = false

-- Autocommands
require('autocommands')
