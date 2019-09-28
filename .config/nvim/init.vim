call plug#begin('~/.config/nvim/bundle')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Valloric/YouCompleteMe'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'racer-rust/vim-racer'
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'vim-syntastic/syntastic'
Plug 'prabirshrestha/async.vim'
Plug 'rust-lang/rust.vim'


"Javascript
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'maksimr/vim-jsbeautify'

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'lervag/vimtex'
call plug#end()


" these lines fix Javascript deoplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete


let g:rust_clip_command = 'xclip -selection clipboard'

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


" syntastic settings
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" movemnet with arrow keys around words
map ^[0A <ESC>ki
" quit with ctrl + q
map <C-q> :quit<CR>
" map ctrl a to begining of line insert mode
imap <C-a> <esc>0i
" move cursor to bottom of screen
noremap <C-b> G$<CR>
" move cursor to top of screen
map <C-t> gg<CR>
 "copy with ctrl c in visual mode
vmap <C-c> y
" cut with ctrl x in visual mode
vmap <C-x> x
" cut with ctrl x in visual mode
imap <C-v> <ESC>p
" run makefile
noremap <C-m> :make<CR>

" close with capital q
":command! -bar -bang Q quit<bang>


" Javascript format
map <S-f> :call JsBeautify()<CR>


"nnoremap <A-j> :m .+1<CR>==
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>




"map <C-l> !make<CR>

let g:NerdCreateDefaultMappings = 0


map <C-f> :RustFmt<CR>
" comment out selected lines
"inoremap <C-i> :call NERDComment(0,"toggle")<CR>
vnoremap <C-i> :call NERDComment(0,"toggle")<CR>
map <C-i> :call NERDComment(0,"toggle")<CR>


" plugin settings
" deoplete
let g:deoplete#enable_at_startup = 1
" disable scratch preview
set completeopt-=preview

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" NERDTREE COMMANDS
map <C-n> :NERDTreeToggle<CR>

filetype plugin on

" map ctrl+s to write
map <C-s> :w<CR>
inoremap <C-s> <c-o>:w<cr>

set background=dark
set termguicolors
colorscheme ceudah
