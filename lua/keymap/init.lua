require 'keymap.harpoon'
local Remap = require 'keymap.remap'
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

nnoremap('<leader>lg', ':FloatermToggle<CR>')

-- netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.keymap.set('x', '<leader>p', '"_dP')

nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
