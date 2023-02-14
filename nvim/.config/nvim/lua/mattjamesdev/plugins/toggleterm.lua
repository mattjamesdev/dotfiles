return {
  'akinsho/toggleterm.nvim',
  cmd = 'ToggleTerm',
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm direction=horizontal<CR>', desc = 'Horizontal term' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', desc = 'Float term' }
  },
  config = function()
    -- Function to set keymaps for the terminal
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- Default way to exit terminal is <C-\><C-n>
      vim.keymap.set('t', '<C-n>', function() vim.cmd([[:q]]) end, opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    end

    -- Autocommand to run the above function when entering a ToggleTerm terminal
    local toggleterm_group = vim.api.nvim_create_augroup('toggleterm-group', {})
    vim.api.nvim_create_autocmd({ 'TermOpen' }, {
      pattern = 'term://*toggleterm#*',
      callback = set_terminal_keymaps,
      group = toggleterm_group
    })

    require('toggleterm').setup()
  end
}
