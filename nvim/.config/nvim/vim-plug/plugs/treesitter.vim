" Configuration for Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "python", 
        "r", 
        "latex", 
        "vim",
        "lua", 
        "bash", 
        "regex", 
        "json"
    },

    -- Syntax highlighting
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
}
EOF