set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Townk/vim-autoclose'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jalcine/cmake.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'

call plug#end()            " required
filetype plugin indent on    " required

syntax on
set tabstop=4
set shiftwidth=4
set number
set t_Co=256

" Key bindings
map <F7> <Esc>:NERDTreeToggle<CR>
nmap <F8> <Esc>:TagbarToggle<CR>
nnoremap <c-s> :w<CR> 
inoremap <c-s> <Esc>:w<CR>a 
vnoremap <c-s> <Esc>:w<CR>a

:command WQ wq
:command Wq wq
:command W w
:command Q q

set laststatus=2  

" airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" " speedup CtrlP
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

"set termguicolors
"set background=dark
"colorscheme gruvbox

set rtp+=~/.fzf
set cursorline

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang/'
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#std#c = 'c11' 
let g:deoplete#sources#clang#std#cpp = 'c++14'
