" 
" ~/.vimrc
"

" === Sets ===
" Show file stats
set ruler
" Allow files to remain open after exiting
set hidden
" Indentation
set expandtab
set shiftwidth=4
set tabstop=4 softtabstop=4
set smartindent
" Extra column next to line numbers (for linting etc.)
set signcolumn=yes
" Self-explanatory
set number
set relativenumber
:highlight LineNr ctermfg=grey  " line number colour
set noerrorbells
set nowrap
set ignorecase
set smartcase
"set nohlsearch  " Don't keep highlighting text after finished searching
set incsearch
set scrolloff=10
set colorcolumn=80
:hi ColorColumn ctermbg=240
set cursorline
set cursorlineopt=number
:hi CursorLineNR cterm=NONE ctermbg=240

" Set cursor to block when not in insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" Enables the mouse for scrolling only
set mouse=a
:nmap <LeftMouse> <nop>
:imap <LeftMouse> <nop>
:vmap <LeftMouse> <nop>
:nmap <2-LeftMouse> <nop>
:imap <2-LeftMouse> <nop>
:vmap <2-LeftMouse> <nop>


let mapleader = " "
nnoremap <leader>nh :set nohlsearch<CR>

" Move selected lines up/down with J/K in visual line mode
" https://www.youtube.com/watch?v=QN4fuSsWTbA - at 10:11
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

set laststatus=2


" === Others ==================================================================
" Enable syntax highlighting
:syntax on

" Enable hlsearch when searching, then disable when entering Insert mode
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd InsertEnter * :set nohlsearch
augroup END

