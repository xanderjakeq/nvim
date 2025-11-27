local lspconfig = vim.lsp.config
local lsp_configs = require 'lspconfig.configs'

lsp_configs.pyrefly = {
  default_config = {
    cmd = { 'uv', 'run', 'pyrefly', 'lsp' },
    filetypes = { 'python' },
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end,
    settings = {},
  },
}

-- lspconfig.ctags_lsp.setup {
--   filetyes = {
--     'rust',
--   },
-- }

lspconfig.html = {
  filetyes = { 'html', 'templ', 'htmldjango' },
}

lspconfig.gdscript = {
  name = 'godot',
  cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
}
-- recogniez html as html instead of any other format
vim.filetype.add {
  extension = {
    html = 'html',
  },
}
