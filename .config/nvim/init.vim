call plug#begin('~/.config/nvim/bundle')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'scrooloose/nerdcommenter'


call plug#end()

" coc config
" if something is complaining about java runtime
" disable coc-xml and coc-java
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-rust-analyzer',
  \ ]

" format on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" basics
filetype plugin indent on
syntax on set number
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
noremap <C-m> :make<CR>


"nnoremap <A-j> :m .+1<CR>==
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

map <C-f> :RustFmt<CR>
" comment out selected lines
"inoremap <C-i> :call NERDComment(0,"toggle")<CR>
vnoremap <C-i> :call NERDComment(0,"toggle")<CR>
map <C-i> :call NERDComment(0,"toggle")<CR>

" map ctrl+s to write
map <C-s> :w<CR>
inoremap <C-s> <c-o>:w<cr>

