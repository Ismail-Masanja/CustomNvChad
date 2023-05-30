local M = {}

function M.setup()
  local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

  local codelldb_path = mason_path .. "bin/codelldb"
  local liblldb_path = mason_path .. "packages/codelldb/extension/lldb/lib/liblldb"
  local this_os = vim.loop.os_uname().sysname

  -- The path in windows is different
  if this_os:find "Windows" then
    codelldb_path = mason_path .. "packages\\codelldb\\extension\\adapter\\codelldb.exe"
    liblldb_path = mason_path .. "packages\\codelldb\\extension\\lldb\\bin\\liblldb.dll"
  else
    -- The liblldb extension is .so for linux and .dylib for macOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  end

  local opts = {
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
  require("rust-tools").setup { opts }

  local dap = require "dap"
  dap.adapters.codelldb = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
  dap.configurations.rust = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      preLaunchTask = "cargo build",
      postDebugTask = "cargo clean",
      stopOnEntry = false,
    },
  }
end

return M
