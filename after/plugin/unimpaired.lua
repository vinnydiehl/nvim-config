-- Line movement with arrow keys
-- Single lines:
vim.cmd [[nmap <Up> [e]]
vim.cmd [[nmap <Down> ]e]]
-- Multiple lines:
vim.cmd [[vmap <Up> [egv]]
vim.cmd [[vmap <Down> ]egv]]
vim.cmd [[vmap K [egv]]
vim.cmd [[vmap J ]egv]]
