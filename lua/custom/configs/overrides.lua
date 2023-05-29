local M = {}

-- Treesitter
M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
  },
}

-- Mason
M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- go
    "gopls",
    "gofumpt",
    "goimports_reviser",
    "golines",
    "delve",
  },
}

-- nvimtree
M.nvimtree = {
  view = {
    adaptive_size = false,
    side = "right",
    width = 40,
  },
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

-- dap
M.dap = {
  dap_breakpoint = {
    error = {
      text = "",
      texthl = "DiagnosticSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "DiagnosticSignError",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "→",
      texthl = "DiagnosticSignWarn",
      linehl = "Visual",
      numhl = "DiagnosticSignWarn",
    },
  },
}

-- dap-ui
M.dapui = {
  layouts = {
    {
      elements = {
        {
          id = "breakpoints",
          size = 0.25,
        },
        {
          id = "stacks",
          size = 0.25,
        },
        {
          id = "scopes",
          size = 0.25,
          title = "Scope:",
        },
        {
          id = "watches",
          size = 0.25,
        },
      },
      position = "right",
      size = 0.35,
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5,
        },
        {
          id = "console",
          size = 0.5,
        },
      },
      position = "bottom",
      size = 0.25,
    },
  },
}

return M
