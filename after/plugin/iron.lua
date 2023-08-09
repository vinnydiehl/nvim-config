require("iron.core").setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,

    repl_definition = {
      sh = { command = { "zsh" } },
      ruby = { command = { "irb" } },
      python = { command = { "python3" } },
      haskell = {
        command = function(meta)
          local file = vim.api.nvim_buf_get_name(meta.current_bufnr)
          -- call `require` in case iron is set up before haskell-tools
          return require("haskell-tools").repl.mk_repl_cmd(file)
        end
      }
    },

    -- Display right vertical split
    repl_open_cmd = require("iron.view").split.vertical.botright(80),
  },
  keymaps = {
    send_motion = "<leader>rsc",
    visual_send = "<leader>rsc",
    send_file = "<leader>rsf",
    send_line = "<leader>rsl",
    send_until_cursor = "<leader>rsu",
    send_mark = "<leader>rsm",
    mark_motion = "<leader>rmc",
    mark_visual = "<leader>rmc",
    remove_mark = "<leader>rmd",
    cr = "<leader>r<cr>",
    interrupt = "<leader>r<leader>",
    exit = "<leader>rsq",
    clear = "<leader>rcl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

vim.keymap.set("n", "<leader>rr", "<cmd>IronRepl<cr><cmd>IronFocus<cr>A")
vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>")
