set termguicolors

call plug#begin('~/AppData/Local/nvim/plugged')

" File and folder management
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/goyo.vim'


" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

" Language support
Plug 'tpope/vim-projectionist'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" Dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" GraphQL 
Plug 'jparise/vim-graphql'

" Git
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" Theme
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'

" Devicon 
Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/defx-icons'

" Lightline
Plug 'itchyny/lightline.vim'

"just for fun
Plug 'pablopunk/transparent.vim'
Plug 'junegunn/goyo.vim'
Plug 'ap/vim-css-color'

call plug#end()

set rnu nu
set background=dark
set noerrorbells                                              " Don't add sounds for errors
set number
set ignorecase
set smarttab
set cursorline 
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/AppData/Local/nvim-data/backup
set undofile
set incsearch
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set colorcolumn=120
set clipboard=unnamedplus
set backspace=indent,eol,start
set title 
set path+=**
highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader=","

nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>

map sh :wincmd h <CR>
map sj :wincmd j <CR>
map sk :wincmd k <CR>
map sl :wincmd l <CR>

nnoremap <C-n> :NERDTreeToggle<CR>
" nnoremap <C-S-b> :NERDTreeFind<CR>

let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']

"-------------------------------------------------------------------------------
" Coc Settings 
"-------------------------------------------------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <leader>e :FZF<CR>

nmap <leader>gs :G<CR>

imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

"coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ ]


"-------------------------------------------------------------------------------
" nerdtree settings
"-------------------------------------------------------------------------------

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
   "\ "Ignored"   : "#808080"   
    "\ }                         

nmap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIgnore = ['^node_modules$']

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()


"-------------------------------------------------------------------------------
" DevIcons
"-------------------------------------------------------------------------------

set guifont=Sauce\ Code\ Pro\ Light\ Nerd\ Font\ Complete\ Windows\ Compatible:h11
let g:webdevicons_enable_vimfiler = 1

"-------------------------------------------------------------------------------
" Color scheme
"-------------------------------------------------------------------------------

colorscheme one

"-------------------------------------------------------------------------------
" vim-flutter-commands
"-------------------------------------------------------------------------------

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>


"-------------------------------------------------------------------------------
" other keybinds 
"-------------------------------------------------------------------------------

nmap <leader>s :w<Return>

"-------------------------------------------------------------------------------
" imports
"-------------------------------------------------------------------------------

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    source ~/.vimrc.osx
  endif
endif

source ~/.vimrc.maps
source ~/.vimrc.lightline

set exrc
