set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" " The following are examples of different formats supported.
" " " Keep Plug commands between vundle#begin/end.
" " " plugin on GitHub repo
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
Plug 'morhetz/gruvbox'
Plug 'Shougo/neoinclude.vim'


" " " plugin from http://vim-scripts.org/vim/scripts.html
" " Plug 'L9'
" " " Git plugin not hosted on GitHub
" " Plug 'git://git.wincent.com/command-t.git'
" " " git repos on your local machine (i.e. when working on your own plugin)
" " Plug 'file:///home/gmarik/path/to/plugin'
" " " The sparkup vim script is in a subdirectory of this repo called vim.
" " " Pass the path to set the runtimepath properly.
" " Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" " " Install L9 and avoid a Naming conflict if you've already installed a
" " " different version somewhere else.
" " Plug 'ascenator/L9', {'name': 'newL9'}
" "
" " " All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" " " To ignore plugin indent changes, instead use:
" " "filetype plugin on
" " "
" " " Brief help
" " " :PlugList       - lists configured plugins
" " " :PlugInstall    - installs plugins; append `!` to update or just
" " :PlugUpdate
" " " :PlugSearch foo - searches for foo; append `!` to refresh local cache
" " " :PlugClean      - confirms removal of unused plugins; append `!` to
" " auto-approve removal
" " "
" " " see :h vundle for more details or wiki for FAQ
" " " Put your non-Plug stuff after this line
"
syntax on
set tabstop=4
set shiftwidth=4
set number
set t_Co=256
"
" " Key bindings
map <F7> <Esc>:NERDTreeToggle<CR>
nmap <F8> <Esc>:TagbarToggle<CR>
nnoremap <c-s> :w<CR> 
inoremap <c-s> <Esc>:w<CR>a 
vnoremap <c-s> <Esc>:w<CR>a
 ":inoremap ( ()<Esc>:let leavechar=")"<CR>i
 ":inoremap [ []<Esc>:let leavechar="]"<CR>i
" "inoremap { {<CR><BS>}<Esc>ko
:command WQ wq
:command Wq wq
:command W w
:command Q q
"
set laststatus=2  
"
" " airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"
" " speedup CtrlP
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif

set termguicolors
set background=dark
colorscheme gruvbox

set rtp+=~/.fzf
set cursorline

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/include/clang/'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#std#c = 'c11' 
let g:deoplete#sources#clang#std#cpp = 'c++14'
