local Remap = require("xanderjakeq.keymap")
local nnoremap = Remap.nnoremap

-- lazygit https://www.youtube.com/watch?v=hwC4JduRHyg
nnoremap("<leader>lg", ":FloatermNew lazygit<CR>")

-- netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.keymap.set("x", "<leader>p", "\"_dP")

nnoremap("<leader>o", ":Oil<cr>")
nnoremap("<leader>er", ":Rex<cr>")

-- tabs
nnoremap("<leader>nt", ":tabnew<cr>")
nnoremap("<leader>lt", ":tabs<cr>")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
