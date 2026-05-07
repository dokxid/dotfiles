return {
  "stevearc/conform.nvim",
  enabled = false,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      vue = { "eslint", stop_after_first = true },
      kdl = { "kdlfmt" },
      toml = { "taplo" },
    },
  },
}
