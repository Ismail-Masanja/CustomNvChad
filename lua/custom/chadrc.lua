---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  transparency = true,
  lsp_semantic_tokens = true,

  -- Status line Overides
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
