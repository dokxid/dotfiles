return { -- override blink.cmp plugin
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = {
        adapter = "copilot",
        model = "gpt-4.1",
      },
      inline = {
        adapter = "copilot",
        model = "gpt-4.1",
      },
      cmd = {
        adapter = "copilot",
        model = "gpt-4.1",
      },
    },
  },
}
