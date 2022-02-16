-- Configuration for nvim-lsp-installer (copied from the GitHub page)
local lsp_installer = require("nvim-lsp-installer")

local function on_attach(client, bufnr)
    -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
end

local enhance_server_opts = {
  -- Provide settings that should only apply to the "eslintls" server
  ["sumneko_lua"] = function(opts)
    opts.settings = {
        Lua = {
            diagnostics = {
                disable = vim.split('trailing-space', ", "),
                globals = vim.split('vim', ", "),
            }
        }
    }
  end,
}

-- Register a handler that will be called for each installed server when it's 
-- ready (i.e. when installation is finished or if the server is already 
-- installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    if enhance_server_opts[server.name] then
        enhance_server_opts[server.name](opts)
    end
    server:setup(opts)
end)
