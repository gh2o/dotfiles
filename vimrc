set expandtab
set showcmd
set autoindent
set hlsearch
set incsearch
set mouse=a

if has("mouse_sgr")
    set ttymouse=sgr
endif

set nowrap
set ruler
set synmaxcol=400
set scrolloff=3     " lines to display before/after current line
set guioptions-=L   " no left scrollbar

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

nmap <silent> <X1Mouse> <C-o>
nmap <silent> <X2Mouse> <C-i>

set wildmode=longest:full
set wildmenu

set history=10000

set splitbelow
set splitright

let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

set cinoptions=l1

set directory=~/tmp/vim//,.

if has("gui_running")
	colorscheme darkblue
	set guifont=DejaVu\ Sans\ Mono\ 10
	imap <C-S-v> <C-r>+
	vmap <C-S-c> "+y
	nmap <C-S-c> "+yiw
endif

set cursorline
highlight cursorline cterm=bold
highlight linenr     guibg=#103020

"autocmd BufNewFile,BufRead /home/gavin/cs164/*,/home/gavin/src/f15/cs164/*,/home/gavin/src/s16/eecs151/* setlocal expandtab
"autocmd BufNewFile,BufRead /home/gavin/appstuff/him/* setlocal noexpandtab
"autocmd BufNewFile,BufRead *.click setf click

let g:netrw_silent=1
nnoremap <silent> <leader>2 :set ts=2 sw=2<cr>
nnoremap <silent> <leader>4 :set ts=4 sw=4<cr>
nnoremap <silent> <leader>8 :set ts=8 sw=8<cr>

nnoremap Q <Nop>

" plugins! "

let s:dotfiles_dir = fnamemodify(resolve(expand("<sfile>")), ":p:h")
if !filereadable(s:dotfiles_dir . "/vimrc") && isdirectory(s:dotfiles_dir . "/dotfiles")
    " i.e. in docker where .vimrc and dotfiles are bind mounted
    let s:dotfiles_dir .= "/dotfiles"
endif

function! s:add_dir_to_rtp(dir)
    let &runtimepath .= "," . s:dotfiles_dir . "/" . a:dir
endfunction
call s:add_dir_to_rtp("vim-misc")
call s:add_dir_to_rtp("vim-airline")
call s:add_dir_to_rtp("vim-lsp")
call s:add_dir_to_rtp("vim-python-pep8-indent")
call s:add_dir_to_rtp("nerdtree")
call s:add_dir_to_rtp("ctrlp.vim")

" NERDTree "
nnoremap <silent> <leader>l :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " close if only nerdtree remains

" vim-airline "
let g:airline_section_a = airline#section#create_right(['iminsert'])    " no need for displaying mode
let g:airline_highlighting_cache = 1

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
    if g:airline_theme == 'dark'
        " improve inactive mode contrast
        for colors in values(a:palette.inactive)
            if colors[2] == 239
                let colors[0] = "#a8a8a8"
                let colors[2] = 248
            endif
        endfor
    endif
endfunction

" ctrlp "
let g:ctrlp_clear_cache_on_exit = 0         " preserve ctrlp cache
let g:ctrlp_types = ['mru', 'buf', 'fil']   " prioritize mru

let s:vimrc_user = expand("~/.vimrc.user")
if filereadable(s:vimrc_user)
    exec "source " . fnameescape(s:vimrc_user)
endif

" vim-lsp/rust-analyzer "
if executable('rust-analyzer')
    autocmd User lsp_setup call lsp#register_server({
                \   'name': 'Rust Language Server',
                \   'cmd': {server_info->['rust-analyzer']},
                \   'whitelist': ['rust'],
                \   'initialization_options': {'cargo': {'allFeatures': v:true}, 'procMacro': {'enable': v:true}},
                \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " map <C-Space> (also called <C-@> on terminal) to omnifunc
    inoremap <C-Space> <C-x><C-o>
    inoremap <C-@> <C-x><C-o>
endfunction

augroup lsp_install
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
