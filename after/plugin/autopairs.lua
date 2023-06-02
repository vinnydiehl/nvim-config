require("nvim-autopairs").setup {
  check_ts = true
}

-- Indent when pressing enter; uses cmp
require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
