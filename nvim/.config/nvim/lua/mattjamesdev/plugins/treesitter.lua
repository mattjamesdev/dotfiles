return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function ()
    require('nvim-treesitter.configs').setup({
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
      indent = {
        enable = true,
      },
    })
  end,
}
