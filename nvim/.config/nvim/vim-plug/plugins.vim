" Automatically install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'wincent/command-t'
call plug#end()
