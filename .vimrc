" Make sure we get the full usage of Vi Improved
set nocompatible

" Shows us the last cmd on last line of screen
set showcmd

" Enable VIM filetype detection
filetype on
filetype plugin on

" Enables syntax highlighting
syntax enable

set grepprg=grep\ -nH\ $*

" Turns on the wild menu - Assists in commandline completion
set wildmenu
set wildmode=list:longest:full

" Allow use of mouse
set mouse=a

" Allow backspace operate normally
set backspace=2

" Show line numbers
set number

" Settings for searching
set ignorecase
set smartcase
set incsearch

" Settings for tabs and indenting
" sets tab to use spaces
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set smartindent

" Linebreak at 120 characters
set textwidth=120

" Enables 256 colors in Vim
set t_Co=256

" Smart Comments
set comments=s1:/*,mb:\ *e1x:\ */

" does not redraw during macros
set lazyredraw

" Always shows current position
set ruler

" Shows the matching bracket 
set showmatch

" How many tenths of second to blink
set mat=10

" Return to last edit position when opening files
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal!" g`\"" |
    \ endif

" jj is escape
inoremap jj <esc>

" sets the background color
"highlight Normal ctermfg=white ctermbg=black
set cursorline
"hi CursorLine term=bold cterm=bold guibg=Grey40

" Sets the tag file to be search in the current directory and up
" until it finds a tags file.
" set tags=/home/batorni/Projects/trunk/tags
set tags=./tags;/home/lst/rsc/tags

"Time for themes
" Ooooooohhh Spooky
set background=dark


call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

colorscheme gruvbox

" Maps CTRL + n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" If NERDTree is the last thing open, it closes everything.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Rebind space to begin the FZF with Rg
map <space> :Rg<CR>

" If vim is launched with no files, open NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"let g:gruvbox_contrast_dark = 'hard'
