-- Debugger interface

local dap = require "dap"
local dapui = require "dapui"

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = os.getenv("HOME") .. "/.config/nvim/dap/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
}

dap.configurations.c = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
    setupCommands = {
      {
         text = "-enable-pretty-printing",
         description =  "enable pretty printing",
         ignoreFailures = false
      }
    }
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
    setupCommands = {
      {
         text = "-enable-pretty-printing",
         description =  "enable pretty printing",
         ignoreFailures = false
      }
    }
  }
}

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "CursorLine", numhl = "Normal" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "Function", linehl = "CursorLine", numhl = "Normal" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "Error", linehl = "CursorLine", numhl = "Normal" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "Number", linehl = "CursorLine", numhl = "Normal" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "SpecialComment", linehl = "CursorLine", numhl = "Normal" })

dapui.setup()
require("nvim-dap-virtual-text").setup()

-- UI
vim.keymap.set("n", "<leader>dd", function() dapui.toggle() end)
vim.keymap.set("n", "<leader>de", function() dapui.eval() end)
vim.keymap.set("v", "<leader>de", function() dapui.eval() end)

-- Breakpoints
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader><leader>db", function() dap.clear_breakpoints() end)

-- Controls
vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
vim.keymap.set("n", "<leader>d2c", function() dap.run_to_cursor() end)
vim.keymap.set("n", "<leader>dn", function() dap.step_over() end)
vim.keymap.set("n", "<leader>dsi", function() dap.step_into() end)
vim.keymap.set("n", "<leader>dso", function() dap.step_out() end)
vim.keymap.set("n", "<leader>dq", function() dap.close() end)
