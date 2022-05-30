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

-- ================================= Remaps ===================================
-- Move selected lines up/down with J/K in visual line mode
-- https://www.youtube.com/watch?v=QN4fuSsWTbA - at 10:11
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })

-- Add quotes/brackets around visual selection
vim.api.nvim_set_keymap('v', '"', '<esc>`>a"<esc>`<i"<esc>', { noremap = true })
vim.api.nvim_set_keymap('v', "'", "<esc>`>a'<esc>`<i'<esc>", { noremap = true })
vim.api.nvim_set_keymap('v', '(', '<esc>`>a)<esc>`<i(<esc>', { noremap = true })
vim.api.nvim_set_keymap('v', '[', '<esc>`>a]<esc>`<i[<esc>', { noremap = true })
vim.api.nvim_set_keymap('v', '{', '<esc>`>a}<esc>`<i{<esc>', { noremap = true })

-- Reselect after indenting
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })

----------------------------------- Leaders -----------------------------------
vim.g.mapleader = ' '

------------------------------- Neovim Python ---------------------------------
vim.g.python3_host_prog = '~/.pyenv/versions/3.9.5/envs/neovim/bin/python'

----------------------------------- Plugins -----------------------------------
-- Load plugins (packer)
require('packer_init')
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

-- Hide current mode (already shown in Lightline)
vim.o.showmode = false

-------------------------------- Autocommands ---------------------------------
-- Enable hlsearch when searching, then disable when entering Insert mode
local incsearch_highlight = vim.api.nvim_create_augroup('vimrc-incsearch-highlight', {})
vim.api.nvim_create_autocmd({ 'CmdlineEnter' }, {
  pattern = { '/,\\?' },
  command = 'set hlsearch',
  group = incsearch_highlight
})
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = '*',
  command = 'set nohlsearch',
  group = incsearch_highlight
})