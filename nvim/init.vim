call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'lifepillar/vim-solarized8'

call plug#end()

source ~/.config/nvim/coc.vim
source ~/.config/nvim/basic.vim
source ~/.config/nvim/myconfig.vim

" set background=dark
" colorscheme solarized8

