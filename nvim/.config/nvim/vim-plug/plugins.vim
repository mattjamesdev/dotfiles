" Automatically install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'scrooloose/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ap/vim-css-color'
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

Plug 'tpope/vim-commentary'

Plug 'windwp/nvim-autopairs'

Plug 'akinsho/toggleterm.nvim'

Plug 'onsails/lspkind-nvim'

call plug#end()

" Colour scheme
colorscheme codedark

" Lualine status line
lua require('lualine').setup()

" NERDTree
command Nt NERDTree
let g:NERDTreeWinSize=40
" Automatically exit Neovim if NERDTree is the last remaining buffer:
" https://www.reddit.com/r/vim/comments/nav78k/make_nerdtree_work_with_tabs_and_sessions/
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Treesitter
source $HOME/.config/nvim/vim-plug/plugs/treesitter.vim

" nvim-lsp-installer
source $HOME/.config/nvim/vim-plug/plugs/nvim-lsp-installer.vim

" nvim-cmp
source $HOME/.config/nvim/vim-plug/plugs/nvim-cmp.vim

" nvim-autopairs
source $HOME/.config/nvim/vim-plug/plugs/nvim-autopairs.vim

" toggleterm.nvim
lua require('toggleterm').setup({})
