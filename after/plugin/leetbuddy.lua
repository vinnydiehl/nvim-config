require("leetbuddy").setup { language = "rb" }

vim.keymap.set("n", "<leader>lc", "<cmd>LBQuestions<cr>", { desc = "List LeetCode questions" })
vim.keymap.set("n", "<leader>ll", "<cmd>LBQuestion<cr>", { desc = "View LeetCode question" })
vim.keymap.set("n", "<leader>l<backspace>", "<cmd>LBReset<cr>", { desc = "Reset LeetCode code" })
vim.keymap.set("n", "<leader>lt", "<cmd>LBTest<cr>", { desc = "Run LeetCode tests" })
vim.keymap.set("n", "<leader>ls", "<cmd>LBSubmit<cr>", { desc = "Submit LeetCode answer" })
