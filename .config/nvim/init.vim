call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let mapleader = ";"

colorscheme onedark
syntax on

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

set cmdheight=2
set updatetime=300

" Editor
filetype plugin indent on
set autoindent
set timeoutlen=300
set encoding=utf-8

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes
" Sane splits
set splitright
set splitbelow
" Persist undo
set undodir=~/.vimdid
set undofile

set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use wide tabs
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" GUI
set ttyfast
set number
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.

" Keyboard shortcuts
" Ctrl-H stop search
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

map H ^
map L $


" Find symbol of current document.
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>

" Scroll documentation
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Left>"

" Run cargo clippy
nnoremap <silent><leader>c :!cargo clippy <CR>
" Run cargo fmt
nnoremap <silent><leader>f :!cargo fmt --all <CR>
" Manually trigger CocAction
nnoremap <silent><leader>a :CocAction <CR>
" Open dir
nnoremap <silent><leader>j :NERDTree <CR>
" Rename ref
nmap <leader>rn <Plug>(coc-rename)
" Manually trigger intellisense
inoremap <silent><expr> <c-space> coc#refresh()
" Manually close intellisense
inoremap <expr><Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" Allow for ESC in terminal
tnoremap <Esc> <C-\><C-n>
" Remap for copying
vnoremap  <leader>y "+y
nnoremap <leader>y "+y
" Remap for pasting
vnoremap <leader>p "+p
nnoremap <leader>p "+p
" Remap for scrolling
map <S-Left> <C-E>
" Remap for scrolling
map <S-Right> <C-Y>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

autocmd CursorHold * silent call CocActionAsync('highlight')
