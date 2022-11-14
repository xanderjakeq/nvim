"Prevent unsafe commands
set secure

set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab "deletes 4 spaces from tabs
set guicursor=
set relativenumber "shows relative numbers to current line
set number "show line numbers
"set laststatus=2 "for airline
set t_Co=256
set hidden
set noerrorbells
set backspace=2
set encoding=utf-8
set splitbelow
set splitright

set termguicolors
set t_Co=256
set t_ut=
set textwidth=80
set colorcolumn=+1
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set list
set nowrap
"set wrap linebreak "auto wraps at 80th char


set nohlsearch
set incsearch

set exrc
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

set clipboard=unnamedplus

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set fileformat=unix
set nocompatible
"filetype off
filetype plugin indent on
set sidescroll=1
set statusline+=%F

" set dir/ for swap files
set dir^=$HOME/.vim/tmp//

"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
"
"default neovim cursor settimg with minor modification
"set guicursor=n-v-c:block-Cursor,i-ci-ve:ver25-iCursor,r-cr:hor20,o:hor50
set guicursor=n-v-c:block-Cursor,r-cr:hor20,o:hor50
           "\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
           \,sm:block-blinkwait175-blinkoff150-blinkon175

