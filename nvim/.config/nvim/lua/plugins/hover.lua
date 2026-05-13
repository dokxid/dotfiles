if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- https://github.com/lewis6991/hover.nvim
return {
  "lewis6991/hover.nvim",
  lazy = true,
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
          -- Optional, disabled by default:
          -- 'hover.providers.gh',
          -- 'hover.providers.gh_user',
          -- 'hover.providers.jira',
          "hover.providers.fold_preview",
          "hover.providers.highlight",
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
