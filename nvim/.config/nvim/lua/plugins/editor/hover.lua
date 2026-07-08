-- https://github.com/lewis6991/hover.nvim
return {
  "lewis6991/hover.nvim",
  lazy = false,
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        providers = {
          "hover.providers.diagnostic",
          "hover.providers.lsp",
          "hover.providers.dap",
          "hover.providers.man",
          "hover.providers.dictionary",
          "hover.providers.fold_preview",
          "hover.providers.highlight",
          -- Optional, disabled by default:
          -- 'hover.providers.gh',
          -- 'hover.providers.gh_user',
          -- 'hover.providers.jira',
        },
        mappings = {
          n = {
            K = { function() require("hover").open() end, desc = "Hover cursor" },
            gK = { function() require("hover").select() end, desc = "Hover selection" },
            ["]h"] = { function() require("hover").switch "next" end, desc = "Next hover source" },
            ["[h"] = { function() require("hover").switch "previous" end, desc = "Previous hover source" },
          },
        },
      },
    },
    {
      "AstroNvim/astrolsp",
      opts = { mappings = { n = { K = false } } },
    },
  },
  opts = {
    init = function() require "hover.providers.lsp" end,
  },
}
