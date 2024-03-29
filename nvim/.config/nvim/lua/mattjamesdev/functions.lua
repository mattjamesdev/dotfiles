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

-- Get the colour (hex value) of a highlight group's layer
-- https://www.reddit.com/r/neovim/comments/oxddk9/how_do_i_get_the_value_from_a_highlight_group/
M.get_hl_val = function(name, layer)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(name)), layer .. "#")
end

-- Apply a table of highlights, as defined in lua/mattjamesdev/highlights
-- Inspired by NvChad's base46 theme (https://github.com/NvChad/base46/tree/master/lua/base46/integrations)
M.load_highlight = function(group)
  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

-- Get nvim-web-devicons if they are present
local devicons_present, devicons = pcall(require, "nvim-web-devicons")

-- Create the winbar display
-- https://www.youtube.com/watch?v=Rl7Tg3A0rAE
M.create_winbar = function ()
  -- Get the file name and extension
  local filename = vim.fn.expand("%:t")
  local extension = vim.fn.expand("%:e")
  -- Check to see if the file actually has an extension
  local default = extension == ""
  -- If we have nvim-web-devicons, use them to pretty up the winbar
  if devicons_present then
    local file_icon, file_colour = devicons.get_icon_color(filename, extension, {default = default})
    local hl_group = "FileIconColor" .. extension
    vim.api.nvim_set_hl(0, hl_group, { fg = file_colour })
    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%* " .. "%#LineNr#" .. filename .. "%* "
  else
    return " %#LineNr#" .. filename "#* "
  end
end

return M
