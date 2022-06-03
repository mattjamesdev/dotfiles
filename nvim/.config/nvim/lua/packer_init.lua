local fn = vim.fn

--local vim_plug_install_path = '~/.config/nvim/autoload/plug.vim'
--if fn.empty(fn.glob(vim_plug_install_path)) > 0 then
--  fn.system({ 'curl', '-fLo', '~/.config/nvim/autoload/plug.vim', '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' })
--  vim.api.nvim_create_autocmd('VimEnter', { pattern = '*', command = 'PlugInstall | source $MYVIMRC' })
--end


local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

local plugins = require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lualine/lualine.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

	-- Colourschemes
  use 'Mofiqul/vscode.nvim'
	use 'ellisonleao/gruvbox.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-vsnip', opt = false },
      { 'hrsh7th/vim-vsnip', opt = false },
      -- {'L3MON4D3/LuaSnip', opt = false},
      -- {'saadparwaiz1/cmp_luasnip', opt = false},
    }
  }
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lua'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' }
    }
  }


  use 'tpope/vim-commentary' -- Shortcut to comment out lines/selection
  use 'windwp/nvim-autopairs' -- Automatic bracket and quote pairs
  use {
    'goolord/alpha-nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }
  use 'kyazdani42/nvim-tree.lua'
  use 'akinsho/bufferline.nvim' -- Buffer line
  use 'akinsho/toggleterm.nvim' -- Better terminal in Neovim
  use 'onsails/lspkind-nvim' -- VSCode-like pictograms for completion
  use 'lukas-reineke/indent-blankline.nvim' -- Show indentation lines

  use 'mattn/efm-langserver'

  use 'folke/which-key.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

return plugins
