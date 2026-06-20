---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  transparency = false,
  lsp_semantic_highlights = true,
}

M.ui = {
  statusline = {
    enabled = true,
    theme = "default",
  },
  nvdash = {
    load_on_startup = true,
  },
  telescope = {
    style = "borderless",
  },
}

return M