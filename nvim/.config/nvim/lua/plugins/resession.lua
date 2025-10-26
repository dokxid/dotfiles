return {
  {
    "scottmckendry/pick-resession.nvim",
    opts = {
      prompt_title = "sessions",
      layout = "dropdown", -- "default", "dropdown", "ivy", "select", "vscode"
      default_icon = {
        icon = " ",
        highlight = "Directory",
      },
      -- These are processed in order, so put more specific matches first
      path_icons = {
        { match = "/home/dokxid/.config", icon = "🛠️", highlight = "Special" },
        { match = "/home/dokxid/repos", icon = " ", highlight = "Repository" },
        { match = "/home/dokxid", icon = "🏠 ", highlight = "Directory" },
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
          notify = false,
        },
      }

      -- Automatically save sessions on by working directory on exit
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function() resession.save(vim.fn.getcwd(), { notify = true }) end,
      })
    end,
  },
}
