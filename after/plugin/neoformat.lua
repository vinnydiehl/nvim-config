-- Try node_modules before using a globally installed exe
vim.g.neoformat_try_node_exe = 1

-- Use formatprg (set in the `ftplugin` files)
vim.g.neoformat_try_formatprg = 1

vim.keymap.set("n", "<leader>af", ":Neoformat<CR>")
