"  _       _ _         _           
" (_)_ __ (_) |___   _(_)_ __ ___  
" | | '_ \| | __\ \ / / | '_ ` _ \ 
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
" 

" ---------------------------------- Sets -------------------------------------
set ruler  " file stats at bottom of window
set expandtab
set shiftwidth=4
set tabstop=4 softtabstop=4
set smartindent
set signcolumn=yes
set number
set relativenumber
:highlight LineNr ctermfg=grey  " line number colour
set nowrap
set ignorecase
set smartcase
"set nohlsearch
set incsearch  " default is already on
set scrolloff=99
set colorcolumn=80
:hi ColorColumn ctermbg=240
:hi CursorLineNR cterm=NONE ctermbg=240

" Enable mouse for scrolling only
set mouse=a
:nmap <LeftMouse> <nop>
:imap <LeftMouse> <nop>
:vmap <LeftMouse> <nop>
:nmap <2-LeftMouse> <nop>
:imap <2-LeftMouse> <nop>
:vmap <2-LeftMouse> <nop>

" --------------------------------- Remaps ------------------------------------
" Move selected lines up/down with J/K in visual line mode
" https://www.youtube.com/watch?v=QN4fuSsWTbA - at 10:11
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Add quotes/brackets around visual selection
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>
vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap [ <esc>`>a]<esc>`<i[<esc>
vnoremap { <esc>`>a}<esc>`<i{<esc>

" Reselect after indenting
vnoremap > >gv
vnoremap < <gv

" --------------------------------- Leaders -----------------------------------
let mapleader=' '

" --------------------------------- Plugins -----------------------------------
" Load plugins (vim-plug)
source $HOME/.config/nvim/plugins.vim

" Hide current mode (already shown in Lightline)
set noshowmode

" ------------------------------ Autocommands ---------------------------------
" Enable hlsearch when searching, then disable when entering Insert mode
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd InsertEnter * :set nohlsearch
augroup END

" ----------------------------- Neovim Python ---------------------------------
let g:python3_host_prog = $HOME . '/.pyenv/versions/3.9.5/envs/neovim/bin/python'
