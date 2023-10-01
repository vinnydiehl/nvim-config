-- The best leader key
vim.g.mapleader = " "

-- ; will work like : for commands
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })

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

-- Yank/paste in place of text object
vim.keymap.set("n", "<leader>yw", "yiw")
vim.keymap.set("n", "<leader>yW", "yiW")
vim.keymap.set("n", '<leader>y"', 'yi"')
vim.keymap.set("n", "<leader>y'", "yi'")
vim.keymap.set("n", "<leader>y)", "ya)")
vim.keymap.set("n", "<leader>y]", "ya]")
vim.keymap.set("n", "<leader>pw", "viwp")
vim.keymap.set("n", "<leader>pW", "viWp")
vim.keymap.set("n", '<leader>p"', 'vi"p')
vim.keymap.set("n", "<leader>p'", "vi'p")
vim.keymap.set("n", "<leader>p)", "va)p")
vim.keymap.set("n", "<leader>p]", "va]p")

-- Paste without replacing your buffer
vim.keymap.set("x", "<leader>px", '"_dP')

-- System clipboard copy/pasting
vim.keymap.set("v", "<leader>yy", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>pp", '"+p')
-- Primary selection
vim.keymap.set("v", "<leader>y1", '"*y')
vim.keymap.set({ "n", "v" }, "<leader>p1", '"*p')
-- Whole file
vim.keymap.set("n", "<leader>ya", ":%y+<cr>")
vim.keymap.set("n", "<leader>pa", 'ggVG"+p')

-- If you have the cursor on an empty line, enter insert w/ proper whitespace
vim.keymap.set("n", "<C-p>", '"_ddO', { noremap = true })

-- Allow window commands in insert mode
vim.keymap.set("i", "<C-w>", "<C-o><C-w>", { noremap = true })

-- Keep cursor in the middle when half-page jumping
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
-- Keep search terms in the middle when using n/N
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
-- When you Ctrl+I/O, have the cursor in the middle of the screen after the jump
vim.keymap.set("n", "<C-i>", "<C-i>zz", { noremap = true })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { noremap = true })

-- Quickfix binds
vim.keymap.set("n", "<C-Up>", "<Cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-Down>", "<Cmd>cprev<CR>zz")
vim.keymap.set("n", "<M-Up>", "<Cmd>lnext<CR>zz")
vim.keymap.set("n", "<M-Down>", "<Cmd>lprev<CR>zz")

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<Cmd>!chmod +x %<CR>")

-- Paste markdown link around selected text
vim.keymap.set("x", "<leader>l", "<Esc>`>a](<C-r>*)<C-o>`<[<Esc>")

-- Make escape work in terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Ctrl+Backspace in insert mode to go back to the end of the last line erasing
-- everything in between
vim.keymap.set("i", "<C-Backspace>", "<C-o>d0<Backspace>")
