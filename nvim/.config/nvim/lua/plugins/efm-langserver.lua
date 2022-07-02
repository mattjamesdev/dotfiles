-- efm-langserver setup
require("lspconfig").efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {'python'},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {
                {formatCommand = PYTHON_PATH .. "/bin/black -", formatStdin = true}
            }
        }
    }
}
