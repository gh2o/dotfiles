set showcmd
set autoindent
set hlsearch
set mouse=a

set tabstop=4
set shiftwidth=4
set ls=2

set number

filetype plugin indent on
syntax on

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set wildmode=longest:full
set wildmenu

set cursorline
highlight cursorline cterm=bold

let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

set backupdir=~/tmp/vim/,.
