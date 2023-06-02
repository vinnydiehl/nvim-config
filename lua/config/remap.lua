-- The best leader key
vim.g.mapleader = " "

-- ; will work like : for commands
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })

-- Backspace/Enter to place newline above/below the cursor
vim.keymap.set("n", "<BS>", "O<Esc>j", { noremap = true })
vim.keymap.set("n", "<Enter>", "o<Esc>k", { noremap = true })

-- Wrapped lines go up/down to the next row rather than next line in file
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Press - followed by a character to insert that single character
vim.keymap.set("n", "-", ":<C-U>exec 'normal i'.repeat(nr2char(getchar()), v:count1)<CR>",
               { silent = true, noremap = true })

-- <C-*> to search/replace the current word object (saves to h register)
vim.keymap.set("n", "<C-s>", "hyiw:%s/<C-r>h//g<left><left>", { noremap = true })
-- In visual mode it searches and replaces the highlighted text
vim.keymap.set("v", "<C-s>", "hy:%s/<C-r>h//g<left><left>", { noremap = true })

-- Paste in place of word object
vim.keymap.set("n", "<Leader>pw", "viwp")
vim.keymap.set("n", "<Leader>pW", "viWp")

-- System clipboard copy/pasting
vim.keymap.set("v", "<Leader>yy", '"+y')
vim.keymap.set({ "n", "v" }, "<Leader>pp", '"+p')
-- Whole file
vim.keymap.set("n", "<Leader>ya", "mxggVG\"+y'x")
vim.keymap.set("n", "<Leader>pa", 'ggVG"+p')

-- If you have the cursor on an empty line, enter insert w/ proper whitespace
vim.keymap.set("n", "<C-p>", '"_ddO', { noremap = true })

-- Allow window commands in insert mode
vim.keymap.set("i", "<C-w>", "<C-o><C-w>", { noremap = true })
