require("gitsigns").setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]h", function()
      if vim.wo.diff then return "]h" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, {expr=true})

    map("n", "[h", function()
      if vim.wo.diff then return "[h" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, {expr=true})

    -- Actions
    map("n", "<leader>hs", gs.stage_hunk)
    map("n", "<leader>hu", gs.reset_hunk)
    map("n", "<leader>hS", gs.stage_buffer)
    map("n", "<leader>hU", gs.reset_buffer)
    map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)
    map("v", "<leader>hu", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)
    map("n", "<leader>hp", gs.preview_hunk_inline)
    map("n", "<leader>hP", gs.preview_hunk)
    map("n", "<leader>hb", function() gs.blame_line { full = true } end)
    map("n", "<leader>tb", gs.toggle_current_line_blame)
    map("n", "<leader>hd", "<cmd>Gdiff<CR>")
    map("n", "<leader>hD", function() gs.diffthis("~") end)
    map("n", "<leader>td", gs.toggle_deleted)

    -- Text object
    map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end
}

-- Fugitive

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

vim.keymap.set("n", "<leader>gi", "<cmd>Git init<CR>")
vim.keymap.set("n", "<leader>gib", "<cmd>Git init -b ")

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
