return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@class wk.Opts
  opts = {
    win = {
      height = { min = 6, max = 25 },
      no_overlap = false,
      title = false,
    },
    preset = "modern",
    delay = 300,
    show_help = false,
    show_keys = false,
  },
}
