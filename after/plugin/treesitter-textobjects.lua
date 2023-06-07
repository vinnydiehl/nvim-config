require("nvim-treesitter.configs").setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
        ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },

        ["ac"] = { query = "@comment.outer", desc = "Select a comment" },
        ["ic"] = { query = "@comment.outer", desc = "Select a comment" },

        ["aC"] = { query = "@class.outer", desc = "Select outer part of a class region" },
        ["iC"] = { query = "@class.inner", desc = "Select inner part of a class region" },

        ["ab"] = { query = "@block.outer", desc = "Select outer part of a block" },
        ["ib"] = { query = "@block.inner", desc = "Select inner part of a block" },

        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" }
      },

      -- Default: charwise, "V" for linewise, "<C-v>" for blockwise
      selection_modes = {
        ["@function.inner"] = "V",
        ["@function.outer"] = "V",

        ["@comment.outer"] = "V",

        ["@class.inner"] = "V",
        ["@class.outer"] = "V",

        ["@block.inner"] = "V",
        ["@block.outer"] = "V"
      }
    },

    swap = {
      enable = true,
      swap_next = {
        ["<leader>]f"] = "@function.outer",
        ["<leader>]c"] = "@class.outer",
        ["<leader>]b"] = "@block.outer",
        ["<leader>]a"] = "@parameter.inner"
      },
      swap_previous = {
        ["<leader>[f"] = "@function.outer",
        ["<leader>[c"] = "@class.outer",
        ["<leader>[b"] = "@block.outer",
        ["<leader>[a"] = "@parameter.inner"
      }
    },

    move = {
      enable = true,
      set_jumps = false,

      -- These work better than the built-in ones
      goto_next_start = { ["]m"] = { query = "@function.inner", desc = "Next function start" } },
      goto_next_end = { ["]M"] = { query = "@function.inner", desc = "Next function end" } },
      goto_previous_start = { ["[m"] = { query = "@function.inner", desc = "Previous function start" } },
      goto_previous_end = { ["[M"] = { query = "@function.inner", desc = "Previous function end" } }
    }
  }
}
