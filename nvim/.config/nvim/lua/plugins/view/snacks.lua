local Snacks = require "snacks"

return {
  "folke/snacks.nvim",
  opts = {
    -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
    picker = {
      win = {
        preview = {
          wo = { wrap = true },
        },
        input = {
          ["<Esc>"] = { "close", mode = { "n", "i" } },
          ["/"] = "toggle_focus",
        },
      },
      ---@class snacks.picker.smart.Config: snacks.picker.Config
      smart = {
        layout = {
          cycle = true,
          --- Use the default layout or vertical if the window is too narrow
          preset = function() return vim.o.columns >= 120 and "default" or "vertical" end,
        },
        preview = false,
        multi = { "buffers", "recent", "files" },
        format = "file", -- use `file` format for all sources
        matcher = {
          cwd_bonus = true, -- boost cwd matches
          frecency = true, -- use frecency boosting
          sort_empty = true, -- sort even when the filter is empty
        },
        transform = "unique_file",
      },
      ---@class Snacks.picker.buffers.Config: snacks.picker.Config
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
          ["<s-space>"] = {
            function()
              Snacks.picker.smart {
                layout = {
                  preset = "vscode",
                },
              }
            end,
            desc = "smart find",
          },
          ["<Leader>fw"] = {
            function() Snacks.picker.grep { dirs = { vim.fn.getcwd() } } end,
            desc = "grep",
          },
          ["<Leader>fW"] = {
            function() Snacks.picker.grep { dirs = { vim.fn.getcwd() }, hidden = true, ignored = true } end,
            desc = "grep in all files",
          },
          ["<Leader>fk"] = {
            function()
              Snacks.picker.keymaps {
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
