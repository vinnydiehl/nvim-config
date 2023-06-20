local neotest = require "neotest"

neotest.setup {
  adapters = {
    require("neotest-rspec"),
    require("neotest-rust")
  }
}

vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end)
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand "%") end)
vim.keymap.set("n", "<leader>ta", function() neotest.run.run(vim.fn.getcwd()) end)

vim.keymap.set("n", "<leader>to", function() neotest.output.open() end)
vim.keymap.set("n", "<leader>tO", function() neotest.output_panel.toggle() end)
vim.keymap.set("n", "<leader><leader>to", function() neotest.output_panel.toggle() end)
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end)
