set tgc

" Tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Custom executions 
set exrc

" Cursor shape
" set guicursor=

" Cursor line
set cul

" Line numbers
set number
set relativenumber

" Highlighting
set nohlsearch

" Keeps buffers open
set hidden

set noerrorbells
set nowrap
set smartcase
set ignorecase

" removing swap files and history management 
set noswapfile
set nobackup 
set undodir=~/.vim/undodir
set undofile

set incsearch

" start scrolling when 8 lines offset
set scrolloff=8

set noshowmode 
set completeopt=menuone,noinsert,noselect

" linting or error messages
set signcolumn=yes

" give a little more space for displaying messages
set cmdheight=2

" default is 4000ms
set updatetime=50

" don't pass messages to |ins-completion-menu|
set shortmess+=c

set wildmode=longest,list,full
set wildmenu

" ignore directories
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=*/node_modules/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" leader key
let mapleader = " "

" Plugins 
call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dylanaraps/wal.vim'
Plug 'morhetz/gruvbox'
Plug 'kassio/neoterm'

call plug#end()

colorscheme gruvbox

" markdown syntax
let g:vim_markdown_folding_disabled = 1

" banner
let g:netrw_banner = 0

nnoremap <C-n> :Lex<CR> :vertical resize 30<CR>

" Remaps
source $HOME/.vimrc.maps
