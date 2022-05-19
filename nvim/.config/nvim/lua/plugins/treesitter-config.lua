-- Configuration for Treesitter
require'nvim-treesitter.configs'.setup {
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
        "html"
    },

    -- Syntax highlighting
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
}
