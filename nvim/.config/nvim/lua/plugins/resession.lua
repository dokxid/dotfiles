local home_path = os.getenv "HOME"
local config_path = os.getenv "XDG_CONFIG_HOME" or os.getenv "HOME" .. "/.config/"
local home = "󱂵 "
local repo = "󱞊 "
local config = "󱁿 "

return {
  {
    "scottmckendry/pick-resession.nvim",
    opts = {
      prompt_title = "sessions",
      layout = "vscode", -- "default", "dropdown", "ivy", "select", "vscode"
      default_icon = {
        icon = " ",
        highlight = "Directory",
      },
      -- These are processed in order, so put more specific matches first
      path_icons = {
        { match = config_path, icon = config, highlight = "Special" },
        { match = home_path .. "/repos", icon = repo, highlight = "Special" },
        { match = home_path, icon = home, highlight = "Directory" },
      },
    },
  },
  {
    "stevearc/resession.nvim",
    config = function()
      local resession = require "resession"
      resession.setup {
        autosave = {
          enabled = true,
          interval = 60,
          notify = true,
        },
        extensions = {},
      }
      resession.add_hook("post_load", function(session_name, opts)
        if opts.notify then
          vim.notify("Session '" .. session_name .. "' loaded.", vim.log.levels.INFO, { title = "Resession" })
        end
      end)

      -- https://github.com/scottmckendry/pick-resession.nvim?tab=readme-ov-file#-recommended-resession-configuration
      -- Automatically save sessions on by working directory on exit
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function() resession.save(vim.fn.getcwd(), { notify = true }) end,
      })

      -- Automatically load sessions on startup by working directory
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Only load the session if nvim was started with no args
          if vim.fn.argc(-1) == 0 then resession.load(vim.fn.getcwd(), { silence_errors = true }) end
        end,
        nested = true,
      })
    end,
  },
}
