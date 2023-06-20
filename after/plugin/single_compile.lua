vim.keymap.set("n", "<leader>cc", function()
  vim.cmd("silent SCCompile")

  if vim.v.shell_error == 0 then
    print("Compilation successful.")
  else
    vim.cmd("cc")
  end
end)

vim.keymap.set("n", "<leader>cr", function()
  vim.cmd("silent SCCompile")

  if vim.v.shell_error == 0 then
    vim.cmd("botright vs")
    vim.cmd("terminal ./%<")
    vim.cmd("normal! A")
  else
    vim.cmd("cc")
  end
end)

vim.keymap.set("n", "<leader>cR", function()
  vim.cmd("silent SCCompile")

  if vim.v.shell_error == 0 then
    -- Asynchronously launch the process in a new terminal window
    local cwd = vim.fn.getcwd()
    local job_id = vim.fn.jobstart(
      string.format("kitty --hold -d '%s' -e './%s'", cwd, vim.fn.expand("%:t:r")), {
        cwd = cwd,
        detach = true
      }
    )
    vim.fn.chanclose(job_id)
  else
    vim.cmd("cc")
  end
end)
