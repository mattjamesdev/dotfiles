-- My functions
local f = require("mattjamesdev.functions")


-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


-- Enable hlsearch when searching, then disable when entering Insert mode
local incsearch_highlight = augroup('vimrc-incsearch-highlight', {})

autocmd({ 'CmdlineEnter' }, {
  pattern = { '/,\\?' },
  command = 'set hlsearch',
  group = incsearch_highlight
})
autocmd({ 'InsertEnter' }, {
  pattern = '*',
  command = 'set nohlsearch',
  group = incsearch_highlight
})


-- Automatically close nvim-tree if it is the last buffer remaining
autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end
})


-- Highlight yanked text
local yank_group = augroup("HighlightYank", {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})


-- Disable winbar in certain window types (startup screen, NvimTree, etc.)
-- https://www.youtube.com/watch?v=Rl7Tg3A0rAE
autocmd({"VimEnter", "BufWinEnter", "BufFilePost"}, {
  callback = function()
    local winbar_filetype_exclude = {
      "help",
      "NvimTree",
      "packer",
      "alpha",
      "", -- Some floating windows have and empty string as their "filetype"
    }

    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
      vim.opt_local.winbar = nil
    elseif vim.bo.filetype == "qf" then
      vim.opt_local.winbar = " Quickfix menu"
    else
      vim.opt_local.winbar = f.create_winbar()
    end
  end
})
