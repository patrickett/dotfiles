set shell=/bin/bash

call plug#begin('~/.config/nvim/bundle')

"Center text
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim' 

" fzf and file search
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" vim features
Plug 'mhinz/vim-startify'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'

" syntax
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'leafgarland/typescript-vim'
Plug 'dense-analysis/ale'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'

" js/ts/vue/html/css
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

"coc prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"vue specific stuff
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_typescript = 1
let g:vim_vue_plugin_use_pug = 1
let g:vim_vue_plugin_has_init_indent = 0
let g:vim_vue_plugin_highlight_vue_keyword = 1

let g:coc_global_extensions = ['coc-tailwindcss', 'coc-snippets', 'coc-rust-analyzer', 'coc-prettier', 'coc-pairs', 'coc-eslint', "coc-vetur", "coc-tsserver", "coc-json"]

" ale settings
"let g:ale_fixers = {}
"let g:ale_fixers.javascript = ['eslint']
"let g:ale_fixers.typescript = ['eslint']
"let g:ale_fix_on_save = 1


if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set guifont=Fira\ Code:h12

" rust.vim option
let g:autofmt_autosave = 1

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='lucius'


" basics
colorscheme edge
"filetype plugin indent on
syntax on 
set number
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=2
set softtabstop=0
set shiftwidth=2
set noexpandtab
set nobackup
set noswapfile
set nowrap
set colorcolumn=100
set undodir=~/.vim/undodir
set undofile
set viminfo='100,n$HOME/.vim/files/info/viminfo

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

command! Q :q

" movemnet with arrow keys around words
map ^[0A <ESC>ki
" quit with ctrl + q
map <C-q> :quit<CR>
" map ctrl a to begining of line insert mode
imap <C-a> <esc>0i
" move cursor to bottom of screen
noremap <C-b> G$<CR>
" move cursor to top of screen
noremap <C-t> gg<CR>
"copy with ctrl c in visual mode
vmap <C-c> y
" cut with ctrl x in visual mode
vmap <C-x> x
" cut with ctrl x in visual mode
imap <C-v> <ESC>p
" run makefile

" This section allows me to Shift arrow key move things
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" comment out selected lines
vnoremap <C-i> :call NERDComment(0,"toggle")<CR>
map <C-i> :call NERDComment(0,"toggle")<CR>

" map ctrl+s to write
map <C-s> :w<CR>
inoremap <C-s> <c-o>:w<cr>

" ctrl + t to open new tab in current dir
nnoremap  <C-t> :tabnew<CR>:Ex<CR>
" scrolls tab with ctrl+n
nnoremap <C-n> :tabnext<CR>
" opens new tab with startify
nnoremap <S-t> :tabnew<CR>:Startify<CR>

nnoremap <C-p> :GFiles<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
