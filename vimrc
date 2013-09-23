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

set number
if exists("&relativenumber")
	set relativenumber
	nnoremap <silent> <leader>n :set relativenumber!<cr>
endif

nnoremap <silent> <leader>h :nohlsearch<cr>

filetype plugin indent on
syntax on

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set wildmode=longest:full
set wildmenu

set history=10000

set splitbelow
set splitright

set cursorline
highlight cursorline cterm=bold

let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

set backupdir=~/tmp/vim/,.
