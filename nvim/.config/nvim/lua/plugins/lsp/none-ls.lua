---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  enabled = false,
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, opts)
    local null_ls = require "null-ls"
    -- opts variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      require "none-ls.code_actions.eslint_d",
      require "none-ls.diagnostics.eslint_d",
      require "none-ls.formatting.eslint_d",
    })
    -- opts.sources = {
    -- ESLint for formatting (which uses Prettier plugin internally)
    -- This is the single source of truth for formatting
    -- require "none-ls.formatting.eslint_d",
    -- ESLint for diagnostics and code actions
    -- require "none-ls.code_actions.eslint_d",
    -- require "none-ls.diagnostics.eslint_d",
    -- }
  end,
}
