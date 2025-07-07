local harpoon = require 'harpoon'
local harpoon_extensions = require 'harpoon.extensions'

settings = {
  save_on_toggle = true,
  sync_on_ui_close = false,
  key = function()
    return vim.loop.cwd()
  end,
}

-- REQUIRED
harpoon:setup { settings }
-- REQUIRED

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<C-t><C-n>', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<C-t><C-e>', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<C-t><C-i>', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<C-t><C-o>', function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-S-P>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-N>', function()
  harpoon:list():next()
end)

harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
