set expandtab
set showcmd
set autoindent
set hlsearch
set incsearch
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
	"set relativenumber
	nnoremap <silent> <leader>n :set relativenumber!<cr>
endif

nnoremap <silent> <leader>h :nohlsearch<cr>

filetype plugin indent on
syntax on

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nmap <silent> <A-1> :tabnext 1<CR>
nmap <silent> <A-2> :tabnext 2<CR>
nmap <silent> <A-3> :tabnext 3<CR>
nmap <silent> <A-4> :tabnext 4<CR>
nmap <silent> <A-5> :tabnext 5<CR>
nmap <silent> <A-6> :tabnext 6<CR>
nmap <silent> <A-7> :tabnext 7<CR>
nmap <silent> <A-8> :tabnext 8<CR>
nmap <silent> <A-9> :tabnext 9<CR>
nmap <silent> <A-0> :tabnext 10<CR>

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

set directory=~/tmp/vim//,.

if has("gui_running")
	colorscheme darkblue
	if filereadable("/usr/share/fonts/misc/ter-112n.pcf.gz")
		set guifont=Terminus\ 8
	endif
	imap <C-S-v> <C-r>+
	vmap <C-S-c> "+y
endif

autocmd BufNewFile,BufRead /home/gavin/cs164/*,/home/gavin/src/f15/cs164/*,/home/gavin/src/s16/eecs151/* setlocal expandtab
autocmd BufNewFile,BufRead /home/gavin/appstuff/him/* setlocal noexpandtab
