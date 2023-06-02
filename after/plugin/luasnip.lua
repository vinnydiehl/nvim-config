require("luasnip.loaders.from_vscode").lazy_load()

local ls = require "luasnip"

ls.config.set_config {
  updateevents = "TextChanged,TextChangedI"
}

-- Expand current item or jump to next item within the snippet
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- Jump backwards within snippet
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- Select within a list of options
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- Source this file
vim.keymap.set("n", "<Leader><Leader>s", "<Cmd>so ~/.config/nvim/after/plugin/luasnip.lua<CR>")
