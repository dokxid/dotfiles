local Snacks = require "snacks"

---@type table<string, snacks.picker.Config>
local custom_sources = {
  --[[
  mostly taken from https://github.com/scottmckendry/pick-resession.nvim
  MIT License https://github.com/scottmckendry/pick-resession.nvim/blob/main/LICENSE
  Copyright (c) 2024 Scott McKendry
  --]]
  sessions = {
    title = "sessions",
    dir = "dirsession",
    finder = function(opts)
      local sessions = {}
      for idx, session in ipairs(require("resession").list { dir = "dirsession" }) do
        local sanitized_dirpath = session:gsub("__", ":/"):gsub("_", "/")
        local path_structure = {}
        local display_value

        for item in string.gmatch(sanitized_dirpath, "[^/]+") do
          table.insert(path_structure, item)
        end

        if string.match(sanitized_dirpath, "/dotfiles/") then
          display_value = string.format(".dot/%s", (".dots/" .. path_structure[#path_structure]))
        elseif string.match(sanitized_dirpath, os.getenv "HOME" .. "/projects/") then
          display_value = string.format(".projects/%s", (".proj/" .. path_structure[#path_structure]))
        elseif string.match(sanitized_dirpath, "/repos") then
          display_value = string.format(".repos/%s", (".repo/" .. path_structure[#path_structure]))
        else
          display_value = sanitized_dirpath
        end

        sessions[#sessions + 1] = {
          score = 0,
          text = session,
          value = session,
          idx = idx,
          display_value = display_value,
          file = sanitized_dirpath,
        }
      end
      return sessions
    end,
    layout = { preset = "default_layout" },
    format = function(item)
      local default_icon = { icon = " ", highlight = "Directory" }
      local path_icons = {
        {
          match = os.getenv "XDG_CONFIG_HOME" or os.getenv "HOME" .. "/.config/",
          icon = " ",
          highlight = "Special",
        },
        {
          match = ".dot/",
          icon = " ",
          highlight = "Special",
        },
        {
          match = ".repos/",
          icon = " ",
          highlight = "Special",
        },
        {
          match = ".projects/",
          icon = "󰄛 ",
          highlight = "Special",
        },
        {
          match = os.getenv "HOME",
          icon = "󰄛 ",
          highlight = "Directory",
        },
      }
      local toReturn = {}
      for _, icon in ipairs(path_icons) do
        if item.display_value:find(icon.match) then
          toReturn = {
            { icon.icon, icon.highlight },
            { item.display_value:gsub(icon.match, ""), "Normal" },
          }
          return toReturn
        end
      end
      toReturn = {
        { default_icon.icon, default_icon.highlight },
        { item.display_value, "Normal" },
      }
      return toReturn
    end,
    confirm = function(self, item)
      self:close()
      require("resession").load(item.value, { dir = "dirsession" })
    end,
    actions = {
      delete_session = function(self, item)
        require("resession").delete(item.value, { dir = "dirsession", notify = true })
        self:find {
          refresh = true,
        }
      end,
    },
    win = {
      input = {
        keys = {},
      },
      list = {
        keys = {
          ["d"] = { "delete_session", mode = { "n", "i" }, desc = "Delete session" },
        },
      },
    },
  },
}

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
            ["<c-a>"] = false,
            ["<c-r>#"] = false,
            ["<c-r>%"] = false,
          },
        },
      },
      sources = {
        files = {
          layout = { preset = "default_layout" },
          hidden = true,
          ignored = false,
        },
        sessions = custom_sources.sessions,
        grep = { layout = { preset = "default_layout" } },
        grep_word = { layout = { preset = "default_layout" } },
        keymaps = { layout = { preset = "vertical_layout" } },
        recent = { layout = { preset = "default_layout" } },
        buffers = { layout = { preset = "default_layout" } },
      },
    },
  },
  keys = {},
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
          ["<leader>bb"] = { function() Snacks.picker.buffers() end, desc = "Buffers" },
          ["<leader>fz"] = { function() Snacks.picker.zoxide() end, desc = "find zoxide" },
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
          ["<Leader>fe"] = {
            function() require("snacks").picker.sessions() end,
            desc = "find session",
          },
        },
      },
    },
  },
}
