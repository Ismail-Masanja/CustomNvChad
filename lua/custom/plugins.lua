local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Debbugging
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      local dap_breakpoint = require("custom.configs.overrides").dap.dap_breakpoint

      vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
      vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
      vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
    end,
    init = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    requires = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
    config = function(_, opts)
      require("telescope").load_extension "dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function(_, opts)
          require("nvim-dap-virtual-text").setup { commented = true, dap_virtual_text = true }
        end,
      },
    },
    config = function(_, opts)
      require("dapui").setup(require("custom.configs.overrides").dapui)
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
    init = function(_)
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Go
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}

return plugins
