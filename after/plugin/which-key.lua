vim.opt.timeoutlen = 3000

require("which-key").setup {
  plugins = {
    presets = {
      operators = false, -- Adds help for operators like d, y, ...
      motions = false,   -- Adds help for motions
      windows = true,    -- Default bindings on <C-w>
      nav = true,        -- Misc bindings to work with windows
      z = true,          -- Bindings for folds, spelling and others prefixed with z
      g = false,         -- Bindings for prefixed with g
    },
  },
}
