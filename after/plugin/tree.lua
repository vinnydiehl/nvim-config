vim.keymap.set("n", "<F6>", vim.cmd.NvimTreeFindFileToggle)
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFindFileToggle)
vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeFindFileToggle)

require("nvim-tree").setup({
  hijack_cursor = true,
  view = {
    width = 40,
  },
  filters = { dotfiles = true }
})
