local builtin = require "telescope.builtin"
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

require("telescope").load_extension("harpoon")
require("telescope").load_extension("live_grep_args")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})

vim.keymap.set("v", "<leader>ps", builtin.grep_string, {})
vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string { search = vim.fn.input "Grep > " }
end)

vim.keymap.set("n", "<leader>pl", builtin.live_grep, {})
vim.keymap.set("v", "<leader>pl", live_grep_args_shortcuts.grep_visual_selection)
vim.keymap.set("n", "<leader>pw", live_grep_args_shortcuts.grep_word_under_cursor)
