local function branch_name()
  local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
  if branch ~= "" then
    return branch
  else
    return ""
  end
end

vim.api.nvim_create_autocmd({"FileType", "BufEnter", "FocusGained"}, {
  callback = function()
    vim.b.branch_name = branch_name()
  end
})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<leader>gS", "<cmd>Git stash<CR>")
vim.keymap.set("n", "<leader>gSp", "<cmd>Git stash pop<CR>")

vim.keymap.set("n", "<leader>gco", "<cmd>Git branch<CR>")
vim.keymap.set("n", "<leader>gb", ":Git checkout -b ")

vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<CR>")
vim.keymap.set("n", "<leader>gca", function()
  vim.cmd("Git add .")
  vim.cmd("Git commit")
end)

vim.keymap.set("n", "<leader>gpo", "<cmd>Git push origin " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gpof", "<cmd>Git push -f origin " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gpu", "<cmd>Git push upstream " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gpuf", "<cmd>Git push -f upstream " .. branch_name() .. "<CR>")

vim.keymap.set("n", "<leader>gpro", "<cmd>Git pull --rebase origin " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gpru", "<cmd>Git pull --rebase upstream " .. branch_name() .. "<CR>")

vim.keymap.set("n", "<leader>gl", "<cmd>Git log --graph --decorate --pretty=oneline --abbrev-commit<CR>")
