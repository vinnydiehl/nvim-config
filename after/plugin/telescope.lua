local ts = require "telescope"
local builtin = require "telescope.builtin"
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

ts.load_extension("harpoon")
ts.load_extension("live_grep_args")
ts.load_extension("frecency")
ts.load_extension("octo")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader><leader>pf", function() ts.extensions.frecency.frecency() end)
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})

vim.keymap.set("v", "<leader>ps", builtin.grep_string, {})
vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string { search = vim.fn.input "Grep > " }
end)

vim.keymap.set("n", "<leader>plg", builtin.live_grep, {})
vim.keymap.set("v", "<leader>pl", live_grep_args_shortcuts.grep_visual_selection)
vim.keymap.set("n", "<leader>plw", live_grep_args_shortcuts.grep_word_under_cursor)
