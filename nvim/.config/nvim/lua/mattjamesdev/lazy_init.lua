-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Main plugin list
local plugins = require('lazy').setup({

  -- LSP
  'neovim/nvim-lspconfig', -- LSP config
  'jose-elias-alvarez/null-ls.nvim',

  -- Mason
  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim', config = true },

  -- Completion
  'hrsh7th/cmp-nvim-lsp', -- Source for LSP
  'hrsh7th/cmp-buffer',   -- Source for buffer
  'hrsh7th/cmp-path',     -- Source for paths
  'hrsh7th/cmp-cmdline',  -- Source for commands
  {
    'hrsh7th/nvim-cmp', -- The main completion plugin
    dependencies = {
      {'L3MON4D3/LuaSnip', opt = false},
      {'saadparwaiz1/cmp_luasnip', opt = false},
    }
  },
  'hrsh7th/cmp-nvim-lsp-signature-help', -- Source for LSP signature help
  'hrsh7th/cmp-nvim-lua', -- Source for Neovim's Lua API

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' }
    }
  },

  -- Colourschemes
  'Mofiqul/vscode.nvim',
  'ellisonleao/gruvbox.nvim',
  'sam4llis/nvim-tundra',
  'cranberry-clockworks/coal.nvim',

  -- Misc
  { 'numToStr/Comment.nvim', config = true },
  'windwp/nvim-autopairs', -- Automatic bracket and quote pairs
  {
    'goolord/alpha-nvim', -- Startup screen
    dependencies = {
      'kyazdani42/nvim-web-devicons' -- Devicons (requires a nerd font)
    }
  },
  'kyazdani42/nvim-tree.lua', -- File tree
  'akinsho/bufferline.nvim', -- Buffer line
  'nvim-lualine/lualine.nvim', -- Status line
  { 'akinsho/toggleterm.nvim', config = true }, -- Better terminal in Neovim
  'onsails/lspkind-nvim', -- VSCode-like pictograms for completion
  'lukas-reineke/indent-blankline.nvim', -- Show indentation lines
  'folke/which-key.nvim', -- Keymap hints
  'zbirenbaum/neodim', -- Dim text for unused variables, functions, etc.
  'rcarriga/nvim-notify', -- Notifications
  'andweeb/presence.nvim', -- Discord presence
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'j-hui/fidget.nvim', config = true },
  { 'norcalli/nvim-colorizer.lua', config = true },
  { 'uga-rosa/ccc.nvim', config = true },

})

return plugins
