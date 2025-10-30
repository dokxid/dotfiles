return {
  "folke/trouble.nvim",
  ---@class trouble.Mode: trouble.Config
  ---@field desc? string
  ---@field sections? string[]
  ---@class trouble.Config
  ---@field mode? string
  ---@field config? fun(opts:trouble.Config)
  opts = {
    auto_close = true,
    modes = {
      test = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.3,
        },
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
}
