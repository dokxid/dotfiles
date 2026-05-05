return {
  "stevearc/conform.nvim",
  -- enabled = false,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      vue = { "prettier", stop_after_first = true },
      kdl = { "kdlfmt" },
      toml = { "taplo" },
    },
    formatters = {
      prettier = {
        -- Dynamically find prettier in project or system
        command = function(ctx)
          -- Handle nil context (can happen during statusline evaluation)
          local dirname = (ctx and ctx.dirname) or vim.fn.getcwd()

          -- Try to find project's prettier first
          local project_prettier = vim.fn.findfile("node_modules/.bin/prettier", dirname .. ";")
          if project_prettier ~= "" then return project_prettier end
          -- Fall back to system prettier
          return "prettier"
        end,
        stdin = false,
      },
    },
  },
}
