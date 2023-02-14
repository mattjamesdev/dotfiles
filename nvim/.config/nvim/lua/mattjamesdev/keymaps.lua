local opts = { noremap = true, silent = true }
local f = require('mattjamesdev.functions')

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
vim.keymap.set('v', 'Q', '<esc>`>a"<esc>`<i"<esc>', opts)
vim.keymap.set('v', "'", "<esc>`>a'<esc>`<i'<esc>", opts)
vim.keymap.set('v', '(', '<esc>`>a)<esc>`<i(<esc>', opts)
vim.keymap.set('v', '[', '<esc>`>a]<esc>`<i[<esc>', opts)
vim.keymap.set('v', '{', '<esc>`>a}<esc>`<i{<esc>', opts)

-- Reselect after indenting
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

-- Yank to clipboard with <leader>y
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', opts)

-- Smart dd
vim.keymap.set('n', 'dd', f.smart_dd, {
  desc = 'Delete line',
  expr = true,
  unpack(opts)
})

-- Smart visual d
vim.keymap.set('v', 'd', f.smart_visual_d, {
  desc = 'Delete',
  expr = true,
  unpack(opts)
})

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
  desc = 'Show float diagnostics',
  unpack(opts) -- For Lua >5.2, use "table.unpack"
})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
  desc = 'Next diagnostic',
  unpack(opts)
})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = 'Previous diagnostic',
  unpack(opts)
})

-- Buffers (including Bufferline)
vim.keymap.set('n', '<leader>bd', ':bd<CR>', {
  desc = 'Close buffer',
  unpack(opts)
})
vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', {
  desc = 'Previous BufferLine buffer',
  unpack(opts)
})
vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', {
  desc = 'Next BufferLine buffer',
  unpack(opts)
})

-- Wrapper function to pass arguments to a function used in a keymap
-- https://www.reddit.com/r/neovim/comments/sjiwox/comment/hvf1r02/?utm_source=share&utm_medium=web2x&context=3
local wrap = function(func, ...)
  local args = { ... }
  return function()
    func(unpack(args))
  end
end

-- -- ToggleTerm
-- vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=horizontal<CR>', {
--   desc = 'Horizontal term',
--   unpack(opts)
-- })
-- vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', {
--   desc = 'Float term',
--   unpack(opts)
-- })
