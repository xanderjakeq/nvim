-- normal mode
vim.api.nvim_set_keymap("n", "sw", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "sb", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "sj", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "sk", "<cmd>HopLineBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "S", "<cmd>HopPattern<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "gs", "<cmd>HopWordMW<CR>", {noremap=true})

-- visual mode
vim.api.nvim_set_keymap("v", "sw", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "sb", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "sj", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "sk", "<cmd>HopLineBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "S", "<cmd>HopPattern<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "gs", "<cmd>HopWordMW<CR>", {noremap=true})
