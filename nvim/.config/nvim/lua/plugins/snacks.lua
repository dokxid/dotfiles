local Snacks = require "snacks" -- Add this at the top if 'snacks' is a module
return {
  "folke/snacks.nvim",
  ---@type snacks.picker.Config
  opts = {
    dashboard =
      ---@class snacks.dashboard.Config
      {
        preset = {
          header = [[the potato editor]],
          keys = {
            { icon = " ", key = "e", desc = "sessions", action = ":lua require('pick-resession').pick()" },
            { icon = " ", key = "p", desc = "projects", action = ":lua Snacks.dashboard.pick('projects')" },
            { icon = " ", key = "o", desc = "recent files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = ",",
              desc = ".config/nvim",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "󰒲 ", key = "l", desc = ":lazy zzz", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          },
        },
        sections = {
          -- { section = "startup", padding = 2 },
          {
            pane = 1,
            cmd = "cat ~/.config/nvim/dashboard_header; sleep 0.1",
            section = "terminal",
            height = 13,
            padding = 2,
          },
          { section = "header", padding = 2 },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        },
      },

    picker = {
      ---@class snacks.picker.buffers.Config: snacks.picker.Config
      buffers = {
        win = {
          input = {
            keys = {
              ["d"] = { "bufdelete", mode = { "n" }, desc = "Delete Buffer" },
              ["<C-d>"] = { "bufdelete", mode = { "i" }, desc = "Delete Buffer" },
            },
          },
          list = {
            keys = {
              ["dd"] = { "bufdelete" },
              ["<C-d>"] = { "bufdelete", mode = { "i" }, desc = "Delete Buffer" },
            },
          },
        },
      },
    },
  },
  keys = {
    { "<leader>bb", function() Snacks.picker.buffers() end, desc = "Buffers" },
  },
}
