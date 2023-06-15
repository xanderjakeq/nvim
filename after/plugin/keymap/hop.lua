local Remap = require("xanderjakeq.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

local hop = require('hop')

local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})


nnoremap("<C-h>w", ":HopWord<cr>")
nnoremap("<C-h>c", ":HopChar1<cr>")
nnoremap("<C-h>l", ":HopLine<cr>")
nnoremap("<C-h>/", ":HopPattern<cr>")

vnoremap("<C-h>w", "<cmd>HopWord<cr>")
vnoremap("<C-h>c", "<cmd>HopChar1<cr>")
vnoremap("<C-h>l", "<cmd>HopLine<cr>")
vnoremap("<C-h>/", "<cmd>HopPattern<cr>")
