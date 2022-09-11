-- Global options
vim.opt.ruler = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 99
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.showmode = false -- Current mode already shown in Lightline
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Window options
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.colorcolumn = '88'

-- Enable mouse for scrolling only
vim.opt.mouse = 'a'
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
