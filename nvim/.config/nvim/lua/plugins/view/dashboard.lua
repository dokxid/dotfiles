local Snacks = require "snacks"

return {
  "folke/snacks.nvim",
  ---@type Snacks.picker.Config
  opts = {
    ---@class Snacks.dashboard.Config
    dashboard = {
      preset = {
        header = [[the potato editor]],
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
            icon = " ",
            key = "c",
            desc = ".config/nvim",
            action = function() Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath "config" }) end,
          },
          { icon = "󰒲 ", key = "l", desc = ":lazy zzz", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        },
      },
      sections = {
        -- { section = "startup", padding = 2 },
        {
          pane = 1,
          cmd = "if not test '$zen' = ''; cat ~/.config/nvim/dashboard_header; sleep 0.1; end",
          section = "terminal",
          height = 13,
          padding = 2,
        },
        { section = "header", padding = 2 },
        { title = "==> keys <==", section = "keys", indent = 2, padding = 1 },
      },
    },
  },
}
