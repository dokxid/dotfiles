-- configuration:
-- https://github.com/Aasim-A/scrollEOF.nvim#settings

return {
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
  },
  {
    "karb94/neoscroll.nvim",
    enabled = not vim.g.neovide,
    opts = {
      easing = "circular",
      hide_cursor = false,
      duration_multiplier = 0.3,
      stop_eof = false,
    },
  },
}
