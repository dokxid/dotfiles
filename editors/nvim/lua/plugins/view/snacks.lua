local Snacks = require "snacks"

return {
  "folke/snacks.nvim",
  opts = {
    -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
    ---@class snacks.picker.Config
    picker = {
      layouts = {
        ---@class snacks.layout.Config
        default_layout = {
          layout = {
            box = "horizontal",
            width = 0.9,
            height = 0.9,
            border = "none",
            {
              box = "vertical",
              width = 0.4,
              border = "none",
              { win = "input", height = 1, border = "solid", title_pos = "center" },
              { win = "list", border = "hpad" },
            },
            { win = "preview", border = "solid" },
          },
        },
        ---@class snacks.layout.Config
        vertical_layout = {
          layout = {
            box = "vertical",
            width = 0.9,
            height = 0.9,
            border = "none",
            {
              box = "vertical",
              height = 0.7,
              border = "none",
              { win = "input", height = 1, border = "solid", title_pos = "center" },
              { win = "list", border = "hpad" },
            },
            { win = "preview", border = "vpad", title = "source file" },
          },
        },
      },
      win = {
        preview = {
          wo = { wrap = true },
        },
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["??"] = { "toggle_help_input", mode = { "n", "i" } },
            ["<Tab>"] = { "toggle_focus", mode = { "n", "i" } },
            ["<Up>"] = { "toggle_focus", mode = { "n", "i" } },
            ["<Down>"] = { "toggle_focus", mode = { "n", "i" } },
          },
        },
        list = {
          keys = {
            ["<Tab>"] = "toggle_focus",
            ["<Space>"] = "select_and_next",
            ["a"] = "select_all",
            ["<c-a>"] = nil,
            ["<c-r>#"] = nil,
            ["<c-r>%"] = nil,
          },
        },
      },
      sources = {
        files = { layout = { preset = "default_layout" } },
        grep = { layout = { preset = "default_layout" } },
        grep_word = { layout = { preset = "default_layout" } },
        keymaps = { layout = { preset = "vertical_layout" } },
        recent = { layout = { preset = "default_layout" } },
        buffers = { layout = { preset = "default_layout" } },
        projects = {
          finder = "recent_projects",
          format = "file",
          dev = { "~/repos", "~/projects", "~/dotfiles" },
          confirm = "load_session",
          -- patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile", ".config" },
          recent = true,
          matcher = {
            frecency = true, -- use frecency boosting
            sort_empty = true, -- sort even when the filter is empty
            cwd_bonus = false,
          },
          sort = { fields = { "score:desc", "idx" } },
          win = {
            preview = { minimal = true },
            input = {
              keys = {
                -- every action will always first change the cwd of the current tabpage to the project
                ["<c-e>"] = { { "tcd", "picker_explorer" }, mode = { "n", "i" } },
                ["<c-f>"] = { { "tcd", "picker_files" }, mode = { "n", "i" } },
                ["<c-g>"] = { { "tcd", "picker_grep" }, mode = { "n", "i" } },
                ["<c-r>"] = { { "tcd", "picker_recent" }, mode = { "n", "i" }, nowait = true },
                ["<c-w>"] = { { "tcd" }, mode = { "n", "i" } },
              },
            },
          },
        },
      },
      ---@class Snacks.picker.buffers.Config: snacks.picker.Config
      buffers = {
        win = {
          list = {
            keys = {
              ["c"] = { "bufdelete" },
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
            function() Snacks.picker.files {} end,
            desc = "pick files",
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
              }
            end,
            desc = "show keymaps",
          },
        },
      },
    },
  },
}
