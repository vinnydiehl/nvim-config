vim.cmd [[highlight IndentBlanklineChar guifg=#393939 gui=nocombine]]

require("indent_blankline").setup {
  show_first_indent_level = false,
  use_treesitter = true,
}
