local ht = require "haskell-tools"

local def_opts = { noremap = true, silent = true, }
ht.start_or_attach {
  repl = {
    handler = "toggleterm"
  },
  hls = {
    on_attach = function(_, bufnr)
      local opts = vim.tbl_extend("keep", def_opts, { buffer = bufnr })
      -- haskell-language-server relies heavily on codeLenses,
      -- so auto-refresh (see advanced configuration) is enabled by default
      vim.keymap.set("n", "<leader>lcl", vim.lsp.codelens.run, opts)
      vim.keymap.set("n", "<leader>lca", ht.lsp.buf_eval_all, opts)
      vim.keymap.set("n", "<leader>lh", ht.hoogle.hoogle_signature, opts)
    end
  }
}

-- Suggested keymaps that do not depend on haskell-language-server:
local bufnr = vim.api.nvim_get_current_buf()
-- set buffer = bufnr in ftplugin/haskell.lua
local opts = { noremap = true, silent = true, buffer = bufnr }

-- Toggle a GHCi repl for the current package
vim.keymap.set("n", "<leader>lr", ht.repl.toggle, opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set("n", "<leader>lf", function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, def_opts)
-- Query the repl for the type of word under the cursor
vim.keymap.set("n", "<leader>lt", ht.repl.cword_type, opts)
vim.keymap.set("n", "<leader>lq", ht.repl.quit, opts)

-- Detect nvim-dap launch configurations
ht.dap.discover_configurations(bufnr)

vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
