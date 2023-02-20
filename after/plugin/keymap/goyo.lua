local Remap = require("xanderjakeq.keymap")
local nnoremap = Remap.nnoremap

vim.cmd("let g:goyo_width = 81")
vim.cmd("let g:limelight_default_coefficient = 0.7")

nnoremap("<leader>zen", ":Goyo<CR>")
nnoremap("<leader>ll", ":Limelight!!<CR>")

-- TODO: figure out how to do this in lua
-- autocmd! User GoyoEnter Limelight
-- autocmd! User GoyoLeave Limelight!
