set shell=/bin/bash
"let mapleader = "\<Space>"

if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
	
	" GUI improvements
	call dein#add('junegunn/fzf.vim')
	call dein#add('majutsushi/tagbar')
	call dein#add('scrooloose/nerdtree')
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('w0rp/ale')
	call dein#add('airblade/vim-rooter')
	call dein#add('tpope/vim-sensible')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('yuttie/comfortable-motion.vim')
	
	" Autocompletion
	call dein#add('ncm2/ncm2')
	call dein#add('roxma/nvim-yarp')
	call dein#add('ncm2/ncm2-bufword')
	call dein#add('ncm2/ncm2-tmux')
	call dein#add('ncm2/ncm2-path')

	" Syntactic language support	
	call dein#add('lervag/vimtex')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('Yggdroot/indentLine')
	call dein#add('chrisbra/csv.vim')
	call dein#add('rust-lang/rust.vim')

	call dein#add('roxma/vim-hug-neovim-rpc')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Custom keybindings
map <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap ; :
nnoremap <S-Tab> << 			"Make Shift-tab remove tabs
inoremap <S-Tab> <C-d>			

set mouse=a
set tabstop=4
set shiftwidth=4
set cursorline
set autoread
set ruler
set number relativenumber
set nu rnu

command WQ wq
command Wq wq
command W w
command Q q

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'

" Use deoplete.
"let g:deoplete#enable_at_startup = 1
"let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ }

" Use ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" tab to select
" and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")


" Linter
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_virtualtext_cursor = 1
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_rls_toolchain = ''
let g:ale_linters = {'rust': ['rls']}
highlight link ALEWarningSign Todo
highlight link ALEErrorSign WarningMsg
highlight link ALEVirtualTextWarning Todo
highlight link ALEVirtualTextInfo Todo
highlight link ALEVirtualTextError WarningMsg
highlight ALEError guibg=None
highlight ALEWarning guibg=None
let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>


" Tex documents, currently assuming mupdf is installed
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

augroup my_cm_setup
autocmd!
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd Filetype tex call ncm2#register_source({
		\ 'name' : 'vimtex-cmds',
		\ 'priority': 8, 
		\ 'complete_length': -1,
		\ 'scope': ['tex'],
		\ 'matcher': {'name': 'prefix', 'key': 'word'},
		\ 'word_pattern': '\w+',
		\ 'complete_pattern': g:vimtex#re#ncm2#cmds,
		\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
		\ })
autocmd Filetype tex call ncm2#register_source({
		\ 'name' : 'vimtex-labels',
		\ 'priority': 8, 
		\ 'complete_length': -1,
		\ 'scope': ['tex'],
		\ 'matcher': {'name': 'combine',
		\             'matchers': [
		\               {'name': 'substr', 'key': 'word'},
		\               {'name': 'substr', 'key': 'menu'},
		\             ]},
		\ 'word_pattern': '\w+',
		\ 'complete_pattern': g:vimtex#re#ncm2#labels,
		\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
		\ })
autocmd Filetype tex call ncm2#register_source({
		\ 'name' : 'vimtex-files',
		\ 'priority': 8, 
		\ 'complete_length': -1,
		\ 'scope': ['tex'],
		\ 'matcher': {'name': 'combine',
		\             'matchers': [
		\               {'name': 'abbrfuzzy', 'key': 'word'},
		\               {'name': 'abbrfuzzy', 'key': 'abbr'},
		\             ]},
		\ 'word_pattern': '\w+',
		\ 'complete_pattern': g:vimtex#re#ncm2#files,
		\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
		\ })
autocmd Filetype tex call ncm2#register_source({
		\ 'name' : 'bibtex',
		\ 'priority': 8, 
		\ 'complete_length': -1,
		\ 'scope': ['tex'],
		\ 'matcher': {'name': 'combine',
		\             'matchers': [
		\               {'name': 'prefix', 'key': 'word'},
		\               {'name': 'abbrfuzzy', 'key': 'abbr'},
		\               {'name': 'abbrfuzzy', 'key': 'menu'},
		\             ]},
		\ 'word_pattern': '\w+',
		\ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
		\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
		\ })
augroup END
