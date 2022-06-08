local opts = { noremap = true, silent = true }

-- Map leader key to space
vim.keymap.set('n', '<Space>', '<nop>', opts)
vim.g.mapleader = ' '

-- Better window movement
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Move selected lines up/down with J/K in visual line mode
-- https://www.youtube.com/watch?v=QN4fuSsWTbA - at 10:11
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Add quotes/brackets around visual selection
vim.keymap.set('v', '"', '<esc>`>a"<esc>`<i"<esc>', opts)
vim.keymap.set('v', "'", "<esc>`>a'<esc>`<i'<esc>", opts)
vim.keymap.set('v', '(', '<esc>`>a)<esc>`<i(<esc>', opts)
vim.keymap.set('v', '[', '<esc>`>a]<esc>`<i[<esc>', opts)
vim.keymap.set('v', '{', '<esc>`>a}<esc>`<i{<esc>', opts)

-- Reselect after indenting
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

-- Diagnostics
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', {
	desc = 'Show float diagnostics',
	table.unpack(opts)
})

-- Formatting
vim.keymap.set('n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>',	{
	desc = 'Format file',
	table.unpack(opts)
})

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { 
	desc = 'Find files (Telescope)', 
	table.unpack(opts) 
})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {
	desc = 'Find buffers (Telescope)',
	table.unpack(opts)
})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {
	desc = 'Live grep (Telescope)',
	table.unpack(opts)
})
