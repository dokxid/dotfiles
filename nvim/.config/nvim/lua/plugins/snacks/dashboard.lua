---@class snacks.dashboard.Config
return {
  preset = {
    header = [[the potato editor]],
    keys = {
      {
        icon = " ",
        key = "e",
        desc = "sessions",
        action = ":lua require('pick-resession').pick {snacks_finder = generate_dirsessions, dir = 'dirsession', } ",
      },
      {
        icon = " ",
        key = "o",
        desc = "recent files",
        action = ":lua require('pick-resession').pick {snacks_finder = generate_dirsessions, dir = 'dirsession', } ",
      },
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
      cmd = "if not test '$zen' = ''; cat ~/.config/nvim/dashboard_header; sleep 0.1; end",
      section = "terminal",
      height = 13,
      padding = 2,
    },
    { section = "header", padding = 2 },
    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
  },
}
