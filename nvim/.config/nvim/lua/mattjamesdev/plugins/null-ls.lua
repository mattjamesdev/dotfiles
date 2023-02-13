local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

require('null-ls').setup({
  sources = {
    -- require("null-ls").builtins.formatting.sumneko_lua,
    -- require("null-ls").builtins.diagnostics.eslint,
    -- require("null-ls").builtins.completion.spell,
    require('null-ls').builtins.formatting.black,
    require('null-ls').builtins.formatting.prettier,
  },
  -- Enable format on save
  -- on_attach = function(client, bufnr)
  --   if client.supports_method('textDocument/formatting') then
  --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd('BufWritePre', {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         -- on 0.8, you should use vim.lsp.buf.format({bufnr = bufnr}) instead
  --         vim.lsp.buf.formatting_sync()
  --       end,
  --     })
  --   end
  -- end,
})
