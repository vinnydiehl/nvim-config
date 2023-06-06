-- The best leader key
vim.g.mapleader = " "

-- ; will work like : for commands
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })

-- \ to the old ; bind
vim.keymap.set("n", "\\", ";", { noremap = true })

-- Backspace/Enter to place newline above/below the cursor
vim.keymap.set("n", "<BS>", "O<Esc>j", { noremap = true })
vim.keymap.set("n", "<Enter>", "o<Esc>k", { noremap = true })

-- Wrapped lines go up/down to the next row rather than next line in file
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Press - followed by a character to insert that single character
vim.keymap.set("n", "-", ":<C-U>exec 'normal i'.repeat(nr2char(getchar()), v:count1)<CR>",
               { silent = true, noremap = true })

-- <C-s> to search/replace the current word object (saves to h register)
vim.keymap.set("n", "<C-s>", '"hyiw:%s/<C-r>h//g<left><left>', { noremap = true })
-- In visual mode it searches and replaces the highlighted text
vim.keymap.set("v", "<C-s>", '"hy:%s/<C-r>h//g<left><left>', { noremap = true })

-- Paste in place of word object
vim.keymap.set("n", "<Leader>pw", "viwp")
vim.keymap.set("n", "<Leader>pW", "viWp")

-- Paste without replacing your buffer
vim.keymap.set("x", "<Leader>px", '"_dP')

-- System clipboard copy/pasting
vim.keymap.set("v", "<Leader>yy", '"+y')
vim.keymap.set({ "n", "v" }, "<Leader>pp", '"+p')
-- Primary selection
vim.keymap.set("v", "<Leader>y1", '"*y')
vim.keymap.set({ "n", "v" }, "<Leader>p1", '"*p')
-- Whole file
vim.keymap.set("n", "<Leader>ya", "mxggVG\"+y'x")
vim.keymap.set("n", "<Leader>pa", 'ggVG"+p')

-- If you have the cursor on an empty line, enter insert w/ proper whitespace
vim.keymap.set("n", "<C-p>", '"_ddO', { noremap = true })

-- Allow window commands in insert mode
vim.keymap.set("i", "<C-w>", "<C-o><C-w>", { noremap = true })

-- Keep cursor in place when joining
vim.keymap.set("n", "J", "mxJ`x", { noremap = true })
-- Keep cursor in the middle when half-page jumping
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
-- Keep search terms in the middle when using n/N
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })

-- Quickfix binds
vim.keymap.set("n", "<C-Up>", "<Cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-Down>", "<Cmd>cprev<CR>zz")
vim.keymap.set("n", "<M-Up>", "<Cmd>lnext<CR>zz")
vim.keymap.set("n", "<M-Down>", "<Cmd>lprev<CR>zz")

-- Make current file executable
vim.keymap.set("n", "<Leader>x", "<Cmd>!chmod +x %<CR>")

-- Paste markdown link around selected text
vim.keymap.set("x", "<leader>l", "<Esc>`>a](<C-r>*)<C-o>`<[<Esc>")

-- Make escape work in terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
