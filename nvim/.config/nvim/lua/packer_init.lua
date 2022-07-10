local fn = vim.fn

-- Automatically install packer.nvim if not already installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

-- Main plugin list
local plugins = require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' -- LSP config
  use 'williamboman/nvim-lsp-installer' -- Installer for language servers

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp' -- Source for LSP
  use 'hrsh7th/cmp-buffer'   -- Source for buffer
  use 'hrsh7th/cmp-path'     -- Source for paths
  use 'hrsh7th/cmp-cmdline'  -- Source for commands
  use {
    'hrsh7th/nvim-cmp', -- The main completion plugin
    requires = {
      { 'hrsh7th/cmp-vsnip', opt = false }, -- Snippets for completion
      { 'hrsh7th/vim-vsnip', opt = false }, -- Snippets engine
      -- {'L3MON4D3/LuaSnip', opt = false},
      -- {'saadparwaiz1/cmp_luasnip', opt = false},
    }
  }
  use 'hrsh7th/cmp-nvim-lsp-signature-help' -- Source for LSP signature help
  use 'hrsh7th/cmp-nvim-lua' -- Source for Neovim's Lua API

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' }
    }
  }

  -- Colourschemes
  use 'Mofiqul/vscode.nvim'
  use 'ellisonleao/gruvbox.nvim'

  -- Misc
  use 'tpope/vim-commentary' -- Commenting
  use 'windwp/nvim-autopairs' -- Automatic bracket and quote pairs
  use {
    'goolord/alpha-nvim', -- Startup screen
    requires = {
      'kyazdani42/nvim-web-devicons' -- Devicons (requires a nerd font)
    }
  }
  use 'kyazdani42/nvim-tree.lua' -- File tree
  use 'akinsho/bufferline.nvim' -- Buffer line
  use 'nvim-lualine/lualine.nvim' -- Status line
  use 'akinsho/toggleterm.nvim' -- Better terminal in Neovim
  use 'onsails/lspkind-nvim' -- VSCode-like pictograms for completion
  use 'lukas-reineke/indent-blankline.nvim' -- Show indentation lines
  use 'folke/which-key.nvim' -- Keymap hints
  use 'zbirenbaum/neodim' -- Dim text for unused variables, functions, etc.

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

return plugins
