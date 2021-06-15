" true color
set termguicolors

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set number
syntax on
set nocompatible
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*


" setting the leader key
let mapleader=","

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Add asterisks in block comments
set formatoptions+=r

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescript
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

"-------------------------------------------------------------------------------
" Cursor line
"-------------------------------------------------------------------------------

set cursorline

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr       cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"-------------------------------------------------------------------------------
" Other plugins
"-------------------------------------------------------------------------------

" vim-go
let g:go_disable_autoinstall = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" Status line
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

" JSX
let g:jsx_ext_required = 0

" Tern
" Disable auto preview window
set completeopt-=preview

" localvimrc
let g:localvimrc_ask = 0

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
Plug 'pablopunk/transparent.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'neovim/python-client'
Plug 'neoclide/coc.nvim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'januswel/jwlib.vim'
Plug 'januswel/filer.vim'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'ap/vim-css-color'
Plug 'ayu-theme/ayu-vim'
Plug 'flowtype/vim-flow'
Plug 'justinj/vim-react-snippets'
Plug 'preservim/nerdcommenter'
Plug 'shime/vim-livedown'

call plug#end()

"-------------------------------------------------------------------------------
" Livedown configuration
"-------------------------------------------------------------------------------
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "firefox"


"-------------------------------------------------------------------------------
" CtrlP settings
"-------------------------------------------------------------------------------

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"-------------------------------------------------------------------------------
" nerdcommenter settings
"-------------------------------------------------------------------------------

nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>


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
" defx settings
"-------------------------------------------------------------------------------

" Define mappings
"cnoreabbrev sf Defx -listed -new
"      \ -columns=indent:mark:icon:icons:filename:git:size
"      \ -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent>sf :<C-u>Defx -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })

"-------------------------------------------------------------------------------
" denite settings
"-------------------------------------------------------------------------------

" Define mappings
augroup denite_filter
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
    imap <silent><buffer> <C-n> <Plug>(denite_filter_quit)<DOWN>
    imap <silent><buffer> <C-p> <Plug>(denite_filter_quit)<UP>
    imap <silent><buffer> <CR> <Plug>(denite_filter_quit)<CR>
  endfunction
augroup END

nnoremap [denite] <Nop>
nmap sF [denite]
"nnoremap <silent> SF :<C-u>DeniteBufferDir
"      \ -direction=topleft file file:new<CR>

nnoremap <silent> [denite]<C-g> :<C-u>Denite -buffer-name=search -no-empty grep<CR>
nnoremap <silent> [denite]<C-r> :<C-u>Denite -resume<CR>
nnoremap <silent> [denite]<C-n> :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> [denite]<C-p> :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>

" use floating
let s:denite_win_width_percent = 0.8
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ 'highlight_filter_background': 'DeniteFilter',
    \ 'prompt': 'λ ',
    \ 'start_filter': v:true,
    \ }
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
call denite#custom#option('default', s:denite_default_options)

call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" grep
command! -nargs=? Dgrep call s:Dgrep(<f-args>)
function s:Dgrep(...)
  if a:0 > 0
    execute(':Denite -buffer-name=grep-buffer-denite grep -path='.a:1)
  else
    let l:path = expand('%:p:h')
    if has_key(defx#get_candidate(), 'action__path')
      let l:path = fnamemodify(defx#get_candidate()['action__path'], ':p:h')
    endif
    execute(':Denite -buffer-name=grep-buffer-denite -no-empty '.join(s:denite_option_array, ' ').' grep -path='.l:path)
  endif
endfunction
" show Denite grep results
command! Dresume execute(':Denite -resume -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').'')
" next Denite grep result
command! Dnext execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=+1 -immediately '.join(s:denite_option_array, ' ').'')
" previous Denite grep result
command! Dprev execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=-1 -immediately '.join(s:denite_option_array, ' ').'')
" keymap
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

nnoremap <silent> ;r :<C-u>Dgrep<CR>
nnoremap <silent> ;f :<C-u>Denite file/rec<CR>
nnoremap <silent> ;; :<C-u>Denite command command_history<CR>
nnoremap <silent> ;p :<C-u>Denite -resume<CR>


"-------------------------------------------------------------------------------
" COC settings
"-------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" jsonc syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
noremap <silent> <C-f> <Plug>(coc-definition)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Extensions
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ ]

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile


"-------------------------------------------------------------------------------
" DevIcons
"-------------------------------------------------------------------------------

set guifont=Sauce\ Code\ Pro\ Light\ Nerd\ Font\ Complete\ Windows\ Compatible:h11
let g:webdevicons_enable_vimfiler = 1

"-------------------------------------------------------------------------------
" Color scheme
"-------------------------------------------------------------------------------

colorscheme one 
let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme

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
