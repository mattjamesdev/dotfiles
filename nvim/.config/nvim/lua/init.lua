--  _       _ _     _             
-- (_)_ __ (_) |_  | |_   _  __ _ 
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
--                                
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
vim.wo.colorcolumn = 80

vim.bo.expandtab = true
vim.bo.shiftwidth = true
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.smartindent = true

-- Enable mouse for scrolling only
vim.o.mouse = 'a'
vim.api.nvim_set_keymap('n', '<LeftMouse>', '<nop>')
vim.api.nvim_set_keymap('i', '<LeftMouse>', '<nop>')
vim.api.nvim_set_keymap('v', '<LeftMouse>', '<nop>')
vim.api.nvim_set_keymap('n', '<2-LeftMouse>', '<nop>')
vim.api.nvim_set_keymap('i', '<2-LeftMouse>', '<nop>')
vim.api.nvim_set_keymap('v', '<2-LeftMouse>', '<nop>')


-- ================================= Remaps ===================================
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})
