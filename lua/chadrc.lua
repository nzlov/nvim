-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme_toggle = { "gruvbox", "gruvbox" },
  theme = "gruvbox_light",
  lsp_semantic_tokens = true,
  transparency = false,

  cmp = {
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = true,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
