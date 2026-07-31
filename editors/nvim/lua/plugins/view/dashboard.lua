return {
  "folke/snacks.nvim",
  opts = {
    ---@class snacks.dashboard.Config
    dashboard = {
      pane_gap = 0,
      width = 40,
      formats = {
        header = { "%s", align = "center" },
        key = { "%s    ", align = "left" },
      },
      preset = {
        header = [[

        __/) 
     .-(__(=:
(  \ |    \) 
    \| / )   
     |/      
  ]],
        keys = {
          {
            icon = " ",
            key = "e",
            desc = "sessions",
            action = function()
              require("pick-resession").pick { snacks_finder = GENERATE_DIRSESSIONS, dir = "dirsession" }
            end,
          },
          {
            icon = " ",
            key = "f",
            desc = "find",
            action = function()
              require("snacks").picker.smart {
                layout = {
                  preset = "vscode",
                },
              }
            end,
          },
          {
            icon = " ",
            key = "d",
            desc = "cwd",
            action = function() require("yazi").yazi { change_neovim_cwd_on_close = true } end,
          },
          {
            icon = "󰗚 ",
            key = "a",
            desc = "browse",
            action = function() require("yazi").toggle() end,
          },
          {
            icon = " ",
            key = " ",
            desc = " ",
          },
        },
      },
      sections = {
        { section = "header", padding = 0 },
        { title = [[  
    the potato editor]], section = "keys", indent = 4, padding = 2, pane = 2 },
      },
    },
  },
}
