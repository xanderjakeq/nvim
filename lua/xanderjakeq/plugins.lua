local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself

    --config editor based on .editorconfig within project root
    use 'editorconfig/editorconfig-vim'

    use 'habamax/vim-godot'

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    -- use {'tzachar/cmp-tabnine', after = "nvim-cmp", run='powershell ./install.ps1', requires = 'hrsh7th/nvim-cmp'}

    use {
        'onsails/lspkind.nvim'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    --formatting
    use { 'mhartington/formatter.nvim' }

    -- You can specify rocks in isolation
    use_rocks 'penlight'
    use_rocks { 'lua-resty-http', 'lpeg' }

    -- Local plugins can be included
    --use '~/projects/personal/hover.nvim'

    -- Plugins can have post-install/update hooks
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

    -- You can alias plugin names
    use {
        { 'dracula/vim',              as = 'dracula' },
        { 'morhetz/gruvbox',          as = 'gruvbox' },
        { 'rebelot/kanagawa.nvim',    as = 'kanagawa' },
        { 'eddyekofo94/bogster.nvim', as = 'bogster' },
        { 'savq/melange',             as = 'melange' }
    }

    use {
        'junegunn/goyo.vim',
        'junegunn/limelight.vim'
    }


    use {
        'voldikss/vim-floaterm'
    }

    use {
        'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'ThePrimeagen/vim-be-good'
    }

    use {
        'evanleck/vim-svelte', branch = 'main',
        'yuezk/vim-js',
        'HerringtonDarkholme/yats.vim',
        'maxmellon/vim-jsx-pretty',
    }

    use {
        { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } },
        'vim-airline/vim-airline-themes',
        'bling/vim-bufferline',
    }

    use {
        'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    -- debugger
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
