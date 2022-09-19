require('nvim-tree').setup({
  -- auto_close = true,
  hijack_cursor = true,
  view = {
    width = 40,
  },
  renderer = {
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "after",
    }
  }
})
