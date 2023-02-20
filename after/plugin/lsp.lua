local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'sumneko_lua',
  'rust_analyzer',
  'pyright',
  'svelte',
})

-- nvim-cmp setup
local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local cmp_sources = {
    --{ name = 'cmp_tabnine' }, -- add tabnine
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
}

local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
}

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = cmp_sources,
    formatting = {
        format = function(entry, vim_item)
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = ''
            end
            vim_item.menu = menu
            return vim_item
        end
    }
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', 'E', function() vim.diagnostic.open_float() end, opts)
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set('n', '<space>q', function() vim.diagnostic.setloclist() end, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local _opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd [[ LspStop eslint ]]
      return
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set( 'n', 'gD', function() vim.lsp.buf.declaration() end, _opts)
  vim.keymap.set( 'n', 'gd', function() vim.lsp.buf.definition() end, _opts)
  vim.keymap.set( 'n', 'K', function() vim.lsp.buf.hover() end, _opts)
  vim.keymap.set( 'n', 'gi', function() vim.lsp.buf.implementation() end, _opts)
  vim.keymap.set( 'n', '<C-k>', function() vim.lsp.buf.signature_help() end, _opts)
  vim.keymap.set( 'n', '<space>wa', function() vim.lsp.buf.add_workspace_folder() end, _opts)
  vim.keymap.set( 'n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, _opts)
  vim.keymap.set( 'n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, _opts)
  vim.keymap.set( 'n', '<space>D', function() vim.lsp.buf.type_definition() end, _opts)
  vim.keymap.set( 'n', '<space>rn', function() vim.lsp.buf.rename() end, _opts)
  vim.keymap.set( 'n', '<space>ca', function() vim.lsp.buf.code_action() end, _opts)
  vim.keymap.set( 'n', 'gr', function() vim.lsp.buf.references() end, _opts)
  vim.keymap.set( 'n', '<leader><leader>p', function() vim.lsp.buf.format({async = true}) end, _opts)
end

lsp.on_attach(on_attach)

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
