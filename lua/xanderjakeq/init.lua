require('xanderjakeq.plugins')
require('xanderjakeq.set')

local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufWritePre"}, {
    group = xanderjakeqGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e", -- remove trailing whitespace
})

