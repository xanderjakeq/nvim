"gg"revert to .vimrc
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

set path+=**


nnoremap gf :vertical wincmd f<CR>

" set space to <leader> key
nnoremap <SPACE> <Nop>
let mapleader = " "

if has('win32') || has('win64')
    "set shell=\"/c/Program\ Files/Git/bin/bash.exe\"
else
    set shell=/bin/bash
endif

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" single statusline
set laststatus=3

" Add Plugins
lua require('xanderjakeq')

"Apply theme
syntax on
colorscheme gruvbox

"transparent background
highlight Normal guibg=none


let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" lazygit https://www.youtube.com/watch?v=hwC4JduRHyg
nnoremap <leader>lg :FloatermNew lazygit<CR>


"let $SKIM_DEFAULT_COMMAND = "rg --hidden -l '' -g '!.git' -g '!.trunk' "
"command! -bang -nargs=* Ag call fzf#vim#ag_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))
"command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))

"command! -bang PFiles call fzf#vim#gitfiles('./', <bang>0)

" fzf or skim
"nnoremap <leader>f :Files<CR>
"nnoremap <leader>g :GFiles<CR>
"nnoremap <leader>b :Buffers<CR>
"nnoremap <leader>rg :Rg<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>rg <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

"netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
nnoremap <leader>eo :Ex<CR>
nnoremap <leader>er :Rex<CR>

"buffer nav
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

"tabs
nnoremap <leader>nt :tabnew<CR>
nnoremap <leader>lt :tabs<CR>

"move lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

nnoremap <silent>K :Lspsaga hover_doc<CR>

augroup xanderjakeq
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e "remove trailing whitespace
augroup END



