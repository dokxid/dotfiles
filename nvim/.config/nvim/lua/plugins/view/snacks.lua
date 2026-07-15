local Snacks = require "snacks"

return {
  "folke/snacks.nvim",
  ---@type Snacks.picker.Config
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
            function() Snacks.picker.smart() end,
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
