local dap = require "dap"
local dapui = require "dapui"

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = os.getenv("HOME") .. "/.config/nvim/dap/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
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
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    setupCommands = {
      {
         text = "-enable-pretty-printing",
         description =  "enable pretty printing",
         ignoreFailures = false
      }
    }
  }
}

require("dapui").setup()
require("nvim-dap-virtual-text").setup()

vim.keymap.set("n", "<leader>dd", function() dapui.toggle() end)
vim.keymap.set("n", "<leader>de", function() dapui.eval() end)
vim.keymap.set("v", "<leader>de", function() dapui.eval() end)

vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
vim.keymap.set("n", "<leader>dn", function() dap.step_over() end)
vim.keymap.set("n", "<leader>dsi", function() dap.step_into() end)
vim.keymap.set("n", "<leader>dso", function() dap.step_out() end)
