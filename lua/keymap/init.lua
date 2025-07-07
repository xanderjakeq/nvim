require 'keymap.harpoon'
local Remap = require 'keymap.keymap'
local nnoremap = Remap.nnoremap

-- nnoremap('<leader>lg', ':FloatermNew lazygit<CR>')
-- nnoremap('<leader>lg', ':FloatermNew gitui<CR>')
nnoremap('<leader>lg', ':FloatermNew nu<CR>')

-- netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.keymap.set('x', '<leader>p', '"_dP')

nnoremap('<leader>o', ':Oil<cr>')
nnoremap('<leader>er', ':Rex<cr>')

nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
