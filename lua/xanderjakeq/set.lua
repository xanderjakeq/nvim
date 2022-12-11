vim.opt.path = {"**"}

-- set space to <leader> key
vim.g.mapleader = " "

-- uncomment when on windows
-- vim.opt.shell = "/c/Program/Files/Git/bin/bash.exe"

-- Nice menu when typing `:find *.py`
vim.opt.wildmode = {
    'longest',
    'list',
    'full'
}
vim.opt.wildmenu = true

-- Ignore files
vim.opt.wildignore = {
    '*.pyc',
    '*_build/*',
    '**/coverage/*',
    '**/node_modules/*',
    '**/android/*',
    '**/ios/*',
    '**/.git/*',
}

-- single statusline
vim.opt.laststatus = 3
vim.opt.title = true

-- Apply theme
vim.opt.syntax = "on"
vim.cmd("colorscheme kanagawa")

-- transparent background
-- highlight Normal guibg=none

--Prevent unsafe commands
vim.opt.secure = true

-- set smartindent
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.guicursor = ""

vim.opt.relativenumber = true
vim.opt.nu = true

-- set t_Co=256
vim.opt.hidden = true
vim.opt.errorbells = true
--vim.opt.backspace = 2
vim.opt.encoding = "utf-8"
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.termguicolors = true
vim.opt.textwidth = 80
-- set colorcolumn=+1
-- set scrolloff=8
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "+1"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- set exrc
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- need to install xclip for X11 or wl-copy and wl-paste for Wayland
vim.opt.clipboard = "unnamedplus"

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
vim.opt.fileformat = "unix"
vim.opt.compatible = false
vim.opt.sidescroll = 1
