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

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  --config editor based on .editorconfig within project root
  use 'editorconfig/editorconfig-vim'

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    --'glepnir/lspsaga.nvim',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin
    {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  }

  use {
    'onsails/lspkind.nvim'
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  --formatting
  use {
    --'jose-elias-alvarez/null-ls.nvim'
    'sbdchd/neoformat',
    {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'}
  }

  -- Plugins can have dependencies on other plugins
  --use {
  --  'haorenW1025/completion-nvim',
  --  opt = true,
  --  requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  --}

  -- Plugins can also depend on rocks from luarocks.org:
  --use {
  --  'my/supercoolplugin',
  --  rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  --}

  use {
    'phaazon/hop.nvim',
     branch = 'v2', -- optional but strongly recommended
     config = function()
       -- you can configure Hop the way you like here; see :h hop-config
       require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
     end
   }

  -- You can specify rocks in isolation
  use_rocks 'penlight'
  use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  --use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  use {
      {'dracula/vim', as = 'dracula'},
      {'morhetz/gruvbox', as = 'gruvbox'}
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

  --use {
  --  'lotabout/skim', run = '~/.skim/install',
  --  'lotabout/skim.vim',
  --  'voldikss/vim-floaterm',
  --  'airblade/vim-rooter'
  --}

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
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
    {'vim-airline/vim-airline', as = 'airline'},
    --'vim-syntastic/syntastic',
    'vim-airline/vim-airline-themes',
    'bling/vim-bufferline',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
