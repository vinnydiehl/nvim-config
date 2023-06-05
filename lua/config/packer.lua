vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Bootstrap packer
  use "wbthomason/packer.nvim"

  -- Colors
  use {
    "phha/zenburn.nvim",
    config = function() require("zenburn").setup() end
  }

  -- Fuzzy search
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim"}
    }
  }

  -- LSP configuration
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim", run = ":MasonUpdate" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
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
  use {
    "sudormrfbin/cheatsheet.nvim",
    requires = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    }
  }

  -- Debugger
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use { "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap" } }

  -- Disable Netrw to prevent race condition with nvim-tree
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  use "chrisbra/unicode.vim"
  use "fabi1cazenave/suckless.vim"
  use "folke/neodev.nvim"
  use "folke/trouble.nvim"
  use "folke/which-key.nvim"
  use "haya14busa/is.vim"
  use { "kylechui/nvim-surround", tag = "*", config = function() require("nvim-surround").setup() end }
  use "lukas-reineke/indent-blankline.nvim"
  use "mbbill/undotree"
  use { "nelstrom/vim-textobj-rubyblock", requires = "kana/vim-textobj-user" }
  use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/playground"}
  use "rmagatti/goto-preview"
  use "RRethy/nvim-treesitter-endwise"
  use "theprimeagen/harpoon"
  use "tpope/vim-fugitive"
  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"
  use "vim-scripts/argtextobj.vim"
  use { "Wansmer/treesj", config = function() require("treesj").setup() end }
  use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
  use "windwp/nvim-autopairs"
end)
