-- Must be set up before lspconfig
require("neodev").setup()

local cmp = require "cmp"
local goto_preview = require "goto-preview"
local lsp = require "lsp-zero"
local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.preset("recommended")

-- The basics
lsp.ensure_installed({
  "bashls",        -- Shell
  "clangd",        -- C/C++
  "cssls",         -- CSS/SCSS
  "cssmodules_ls", -- CSS autocompletion
  "emmet_ls",      -- https://emmet.io/
  "html",          -- HTML
  "jsonls",        -- JSON
  "lua_ls",        -- Lua
  "rust_analyzer", -- Rust
  "solargraph",    -- Ruby
  "tsserver",      -- JavaScript/TypeScript
  "vimls",         -- Vimscript
  "yamlls"         -- YAML
})

lsp.setup_nvim_cmp({ mapping = lsp.defaults.cmp_mappings({
  ["<C-e>"] = cmp.mapping.abort(),
  ["<Enter>"] = cmp.mapping.confirm({ select = false }),
  ["<C-Space>"] = cmp.mapping.confirm({ select = true })
}) })

lsp.set_preferences({
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I"
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gtd", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "<C-]>", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() goto_preview.goto_preview_definition() end, opts)
  vim.keymap.set("n", "<Leader>K", function() goto_preview.goto_preview_type_definition() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
goto_preview.setup {}
require("fidget").setup {}

vim.diagnostic.config({
  virtual_text = true
})

-- Language Server Setups

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      telemetry = { enable = false }
    }
  }
}

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "eruby", "html" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L284
        ["bem.enabled"] = true,
        ["output.selfClosingStyle"] = "xhtml"
      },
    },
  }
})
