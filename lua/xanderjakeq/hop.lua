-- normal mode
vim.api.nvim_set_keymap("n", "<leader>sw", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>sb", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>sj", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>sk", "<cmd>HopLineBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>S", "<cmd>HopPattern<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>HopWordMW<CR>", {noremap=true})

-- visual mode
vim.api.nvim_set_keymap("v", "<leader>sw", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<leader>sb", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<leader>sj", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<leader>sk", "<cmd>HopLineBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<leader>S", "<cmd>HopPattern<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<leader>gs", "<cmd>HopWordMW<CR>", {noremap=true})
