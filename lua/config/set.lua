vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Save swap files to ~/.config/.nvim/tmp
-- The double slash prevents conflicts if 2 files have the same name
vim.backupdir = "~/.config/nvim/tmp//,."
vim.directory = "~/.config/nvim/tmp//,."
vim.undodir = "~/.config/nvim/undo//,."

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- Use case insensitive search unless the search contains a capital letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Toggle for a save instead of failing the command
vim.opt.confirm = true
