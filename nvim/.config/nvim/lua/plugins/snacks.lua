local Snacks = require "snacks"

return {
  "folke/snacks.nvim",
  ---@type snacks.picker.Config
  opts = {
    dashboard = require "plugins.snacks.dashboard",
    picker = {
      win = {
        preview = {
          wo = { wrap = true },
        },
      },
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
    { "<leader>fz", function() Snacks.picker.zoxide() end, desc = "find zoxide" },
  },
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>fw"] = {
            function() require("snacks").picker.grep { dirs = { vim.fn.getcwd() } } end,
            desc = "grep",
          },
          ["<Leader>fW"] = {
            function() require("snacks").picker.grep { dirs = { vim.fn.getcwd() }, hidden = true, ignored = true } end,
            desc = "grep in all files",
          },
          ["<Leader>fk"] = {
            function()
              require("snacks").picker.keymaps {
                matcher = {
                  fuzzy = false,
                },
                layout = {
                  preset = "vertical",
                },
              }
            end,
            desc = "show keymaps",
          },
        },
      },
    },
  },
}
