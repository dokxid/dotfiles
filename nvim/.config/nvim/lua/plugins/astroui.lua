-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "catppuccin-mocha",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        init = { -- this table overrides highlights in all themes
          -- Normal = { bg = "#000000" },
        },
        astrodark = { -- a table of overrides/changes when applying the astrotheme theme
          -- Normal = { bg = "#000000" },
        },
      },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      numhl = false,
      signcolumn = true,
      sign_priority = 6,
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        ---@type table<string, CmdlineFormat>
        format = {
          cmdline = { conceal = false },
          help = { conceal = false },
        },
      },
      presets = {
        bottom_search = false,
        lsp_doc_border = true,
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    dependencies = {
      {
        "rasulomaroff/reactive.nvim",
        enabled = false,
        opts = {
          load = { "catppuccin-mocha-cursor", "catppuccin-mocha-cursorline" },
        },
      },
    },
    ---@type CatppuccinOptions
    opts = {
      auto_integrations = true,
      integrations = {
        avante = { rounded = true },
        colorful_winsep = { enabled = true, color = "lavender" },
        snacks = {
          indent_scope_color = "lavender",
          enabled = true,
        },
        treesitter = true,
        blink_cmp = {
          style = "bordered",
        },
        flash = true,
        gitsigns = {
          enabled = true,
          transparent = true,
        },
        grug_far = true,
        which_key = true,
        neotree = true,
      },
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.05, -- percentage of the shade to apply to the inactive window
      },
      styles = {
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "bold" },
        variables = {},
        numbers = { "italic" },
        booleans = { "italic" },

        properties = {},
        types = { "bold" },
        operators = { "bold" },
        component = { "bold" },
        start_tag = { "bold" },
        end_tag = { "bold" },
        miscs = {},
      },
      flavour = "mocha", -- latte, frappe, macchiato, :mocha
      term_colors = true,
      highlight_overrides = {
        all = function(colors)
          return {
            -- Comment = { fg = colors.flamingo },
          }
        end,
        latte = function(colors)
          return {
            -- Comment = { fg = latte.flamingo },
          }
        end,
        ---@type CtpHighlightOverrideFn
        mocha = function(colors)
          return {
            comment = { fg = colors.subtext0, style = { "italic", "dim" } },
            keyword = { style = { "italic", "dim" } },
            string = { fg = colors.teal, style = { "italic", "dim" } },
          }
        end,
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    lazy = true,
    opts = {
      variant = "auto", -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = true,
      -- groups = {
      --   git_change = "gold",
      --   git_dirty = "love",
      -- },
      -- highlight_groups = {
      --   -- Directory = { fg = "gold" },
      --   NeoTreeGitModified = { fg = "love", bold = true },
      --   NeoTreeGitRenamed = { fg = "love", bold = true },
      --   NeoTreeFileName = { fg = "gold" },
      --   NeoTreeFileIcon = { fg = "rose" },
      --   NeoTreeModified = { fg = "gold" },
      -- },
    },
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },
}
