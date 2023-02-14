return {
  -- lspconfig
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason.nvim',
      'mason-lspconfig.nvim'
    },
    config = require('mattjamesdev.plugins.lsp.server_config').server_setup
  },

  -- null-ls
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'mason.nvim' },
    opts = function()
      local nls = require('null-ls')
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.black,
          nls.builtins.formatting.prettier,
        }
      }
    end
  },

  -- mason-lspconfig
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        -- Names taken from lspconfig github, NOT Mason
        'lua_ls',     -- lua-language-server
        'pyright',
        'cssls',      -- css-lsp
        'tsserver',   -- typescript-language-server
        'emmet_ls',   -- emmet-ls
        'html',       -- html-lsp
        'tailwindcss' -- tailwindcss-language-server
      }
    }
  },

  -- mason
  {
    'williamboman/mason.nvim',
    cmd = "Mason",
    opts = {
      ensure_installed = {
        'black',
        'stylua',
        'prettier'
      }
    },
    config = function(plugin, opts)
      require('mason').setup(opts)
      local mr = require('mason-registry')
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
  }
}
