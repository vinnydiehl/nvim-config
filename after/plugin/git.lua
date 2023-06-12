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

vim.keymap.set("n", "<leader>gii", "<cmd>Git init<CR>")
vim.keymap.set("n", "<leader>gib", "<cmd>Git init -b ")

vim.keymap.set("n", "<leader>gSS", "<cmd>Git stash<CR>")
vim.keymap.set("n", "<leader>gSs", "<cmd>Git stash<CR>")
vim.keymap.set("n", "<leader>gSp", "<cmd>Git stash pop<CR>")

vim.keymap.set("n", "<leader>gco", "<cmd>Git branch<CR>")
vim.keymap.set("n", "<leader>gb", ":Git checkout -b ")

vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<CR>")
vim.keymap.set("n", "<leader>gcc", "<cmd>Git commit<CR>")
vim.keymap.set("n", "<leader>gc!", "<cmd>Git commit --amend --no-edit<CR>")
vim.keymap.set("n", "<leader>gcm!", "<cmd>Git commit --amend<CR>")
vim.keymap.set("n", "<leader>gca", function()
  vim.cmd("Git add .")
  vim.cmd("Git commit")
end)

vim.keymap.set("n", "<leader>gpo", "<cmd>Git push origin " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gp!o", "<cmd>Git push -f origin " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gpu", "<cmd>Git push upstream " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gp!u", "<cmd>Git push -f upstream " .. branch_name() .. "<CR>")

vim.keymap.set("n", "<leader>gPo", "<cmd>Git pull origin " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gPu", "<cmd>Git pull upstream " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gPro", "<cmd>Git pull --rebase origin " .. branch_name() .. "<CR>")
vim.keymap.set("n", "<leader>gPru", "<cmd>Git pull --rebase upstream " .. branch_name() .. "<CR>")

vim.keymap.set("n", "<leader>gl", "<cmd>Git log --all --graph --decorate --pretty=oneline --abbrev-commit<CR>")
vim.keymap.set("n", "<leader>gL", "<cmd>Git log --all<CR>")

-- Gitsigns

vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<CR>")

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

-- Diffview

require("diffview").setup {
  enhanced_diff_hl = true,
  keymaps = {
    view = { { "n", "q", ":DiffviewClose<CR>",  { desc = "close git diff browser" } } },
    file_panel = { { "n", "q", ":DiffviewClose<CR>",  { desc = "close git diff browser" } } },
    file_history_panel = { { "n", "q", ":DiffviewClose<CR>",  { desc = "close git diff browser" } } }
  }
}

vim.opt.fillchars:append { diff = "╱" }

vim.cmd [[highlight DiffviewDiffAddAsDelete guibg=#cc9393]]
vim.cmd [[highlight DiffviewDiffDelete guibg=#3a3a3a guifg=#303030]]

vim.keymap.set("n", "<leader>gdd", ":DiffviewOpen<CR>", { desc = "open git diff browser" })
vim.keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>", { desc = "close git diff browser" })
vim.keymap.set("n", "<leader>gdl", ":Telescope git_diffs diff_commits<CR>", { desc = "browse commit log and select a diff" })

-- GitHub Integration

vim.cmd [[highlight OctoEditable ctermbg=none guibg=#3a3a3a]]

require("octo").setup()

vim.keymap.set("n", "<leader>ilo", ":Octo issue list<CR>", { desc = "list open GitHub issues" })
vim.keymap.set("n", "<leader>ilc", ":Octo issue list states=CLOSED<CR>", { desc = "list closed GitHub issues" })
vim.keymap.set("n", "<leader>ila", ":Octo issue list states=OPEN,CLOSED<CR>", { desc = "list all GitHub issues" })

vim.keymap.set("n", "<leader>pro", ":Octo pr list<CR>", { desc = "list open GitHub pull requests" })
vim.keymap.set("n", "<leader>prc", ":Octo pr list states=CLOSED<CR>", { desc = "list closed GitHub pull requests" })
vim.keymap.set("n", "<leader>pra", ":Octo pr list states=OPEN,CLOSED<CR>", { desc = "list all GitHub pull requests" })

-- gitignore.nvim

vim.keymap.set("n", "<leader>gig", "<cmd>Gitignore<CR>")
