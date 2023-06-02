-- Delete trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]]
})

-- Reload .Xresources on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { ".Xresources" },
  command = [[!xrdb ~/.Xresources]]
})
