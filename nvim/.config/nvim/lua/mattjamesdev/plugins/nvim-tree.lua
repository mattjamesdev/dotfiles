return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons'
  },
  cmd = { 'NvimTreeOpen', 'NvimTreeToggle' },
  opts = {
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
  }
}
