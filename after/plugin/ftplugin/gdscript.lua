local lspconfig = require('lspconfig')
lspconfig.gdscript.setup {}

-- local pipepath = vim.fn.stdpath("/tmp/godot.pipe")
if not vim.loop.fs_stat("/tmp/godot.pipe") then
  vim.fn.serverstart("/tmp/godot.pipe")
end
