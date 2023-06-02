local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

vim.keymap.set("n", "<Leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<Leader><C-e>", ":Telescope harpoon marks<CR>")

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-b>", function() ui.nav_file(4) end)

vim.keymap.set("n", "<Leader><C-h>", function() mark.rm_file(1) end)
vim.keymap.set("n", "<Leader><C-t>", function() mark.rm_file(2) end)
vim.keymap.set("n", "<Leader><C-n>", function() mark.rm_file(3) end)
vim.keymap.set("n", "<Leader><C-b>", function() mark.rm_file(4) end)
