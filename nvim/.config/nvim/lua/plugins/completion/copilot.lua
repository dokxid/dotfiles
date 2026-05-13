return {
  "fang2hou/blink-copilot",
  lazy = true,
  specs = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "User AstroFile",
      opts = {
        panel = { enabled = false },
        suggestion = { enabled = false },
      },
    },
    "saghen/blink.cmp",
  },
}
