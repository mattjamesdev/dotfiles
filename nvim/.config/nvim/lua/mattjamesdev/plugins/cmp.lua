return {
  {
    'hrsh7th/nvim-cmp', -- The main completion plugin
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip', opt = false},
      {'saadparwaiz1/cmp_luasnip', opt = false},
      -- Sources
      'hrsh7th/cmp-nvim-lsp', -- Source for LSP
      'hrsh7th/cmp-buffer',   -- Source for buffer
      'hrsh7th/cmp-path',     -- Source for paths
      'hrsh7th/cmp-cmdline',  -- Source for commands
      'hrsh7th/cmp-nvim-lsp-signature-help', -- Source for LSP signature help
      'hrsh7th/cmp-nvim-lua', -- Source for Neovim's Lua API
      -- Others
      'onsails/lspkind-nvim', -- VSCode-like pictograms for completion
    },
    config = function()
      -- vim.o.completeopt = 'menu,menuone,noselect'
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local luasnip = require('luasnip')

      cmp.setup({
        completion = {
          completeopt = 'menu,menuone,noselect'
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `LuaSnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<Tab>'] = function(fallback) -- Super tab
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'nvim_lsp_signature_help' }, -- Function signatures
          { name = 'nvim_lua' },
        }, {
          { name = 'buffer' },
        }),

        -- Disable completion if writing a comment
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques
        enabled = function()
          -- Disable completion when writing comments
          local context = require('cmp.config.context')
          -- Keep command mode completion if cursor is in a comment
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture('comment')
              and not context.in_syntax_group('Comment')
          end
        end,

        -- Get VSCode-style pictograms with lspkind-nvim
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 40, -- popup width
            ellipsis_char = "...",
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
            }),

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
              return vim_item
            end
          })
        }
      })

      ----- Extra completion sources -----
      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        mapping = cmp.mapping.preset.cmdline({})
      })
    end
  },
}
