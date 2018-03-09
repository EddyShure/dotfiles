call plug#begin('~/.cache/nvim')

" Sensible defaults
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'

" Themes
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'

Plug 'vimwiki/vimwiki'
"Plug 'neomake/neomake'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'ledger/vim-ledger'

" fzf
Plug '~/dotfiles/bin/fzf'
Plug 'junegunn/fzf.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax checking/completion
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'rhysd/vim-grammarous'

" Small utils
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'qpkorr/vim-bufkill'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

" Emmet
Plug 'mattn/emmet-vim'

" Elixir
Plug 'slashmili/alchemist.vim'

" Tags
Plug 'ludovicchabant/vim-gutentags'


Plug 'kien/rainbow_parentheses.vim'

" base16-vim
" syntastic
" vim-classpath
" vim-colorschemes
" vim-grammarous
" vim-jade
" vim-jsx
" vim-rspec
" vim-surround


Plug 'morhetz/gruvbox'
let g:gruvbox_italic = 1


call plug#end()

" Set colorscheme
set background=dark
" colorscheme solarized
" colorscheme Monokai
colorscheme gruvbox

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set number
set ruler

" autocmd BufNewFile,BufRead *.md set filetype=markdown

let g:polyglot_disabled = ['latex', 'mason']

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1

" Emmet
function! s:emmet_html_tab()
  return "\<c-y>,"
endfunction

autocmd FileType html,erb,eruby,css,sass,eelixir,javascript.jsx imap <buffer><expr><tab> <sid>emmet_html_tab()

" Rainbow parentheses
" au VimEnter * RainbowParenthesesToggle


" show airline all the time
set laststatus=2

map  <space> <Plug>(easymotion-sn)

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'

let g:alchemist_iex_term_size = 10
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1

let g:jsx_ext_required = 0

:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

autocmd BufNewFile,BufRead *.eex   set syntax=eelixir

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

function Hemingway()
  Goyo
  set linebreak
  set wrap
endfunction

" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Don't clutter my dirs with swp and tmp files
set backupdir=~/.tmp
set directory=~/.tmp

set splitbelow splitright " Open splits below or right by default
set mouse=a " Enable mouse support

colorscheme gruvbox
set background=dark
set inccommand=nosplit

colorscheme gruvbox
"set termguicolors
let g:gruvbox_italic = 1
set background=dark

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:airline#extensions#tabline#enabled = 1

map  <space> <Plug>(easymotion-sn)

" 'Normal' escape in terminal mode
tnoremap <Esc> <C-\><C-N>

let mapleader = ','

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1

filetype plugin on " Load builtin plugins
runtime macros/matchit.vim " Enable builtin enhanced "%" matching

nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>

" Sane file moving
nmap j gj
nmap k gk

" Sane unimpaired mapping
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

"set foldmethod=syntax
" Auto-close folds
" set foldclose=all
"set foldlevel=1

map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFocus<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Autocommit vimwiki
au BufWritePost ~/vimwiki/* Gwrite | Gcommit -m "Auto commit of %:t"

let g:gutentags_cache_dir = "~/.cache/ctags"
