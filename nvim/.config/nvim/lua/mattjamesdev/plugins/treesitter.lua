return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  ensure_installed = {
    "python",
    "r",
    "latex",
    "vim",
    "lua",
    "bash",
    "regex",
    "json",
    "javascript",
    "html",
    "css",
    "typescript",
    "tsx",
  },

  -- Syntax highlighting
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}
