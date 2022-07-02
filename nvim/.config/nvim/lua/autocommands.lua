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

-- Automatically close nvim-tree if it is the last buffer remaining
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end
})
