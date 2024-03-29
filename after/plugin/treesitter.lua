local configs = require("nvim-treesitter.configs")
configs.setup {
    ensure_installed = { "c", "rust", "javascript", "python", "svelte", "typescript", "toml" },
    sync_install = false,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,     -- false will disable the whole extension
        disable = { "lua" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "yaml" } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        }
    }
}
