return {
  "stevearc/conform.nvim",
  enabled = true,
  opts = {
    formatters_by_ft = {
      lua = { "selene" },
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
