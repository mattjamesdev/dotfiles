local opts = { noremap = true, silent = true }

-- Map leader key to space
vim.api.nvim_set_keymap('n', '<Space>', '<nop>', opts)
vim.g.mapleader = ' '

-- Move selected lines up/down with J/K in visual line mode
-- https://www.youtube.com/watch?v=QN4fuSsWTbA - at 10:11
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Add quotes/brackets around visual selection
vim.api.nvim_set_keymap('v', '"', '<esc>`>a"<esc>`<i"<esc>', opts)
vim.api.nvim_set_keymap('v', "'", "<esc>`>a'<esc>`<i'<esc>", opts)
vim.api.nvim_set_keymap('v', '(', '<esc>`>a)<esc>`<i(<esc>', opts)
vim.api.nvim_set_keymap('v', '[', '<esc>`>a]<esc>`<i[<esc>', opts)
vim.api.nvim_set_keymap('v', '{', '<esc>`>a}<esc>`<i{<esc>', opts)

-- Reselect after indenting
vim.api.nvim_set_keymap('v', '>', '>gv', opts)
vim.api.nvim_set_keymap('v', '<', '<gv', opts)

-- Diagnostics
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
