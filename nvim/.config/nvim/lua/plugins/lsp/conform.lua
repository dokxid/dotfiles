return {
  "stevearc/conform.nvim",
  enabled = false,
  opts = {
    formatters_by_ft = {
      lua = { "selene" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      typescriptreact = { "prettier", stop_after_first = true },
      vue = { "prettier", stop_after_first = true },
      kdl = { "kdlfmt" },
      toml = { "taplo" },
    },
  },
}
