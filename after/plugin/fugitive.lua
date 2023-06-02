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
vim.keymap.set("n", "<leader>gpo", "<Cmd>Git push origin " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gpu", "<Cmd>Git push upstream " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gl", "<Cmd>Git log --graph --decorate --pretty=oneline --abbrev-commit<CR>")
vim.keymap.set("n", "<leader>gb", ":Git branch ")
