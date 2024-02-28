---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },
  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "minimal",
  },

  nvdash = {
    load_on_startup = true,
    header = {
      " ⢀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣧⣄ ",
      "⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠉⠉⠉⠙⠻⣅⠀⠈⢧⠀⠈⠛⠉⠉⢻⣿⣿⣿⣧",
      "⠨⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣤⡶⠟⠀⠀⣈⠓⢤⣶⡶⠿⠛⠻⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣿⢣⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣀⣴⠶.⠿⢷⡄⠀⠀⢀⣤⣾⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⣡⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣦⣤⣤⡀⠀⢷⡀⠀⠀⣻⣿⣿⣿⣿",
      "⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠛⠶⠛⠃⠈⠈⢿⣿⣿⣿⣿",
      "⣿⣿⣿⣿⠟⠘⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀|⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿",
      "⣿⣿⣿⠏⠀⠁⠀⠀⠀⠀⠀⠀⠀⢀x⡄⠀⠀⠀⠀⠀⠀⣡⣄,⡆⠀⠀⠀⠀⣿⣿⣿⣿",
      "⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠛⠛⢛⣲⣶⣿⣷⣉⠉⢉⣥⡄⠀⠀⠀⠨⣿⣿⣿⣿",
      "⣿⣿⡇⢠⡆⠀⠀⢰⠀⠀⠀⠀⢸⣿⣧⣠⣠⣿⣿⣿⣿⣿⣷⣾⣿⡅⠀⠀⡄⠠⢸⣿⣿⣿",
      "",
      "",
      "why are we doing all",
      "of this again? ,,,,,",
      "",
    },
    project = {
      enable = true,
      limit = 8,
      icon = "your icon",
      label = "",
      action = "Telescope find_files cwd=",
    },
    buttons = {
      { "persisted,,,", "l_pp", "Telescope persisted" },
      { "find me,,,", "l_ff", "Telescope find_files" },
      { "desperate,,,", "l_ch", "NvCheatSheet" },
      { "lazy bug,,,", "l_ld", "Lazy" },
    },
    footer = {
      "",
      "♡( ◡‿◡ )",
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
