set nocompatible
filetype off

"Vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/seoul256.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'

call vundle#end()

syntax on
filetype plugin indent on

"Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='bubblegum'

"Color_scheme
let g:seoul256_background=233
colo seoul256

"Auto-save
let g:auto_save=1
let g:auto_save_in_insert_mode=0

"NerdTree
nmap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
	\ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 
	\ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute 
	\ "normal! \<C-W>w" | execute 'buffer'.buf | endif

"TagBar
nmap <F8> :TagbarToggle [f]<CR>

"C-langs
au BufRead, BufNewFile *.c, *.cpp, *.hpp, *.hh set cindent

"Goyo
let g:goyo_height='100%'

function! s:goyo_enter()
	set linebreak
	set spell spelllang=en_us
endfunction

function! s:goyo_leave()
	set nolinebreak
	set nospell
endfunction

autocmd vimenter *.md Goyo
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"General
set number
set mouse=a
set mousehide
set wildmenu
set colorcolumn=80

"Default settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8

"Indents
set expandtab
set smarttab
set smartindent

"Auto brackets
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

"File types
augroup project
	autocmd!
	autocmd BufRead, BufNewFile *.h, *.c set filetype=c
augroup END

"Autocomplete in
autocmd FileType c set omnifunc=ccomplete#Complete
set completeopt=menu
