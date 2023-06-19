local ts = require "telescope"
local builtin = require "telescope.builtin"
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

ts.setup {
  extensions = {
    heading = {
      treesitter = true
    },
    repo = {
      list = {
        search_dirs = {
          "~/src",
          "~/.config/nvim",
          "~/.config/zsh"
        }
      },
      settings = { auto_lcd = true }
    }
  }
}

ts.load_extension("env")
ts.load_extension("frecency")
ts.load_extension("fzf")
ts.load_extension("git_diffs")
ts.load_extension("harpoon")
ts.load_extension("heading")
ts.load_extension("ht")
ts.load_extension("live_grep_args")
ts.load_extension("octo")
ts.load_extension("packer")
ts.load_extension("repo")

vim.keymap.set("n", "<leader>P", function() ts.extensions.repo.list {} end)

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>ph", ":Telescope find_files hidden=true<CR>")
vim.keymap.set("n", "<leader><leader>pf", function() ts.extensions.frecency.frecency() end)
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})

vim.keymap.set("v", "<leader>ps", builtin.grep_string, {})
vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string { search = vim.fn.input "Grep > " }
end)

vim.keymap.set("n", "<leader>plg", builtin.live_grep, {})
vim.keymap.set("v", "<leader>pl", live_grep_args_shortcuts.grep_visual_selection)
vim.keymap.set("n", "<leader>plw", live_grep_args_shortcuts.grep_word_under_cursor)

vim.keymap.set("n", "<leader>Te", ":Telescope env<CR>")
vim.keymap.set("n", "<leader>Th", ":Telescope heading<CR>")
vim.keymap.set("n", "<leader>Tp", ":Telescope packer<CR>")
