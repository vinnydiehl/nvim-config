-- Delete trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]]
})

-- Reload .Xresources on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = ".Xresources",
  command = [[!xrdb ~/.Xresources]]
})

-- Disable relative line numbers for insert mode and unfocused windows
vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = [[if &nu && mode() != "i" | set rnu | endif]]
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinEnter" }, {
  pattern = "*",
  command = [[if &nu | set nornu | endif]]
})
