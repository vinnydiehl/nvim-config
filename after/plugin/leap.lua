require("leap").setup {}
require("flit").setup()
require("leap-spooky").setup {
  affixes = {
    magnetic = { window = "m", cross_window = "M" },
    remote = { window = "g", cross_window = "G" }
  },
}

vim.keymap.set({ "n", "x", "o" }, "\\", "<Plug>(leap-forward-to)", { silent = true, desc = "Leap forward to" })
vim.keymap.set({ "n", "x", "o" }, "|", "<Plug>(leap-backward-to)", { silent = true, desc = "Leap backward to" })
vim.keymap.set({ "x", "o" }, "<leader>\\", "<Plug>(leap-forward-till)", { silent = true, desc = "Leap forward till" })
vim.keymap.set({ "x", "o" }, "<leader>|", "<Plug>(leap-backward-till)", { silent = true, desc = "Leap backward till" })
vim.keymap.set({ "n", "x", "o" }, "<leader><leader>\\", "<Plug>(leap-cross-window)", { silent = true, desc = "Leap cross window" })
vim.keymap.set({ "n", "x", "o" }, "<leader><leader>|", "<Plug>(leap-from-window)", { silent = true, desc = "Leap cross window" })
