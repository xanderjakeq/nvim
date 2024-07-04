local lspconfig = require 'lspconfig'

-- ...
lspconfig.htmx.setup {
  filetyes = { 'html', 'templ', 'htmldjango' },
}

lspconfig.html.setup {
  filetyes = { 'html', 'templ', 'htmldjango' },
}

-- recogniez html as html instead of any other format
vim.filetype.add {
  extension = {
    html = 'html',
  },
}
