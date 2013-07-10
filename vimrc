set showcmd
set autoindent
set hlsearch
set mouse=a

set nowrap
set synmaxcol=400

set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set ls=2

let mapleader="-"

set relativenumber
function! vimrc:togglenumber()
	if(&relativenumber)
		set number
	else
		set relativenumber
	endif
endfunc
nnoremap <silent> <leader>n :call vimrc:togglenumber()<cr>

filetype plugin indent on
syntax on

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set wildmode=longest:full
set wildmenu

set history=10000

set cursorline
highlight cursorline cterm=bold

let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

set backupdir=~/tmp/vim/,.
