call plug#begin('~/.config/nvim/bundle')

" rust
Plug 'rust-lang/rust.vim'
Plug 'rhysd/rust-doc.vim'

" vim features
Plug 'mhinz/vim-startify'
Plug 'vimlab/split-term.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'justinmk/vim-sneak'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'junegunn/fzf'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" syntax & autocompletion
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/syntastic'

Plug 'dense-analysis/ale'

" js/ts/vue/html/css
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set viminfo='100,n$HOME/.vim/files/info/viminfo
set termguicolors

" rust.vim option
let g:autofmt_autosave = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='cool'
let g:airline_theme='lucius'

" ctrlp better fuzzy search 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co - exclude-standard', 'find %s -type f']
"nmap <C-P> :FZF<CR>
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_cmd='CtrlP :pwd '



" basics
colorscheme atom 
filetype plugin indent on
syntax on 
set number
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap
set colorcolumn=80
set undodir=~/.vim/undodir
set undofile

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
"noremap <C-m> :make<CR>

"nnoremap <A-j> :m .+1<CR>==
" This section allows me to Shift arrow key move things
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

"map <C-f> :RustFmt<CR>
" comment out selected lines
"inoremap <C-i> :call NERDComment(0,"toggle")<CR>
vnoremap <C-i> :call NERDComment(0,"toggle")<CR>
map <C-i> :call NERDComment(0,"toggle")<CR>

" map ctrl+s to write
"map <C-s> =G :w<CR>
map <C-s> :w<CR>
inoremap <C-s> <c-o>:w<cr>

" ctrl + t to open new tab in current dir
nnoremap  <C-t> :tabnew<CR>:Ex<CR>
" scrolls tab with ctrl+n
nnoremap <C-n> :tabnext<CR>
" opens new tab with startify
nnoremap <S-t> :tabnew<CR>:Startify<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references
