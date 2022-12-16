local Remap = require("xanderjakeq.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>p", ":Format<cr>")

-- use project linter
nnoremap("<leader>lp", ":silent !pnpm fformat %<cr>")
