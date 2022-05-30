" Automatically install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tomasiser/vim-code-dark'

" nvim-cmp requirements
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-commentary'  " Shortcut to comment out lines/selection
Plug 'windwp/nvim-autopairs'  " Automatic bracket and quote pairs
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'  " Buffer line
Plug 'akinsho/toggleterm.nvim'  " Better terminal in Neovim
Plug 'onsails/lspkind-nvim'  " VSCode-like pictograms for completion
Plug 'lukas-reineke/indent-blankline.nvim'  " Show indentation lines

" Plug 'jose-elias-alvarez/null-ls.nvim'
" Plug 'sbdchd/neoformat'
Plug 'mattn/efm-langserver'

call plug#end()

" Colour scheme
colorscheme codedark

" Lualine status line
lua require('lualine').setup()

" nvim-tree
lua require('plugins.nvim-tree-config')

" Treesitter
lua require('plugins.treesitter-config')

" LSP (lspconfig, nvim-cmp, lsp-installer)
lua require('plugins.nvim-lsp')

" nvim-autopairs
lua require('plugins.nvim-autopairs-config')

" toggleterm.nvim
lua require('toggleterm').setup({})

" bufferline.nvim
set termguicolors
lua require('plugins.bufferline-config')

" null-ls
"lua  require('plugins.null-ls-config')

" neoformat
"let g:neoformat_verbose = 1

" efm-langserver
lua require('plugins.efm-langserver-config')
