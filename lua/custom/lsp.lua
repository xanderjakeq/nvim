local lspconfig = require 'lspconfig'

-- ...
lspconfig.htmx.setup {
  filetyes = { 'html', 'templ', 'htmldjango' },
}

lspconfig.html.setup {
  filetyes = { 'html', 'templ', 'htmldjango' },
}

lspconfig.gdscript.setup {
  name = 'godot',
  cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
}
-- recogniez html as html instead of any other format
vim.filetype.add {
  extension = {
    html = 'html',
  },
}
