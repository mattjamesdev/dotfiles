require('telescope').setup({
	
})

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files', opts)
