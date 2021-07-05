set shell=/bin/bash

call plug#begin('~/.config/nvim/bundle')

Plug 'mattn/emmet-vim'

" NERDTREE fm
Plug 'preservim/nerdtree'

"sneak
Plug 'justinmk/vim-sneak'

" fzf and file search
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" vim features
Plug 'mhinz/vim-startify'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" comments
Plug 'tpope/vim-commentary'

" syntax
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'posva/vim-vue'
"Plug 'digitaltoad/vim-pug'
" Plug 'dense-analysis/ale'

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

" comment out selected lines
vnoremap <C-i> :Commentary<CR>
map <C-i> :Commentary<CR>

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set guifont=Fira\ Code:h12

set mouse=a " Enable mouse usage (all modes) in terminals

" rust.vim option
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='lucius'


" fzf keybind
nmap <C-f> :Rg <CR>

" You can optionally remove the filename from searches
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" basics
colorscheme angr
"filetype plugin indent on
filetype plugin on
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

" NERDTREE Toggle
nnoremap <C-e> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" close nerdtree when file selected
let g:NERDTreeQuitOnOpen = 1

" disable matchparen
let g:loaded_matchparen=1


" Remap keys for applying codeAction to the current buffer.
"nmap <> <Plug>(coc-codeaction)
nmap <C-a> :CocAction <CR>

" movemnet with arrow keys around words
"map ^[0A <ESC>ki
" quit with ctrl + q
map <C-q> :quit<CR>
" map ctrl a to begining of line insert mode
imap <C-a> <esc>0i
" move cursor to bottom of screen
noremap <C-b> G$<CR>
" move cursor to top of screen
"noremap <C-t> gg<CR>
"copy with ctrl c in visual mode
vmap <C-c> y
" cut with ctrl x in visual mode
vmap <C-x> x
" cut with ctrl x in visual mode
imap <C-v> <ESC>p

" This section allows me to Shift arrow key move things
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

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
