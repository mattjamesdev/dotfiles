-- efm-langserver setup
require("lspconfig").efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {'python'},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {
                {formatCommand = "black -", formatStdin = true}
            }
        }
    }
}
