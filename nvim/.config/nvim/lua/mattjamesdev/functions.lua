local M = {}

-- Smart dd: does not yank if the line is only whitespace or empty
-- (u/Alleyria's comment in https://www.reddit.com/r/neovim/comments/w0jzzv/smart_dd/)
M.smart_dd = function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end

-- Smart visual d: does not yank if selection is only whitespace or empty
-- (u/mknurs's comment in https://www.reddit.com/r/neovim/comments/w0jzzv/smart_dd/)
M.smart_visual_d = function()
  local l, c = unpack(vim.api.nvim_win_get_cursor(0))
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, l-1, l, true)) do
    if line:match("^%s*$") then
      return '"_d'
    end
  end
  return "d"
end

return M
