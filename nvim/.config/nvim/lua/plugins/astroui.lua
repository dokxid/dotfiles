-- configuration:
-- https://github.com/AstroNvim/astroui#%EF%B8%8F-configuration
-- or under `:h astroui`

---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "catppuccin-nvim",
      highlights = {
        init = {
          -- Normal = { bg = "#000000" },
        },
        astrodark = {
          -- Normal = { bg = "#000000" },
        },
      },
      icons = {
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
    ---@type CatppuccinOptions
    opts = {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      float = {
        transparent = true,
        solid = true,
      },
      term_colors = true,
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.05, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
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
      -- highlight_overrides = {
      --   all = function(colors)
      --     return {
      --       -- Comment = { fg = colors.flamingo },
      --     }
      --   end,
      --   latte = function(colors)
      --     return {
      --       -- Comment = { fg = latte.flamingo },
      --     }
      --   end,
      --   ---@type CtpHighlightOverrideFn
      --   mocha = function(colors)
      --     return {
      --       comment = { fg = colors.subtext0, style = { "italic", "dim" } },
      --       keyword = { style = { "italic", "dim" } },
      --       string = { fg = colors.teal, style = { "italic", "dim" } },
      --     }
      --   end,
      -- },
    },
    dependencies = {
      {
        "rasulomaroff/reactive.nvim",
        enabled = false,
        opts = {
          load = { "catppuccin-mocha-cursor", "catppuccin-mocha-cursorline" },
        },
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
  {
    "f-person/auto-dark-mode.nvim",
    opts = {},
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
      views = {
        hover = {
          view = "popup",
          relative = "cursor",
          zindex = 45,
          enter = false,
          anchor = "auto",
          size = {
            width = "auto",
            height = "auto",
            max_height = 20,
            max_width = 60,
          },
          border = {
            style = "none",
            padding = { 0, 2 },
          },
          position = { row = 1, col = 0 },
          win_options = {
            wrap = true,
            linebreak = true,
          },
        },
      },
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
          },
          view = nil, -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {}, -- merged with defaults from documentation
        },
      },
      cmdline = {
        ---@type table<string, CmdlineFormat>
        format = {
          cmdline = { conceal = false },
          help = { conceal = false },
        },
      },
      routes = {
        {
          filter = { event = "msg_show", kind = "search_count" },
          opts = { skip = true },
        },
      },
      presets = {
        bottom_search = false,
        lsp_doc_border = true,
      },
    },
  },
}
