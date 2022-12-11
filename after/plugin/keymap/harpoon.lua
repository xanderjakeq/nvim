local nnoremap = require("xanderjakeq.keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>ha", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<C-h>", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap("<leader>tc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, silent)

nnoremap("<C-n>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<C-e>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<C-i>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<C-o>", function() require("harpoon.ui").nav_file(4) end, silent)
