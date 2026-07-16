local Snacks = require "snacks"

return {
  "folke/snacks.nvim",
  ---@type Snacks.picker.Config
  opts = {
    ---@class Snacks.dashboard.Config
    dashboard = {
      width = 40,
      formats = {
        header = { "%s", align = "center", hl = "special" },
        keys = {},
      },
      preset = {
        header = [[
        __/) 
     .-(__(=:
(  \ |    \) 
    \| / )   
     |/      ]],
        keys = {
          {
            icon = " ",
            key = "e",
            desc = "sessions",
            action = function()
              require("pick-resession").pick { snacks_finder = GENERATE_DIRSESSIONS, dir = "dirsession" }
            end,
          },
          {
            icon = " ",
            key = "f",
            desc = "files",
            action = function() require("snacks").picker.smart() end,
          },
        },
      },
      sections = {
        -- { section = "startup", padding = 2 },
        -- {
        --   pane = 1,
        --   cmd = "if not test '$zen' = ''; cat ~/.config/nvim/dashboard_header; sleep 0.1; end",
        --   section = "terminal",
        --   height = 13,
        --   padding = 2,
        -- },
        { section = "header", padding = 2 },
        { title = "the potato editor", section = "keys", indent = 0, padding = 1 },
      },
    },
  },
}
