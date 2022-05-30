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
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tomasiser/vim-code-dark'

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use {
		'hrsh7th/nvim-cmp', 
		requires = {
			{'hrsh7th/cmp-vsnip', opt = true},
			{'hrsh7th/vim-vsnip', opt = true},
		}
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'}
		}
	}

	
	use 'tpope/vim-commentary'  -- Shortcut to comment out lines/selection
	use 'windwp/nvim-autopairs'  -- Automatic bracket and quote pairs
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
	use 'akinsho/bufferline.nvim'  -- Buffer line
	use 'akinsho/toggleterm.nvim'  -- Better terminal in Neovim
	use 'onsails/lspkind-nvim'  -- VSCode-like pictograms for completion
	use 'lukas-reineke/indent-blankline.nvim'  -- Show indentation lines

	use 'mattn/efm-langserver'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

return plugins
