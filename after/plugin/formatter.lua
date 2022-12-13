require('formatter').setup {
    logging = false,
    filetype = {
        typescript = {
            --require('formatter.filetypes.typescript').prettier
            function()
                return {
                    exe = "dprint",
                    args = {"fmt", "--stdin", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                    stdin = true
                }
            end
        },
        typescriptreact = {
            require('formatter.filetypes.typescriptreact').prettierd
        },
        svelte = {
            require('formatter.filetypes.svelte').prettier
        },
        rust = {
            require('formatter.filetypes.rust')
        },
        javascript = {
            require('formatter.filetypes.javascript').prettierd
        },

        javascriptreact = {
            require('formatter.filetypes.javascriptreact').prettierd
        },
        css = {
            require('formatter.filetypes.css').prettierd
        },
        python = {
            require('formatter.filetypes.python').black
        },
    }
}
