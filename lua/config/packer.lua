vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- Colors
  use { "phha/zenburn.nvim", config = function() require("zenburn").setup() end }

  -- Telescope

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.4",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim"
    }
  }

  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua"
    }
  }

  use {
    "pwntester/octo.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    }
  }

  use {
    "cljoly/telescope-repo.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    }
  }

  use {
    "crispgm/telescope-heading.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  }

  use {
    "nvim-telescope/telescope-packer.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "wbthomason/packer.nvim"
    }
  }

  use {
    "paopaol/telescope-git-diffs.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    }
  }

  use { "LinArcX/telescope-env.nvim", requires = "nvim-telescope/telescope.nvim" }
  use { "wintermute-cell/gitignore.nvim", requires = { "nvim-telescope/telescope.nvim" } }

  -- LeetCode

  use {
    "Dhanus3133/LeetBuddy.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    }
  }

  -- LSP configuration
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      { "williamboman/mason.nvim", run = ":MasonUpdate" },
      "williamboman/mason-lspconfig.nvim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",

      -- Loading status indicator
      { "j-hui/fidget.nvim", tag = "legacy" }
    }
  }

  -- Neotest
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",

      -- Handlers
      "olimorris/neotest-rspec",
      "rouge8/neotest-rust"
    }
  }

  -- Snippets
  use {
    "L3MON4D3/LuaSnip",
    requires = {
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip"
    },
    run = "make install_jsregexp"
  }

  -- Folding

  use {
    "kevinhwang91/nvim-ufo",
    requires = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    }
  }

  use {
    "anuvyklack/fold-preview.nvim",
    requires = "anuvyklack/keymap-amend.nvim",
    config = function() require("fold-preview").setup() end
  }

  -- Status Line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function() require("lualine").setup {} end
  }

  -- Cheat sheet
  -- TODO: This is a fork! Eyes on these PRs:
  -- https://github.com/sudormrfbin/cheatsheet.nvim/pull/32
  -- https://github.com/sudormrfbin/cheatsheet.nvim/pull/34
  use {
    "doctorfree/cheatsheet.nvim",
    requires = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    }
  }

  -- GitHub Gist

  use {
    "rawnly/gist.nvim",
    requires = { "samjwill/nvim-unception", setup = function() vim.g.unception_block_while_host_edits = true end }
  }

  -- Leap

  use {
    "ggandor/flit.nvim",
    requires = {
      "ggandor/leap.nvim",
      "tpope/vim-repeat"
    }
  }

  use {
    "ggandor/leap-spooky.nvim",
    requires = "ggandor/leap.nvim"
  }

  -- tree-sitter text objects
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  }

  -- Text objects for camelCase/snake_case words
  use {
    "Julian/vim-textobj-variable-segment",
    requires = "kana/vim-textobj-user",
  }

  -- Haskell
  use {
    "mrcjkb/haskell-tools.nvim",
    branch = "1.x.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    }
  }

  -- Indentation marker lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    tag = "v2.20.8",
  }

  -- Debugger
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use { "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap" } }

  -- Disable Netrw to prevent race condition with nvim-tree
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- TODO: This is a fork that updates the NERD font Material Design icons to their new
  --       character codes! Keep an eye on this PR and update this plugin to the upstream
  --       repo when it gets merged: https://github.com/simrat39/symbols-outline.nvim/pull/225
  use "anstadnik/symbols-outline.nvim"

  use { "andrewferrier/debugprint.nvim", config = function() require("debugprint").setup {} end }
  use "chrisbra/unicode.vim"
  use "fabi1cazenave/suckless.vim"
  use "folke/neodev.nvim"
  use "folke/trouble.nvim"
  use "folke/which-key.nvim"
  use "haya14busa/is.vim"
  use { "kylechui/nvim-surround", tag = "*", config = function() require("nvim-surround").setup() end }
  use "lewis6991/gitsigns.nvim"
  use "mbbill/undotree"
  use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/playground"}
  use "rmagatti/goto-preview"
  use "RRethy/nvim-treesitter-endwise"
  use "sbdchd/neoformat"
  use "theprimeagen/harpoon"
  use "tpope/vim-fugitive"
  use "tpope/vim-unimpaired"
  use "Vigemus/iron.nvim"
  use { "Wansmer/treesj", config = function() require("treesj").setup() end }
  use "wellle/targets.vim"
  use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
  use "windwp/nvim-autopairs"
  use "xuhdev/SingleCompile"

  -- For my plugins, I use my local copies for development purposes. Unless you have this environment
  -- variable set, this will pull from my GitHub repo instead.
  if os.getenv("VINNYDIEHL_NVIM_PLUGIN_DEV") then
    use "~/src/lua/mit.nvim"
  else
    use "vinnydiehl/mit.nvim"
  end
end)
