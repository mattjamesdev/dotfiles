require('mattjamesdev.plugins.lsp.cmp')
require('mattjamesdev.plugins.lsp.mason')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
    desc = 'Go to definition',
    unpack(bufopts)
  })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>lc', vim.lsp.buf.code_action, {
    desc = 'Code actions', unpack(bufopts)
  })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>lf', vim.lsp.buf.format, {
    desc = 'Format file',
    unpack(bufopts)
  })
end

require('lspconfig').pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      telemetry = { enable = false },
    }
  }
}

require('lspconfig').tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end,
  root_dir = function() return vim.loop.cwd() end,
}

require('lspconfig').cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require('lspconfig').emmet_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
