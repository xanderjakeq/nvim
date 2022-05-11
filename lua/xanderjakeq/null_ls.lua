local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

local function prettier_condition(utils)
  -- See https://prettier.io/docs/en/configuration.html
  local files = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.js',
    '.prettierrc.cjs',
    '.prettier.config.js',
    '.prettier.config.cjs',
    '.prettierrc.toml',
  }

  return utils.has_file(files) or utils.root_has_file(files)
end

null_ls.setup({
  sources = {
    formatting.prettier
    --.with({
    --    --condition = prettier_condition,
    --    runtime_condition = function(params)
    --        local utils = require("null-ls.utils")
    --        -- use whatever root markers you want to check - these are the defaults
    --        local root = utils.root_pattern(".null-ls-root", "Makefile", ".git")(params.bufname)
    --        return root and utils.path.exists(utils.path.join(root, ".prettierrc"))
    --    end
    --}),
    ,
    formatting.black, formatting.gofmt, formatting.shfmt,
    formatting.clang_format, formatting.cmake_format, formatting.rustfmt,
    formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        '--break-after-table-lb', '--indent-width=4'
      }
    }), formatting.isort, formatting.codespell.with({filetypes = {'markdown'}})
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
    end
    --vim.cmd [[
    --  augroup document_highlight
    --    autocmd! * <buffer>
    --    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --  augroup END
    --]]
  end
})
