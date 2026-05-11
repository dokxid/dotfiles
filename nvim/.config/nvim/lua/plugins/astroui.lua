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
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      auto_integrations = true,
      integrations = {
        avante = { rounded = true },
        colorful_winsep = { enabled = true, color = "lavender" },
        snacks = {
          indent_scope_color = "lavender",
        },
        treesitter = true,
        blink_cmp = {
          style = "bordered",
        },
        flash = true,
      },
      transparent_background = true,
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.05, -- percentage of the shade to apply to the inactive window
      },
      styles = {
        comments = { "italic", "dim" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "bold" },
        keywords = { "italic", "dim" },
        strings = { "italic", "dim" },
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
      custom_highlights = {
        component = { style = { "bold" } },
        start_tag = { style = { "bold" } },
        end_tag = { style = { "bold" } },
        tag_name = { style = { "bold" } },
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
