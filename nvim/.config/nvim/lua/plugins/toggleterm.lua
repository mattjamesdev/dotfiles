require('toggleterm').setup({})

-- Function to set keymaps for the terminal
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-n>', function() vim.cmd([[:q]]) end, opts)
end

-- Autocommand to run the above function when entering a ToggleTerm terminal
local toggleterm_group = vim.api.nvim_create_augroup('toggleterm-group', {})
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = 'term://*toggleterm#*',
  command = 'lua set_terminal_keymaps()',
  group = toggleterm_group
})
