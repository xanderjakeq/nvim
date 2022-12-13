local Remap = require("xanderjakeq.keymap")
local nnoremap = Remap.nnoremap

--nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<leader>f", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>rg", function()
    require('telescope.builtin').live_grep()
end)

nnoremap("<leader>b", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>h", function()
    require('telescope.builtin').help_tags()
end)

nnoremap("<leader>w", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)

nnoremap("<leader>hf", function()
    require('telescope.builtin').find_files({ hidden = true })
end)


--nnoremap("<leader>va", function()
--    require('theprimeagen.telescope').anime_selector()
--end)
--nnoremap("<leader>vc", function()
--    require('theprimeagen.telescope').chat_selector()
--end)
--nnoremap("<leader>gc", function()
--    require('theprimeagen.telescope').git_branches()
--end)
--nnoremap("<leader>gw", function()
--    require('telescope').extensions.git_worktree.git_worktrees()
--end)
--nnoremap("<leader>gm", function()
--    require('telescope').extensions.git_worktree.create_git_worktree()
--end)
--nnoremap("<leader>td", function()
--    require('theprimeagen.telescope').dev()
--end)
