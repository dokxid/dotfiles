return {
  "NickvanDyke/opencode.nvim",
  version = "*",
  dependencies = {
    {
      "folke/snacks.nvim",
      opts = {
        input = { enabled = true },
        terminal = { enabled = true },
        picker = {
          actions = {
            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    local port = 4199

    ---@type opencode.Opts
    vim.g.opencode_opts = {
      lsp = {
        enabled = true,
      },
      server = {
        port = port,
      },
    }
    vim.o.autoread = true -- Required for `opts.events.reload`

    local Terminal = require("toggleterm.terminal").Terminal
    local opencode_term = Terminal:new {
      cmd = "opencode --port " .. port,
      dir = vim.fn.getcwd(),
      direction = "vertical",
      close_on_exit = true,
      size = vim.o.columns * 0.4,
    }

    -- vim.g can't store Lua functions, so set them directly on the config object
    local config = require "opencode.config"
    config.opts.server.start = function() opencode_term:open(100) end
    config.opts.server.stop = function() opencode_term:close() end
    config.opts.server.toggle = function() opencode_term:toggle(100) end
  end,
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        local prefix = "<Leader>o"
        maps.n[prefix] = { desc = require("astroui").get_icon("OpenCode", 1, true) .. "OpenCode" }
        maps.n[prefix .. "o"] = {
          function() require("opencode").toggle() end,
          desc = "Toggle embedded",
        }
        maps.n[prefix .. "a"] = {
          function() require("opencode").ask("@this: ", { submit = true }) end,
          desc = "Ask about this",
        }
        maps.n[prefix .. "+"] = {
          function() require("opencode").prompt("@buffer", { append = true }) end,
          desc = "Add buffer to prompt",
        }
        maps.n[prefix .. "e"] = {
          function() require("opencode").prompt("Explain @this and its context", { submit = true }) end,
          desc = "Explain this code",
        }
        maps.n[prefix .. "n"] = {
          function() require("opencode").command "session.new" end,
          desc = "New session",
        }
        maps.n[prefix .. "s"] = {
          function() require("opencode").select() end,
          desc = "Select prompt",
        }
        maps.n["<S-C-u>"] = {
          function() require("opencode").command "session.half.page.up" end,
          desc = "Messages half page up",
        }
        maps.n["<S-C-d>"] = {
          function() require("opencode").command "session.half.page.down" end,
          desc = "Messages half page down",
        }

        maps.v[prefix] = { desc = require("astroui").get_icon("OpenCode", 1, true) .. "OpenCode" }
        maps.v[prefix .. "a"] = {
          function() require("opencode").ask("@this: ", { submit = true }) end,
          desc = "Ask about selection",

        }
        maps.v[prefix .. "+"] = {
          function() require("opencode").prompt "@this" end,
          desc = "Add selection to prompt",
        }
        maps.v[prefix .. "s"] = {
          function() require("opencode").select() end,
          desc = "Select prompt",
        }
      end,
    },
    { "AstroNvim/astroui", opts = { icons = { OpenCode = "" } } },
  },
}
