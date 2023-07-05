local function run_in_split(filename)
  vim.cmd("botright vs")
  vim.cmd("terminal ".. filename)
  vim.cmd("normal! A")
end

local function run_in_kitty(filename)
    -- Asynchronously launch the process in a new terminal window
    local cwd = vim.fn.getcwd()
    local job_id = vim.fn.jobstart(
      string.format("kitty --hold -d '%s' -e './%s'", cwd, filename), {
        cwd = cwd,
        detach = true
      }
    )

    -- Close the channel so it doesn't block Neovim
    vim.fn.chanclose(job_id)
end

-- SingleCompile binds

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
    run_in_split("./%<")
  else
    vim.cmd("cc")
  end
end)

vim.keymap.set("n", "<leader>cR", function()
  vim.cmd("silent SCCompile")

  if vim.v.shell_error == 0 then
    run_in_kitty(vim.fn.expand("%:t:r"))
  else
    vim.cmd("cc")
  end
end)

-- GNU Make binds
-- Uses the `run` target to get the name of the executable

local function try_make(callback)
  local make_output = vim.fn.systemlist("make")

  if vim.v.shell_error == 0 then
    callback()
  elseif #make_output > 0 then
    error('Compilation failed: ' .. vim.fn.join(make_output, '\n'))
  else
    error('Compilation failed.')
  end
end

vim.keymap.set("n", "<leader>mm", function()
  try_make(function() print("Compilation successful.") end)
end)

vim.keymap.set("n", "<leader>mr", function()
  try_make(function()
    local run_cmd = vim.fn.system("make -n run")
    run_in_split(run_cmd)
  end)
end)

vim.keymap.set("n", "<leader>mR", function()
  try_make(function()
    -- sub removes the trailing newline
    run_in_kitty(vim.fn.system("make -n run"):sub(1, -2))
  end)
end)
