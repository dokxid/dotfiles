if vim.g.neovide then return {} end

-- emulate smooth scrolling outside of neovide
return {
  "karb94/neoscroll.nvim",
  opts = {
    easing = "circular",
    hide_cursor = false,
    duration_multiplier = 0.3,
    stop_eof = false,
  },
}
