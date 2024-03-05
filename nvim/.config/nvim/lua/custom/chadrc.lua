---@type ChadrcConfig
---@class ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {

  -- load theme (overlaps with catpuccin plugin but this helps hotloading config changes ui wise)
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },

  -- override highlights
  hl_override = highlights.override,
  hl_add = highlights.add,

  -- modify statusline
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },

  -- modify dashboard
  nvdash = {
    enabled = true,
    load_on_startup = true,
    header = {
      " ⢀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⡿⠿⢿⣿⣿⣿⣿⣧⣄ ",
      "⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠉⠉⠉⠙⠻⣅⠀⠈⢧⠀⠈⠛⠉⠉⢻⣿⣿⣧",
      "⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣤⡶⠟⠀⠀⣈⠓⢤⣶⡶⠿⠛⠻⣿",
      "⣿⣿⣿⣿⣿⣿⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣀⣴⠶.⠿⢷⡄⠀⠀⢀⣤⣾⣿⣿",
      "⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣦⣤⣤⡀⠀⢷⡀⣾⣿⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⠀⠀⠀⠀⠀⡈⠛⠶⠛⠃⠈⠈⢿⣿⣿⣿",
      "⣿⣿⣿⠟⠘⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠁⠀⠀⠀⠀⠀⠸⠁⠀⠀⠀⠀⠀⠈⣿⣿⣿",
      "⣿⣿⠏⠀⠁⠀⠀⠀⠀⠀⠀⠀⢀⡆⡄⠀⠀⠀⠀⠀⠀⣡⣄,⡆⠀⠀⠀⠀⣿⣿⣿",
      "⣿⡏⠀⠀⠀⠀⠸⠁⠀⠀⠀⠀⠚⠛⠛⢛⣲⣶⣿⣷⣉⠉⢉⣥⡄⠀⠀⠀⠨⣿⣿⣿",
      "⣿⡇⢠⡆⠀⠀⢰⠁⠀⠀⠀⢸⣿⣧⣠⣠⣿⣿⣿⣿⣿⣷⣾⣿⡅⠀⠀⡄⠠⢸⣿⣿",
      "⠟⠁                            ⠛⢿",
      -- "why are we doing all",
      -- "of this again? ,,,,,",
      "󰫤 󱝁 󰫢 󰫣   ",
      "__",
    },
    buttons = {
      { "find me,,,", "l_ff", "zoxide" },
      { "desperate,,,", "l_fo", "files_old" },
      { "lazy bug,,,", "l_fd", "files_fuzzy" },
    },
  },

  tabufline = {
    enabled = true,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
