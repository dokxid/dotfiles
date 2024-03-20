---@diagnostic disable: different-requires
local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
---@class NvPluginSpec
local plugins = {

  -- suda
  { "lambdalisue/suda.vim", event = "VeryLazy" },

  -- cinnamon
  {
    "declancm/cinnamon.nvim",
    event = "BufEnter",
    config = function()
      require "custom.configs.cinnamon"
    end,
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require "custom.configs.catppuccin"
      vim.cmd "colorscheme catppuccin-mocha"
    end,
  },

  -- auto-indent
  {
    "vidocqh/auto-indent.nvim",
    lazy = false,
    config = function()
      require("auto-indent").setup {
        lightmode = true, -- Lightmode assumes tabstop and indentexpr not change within buffer's lifetime
        indentexpr = nil, -- Use vim.bo.indentexpr by default, see 'Custom Indent Evaluate Method'
        ignore_filetype = {}, -- Disable plugin for specific filetypes, e.g. ignore_filetype = { 'javascript' }
      }
    end,
  },

  -- overseer
  {
    "stevearc/overseer.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- moveline
  {
    "willothy/moveline.nvim",
    name = "moveline",
    event = "BufEnter",
    build = "make",
  },

  -- mini
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      require "custom.configs.mini"
    end,
  },

  -- legendary
  {
    "mrjones2014/legendary.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    priority = 1000,
    lazy = false,
  },

  -- renamer
  {
    "filipdutescu/renamer.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {},
  },

  -- satellite
  {
    "lewis6991/satellite.nvim",
    event = "BufEnter",
    dependencies = { "catppuccin/nvim" },
    config = function()
      require "custom.configs.satellite"
    end,
  },

  -- zen-mode
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.zenmode"
    end,
  },

  -- transparent
  { "xiyaowong/transparent.nvim" },

  -- follow-md-links
  {
    "jghauser/follow-md-links.nvim",
    lazy = false,
  },

  -- nvim-lspimport
  { "stevanmilic/nvim-lspimport" },

  -- dropbar (note: requires neovim >0.10.0)
  {
    "Bekaboo/dropbar.nvim",
    enabled = true,
    event = "BufEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },

  -- barbecue (use this for dropbar fallback)
  {
    "utilyre/barbecue.nvim",
    enabled = false,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
  },

  -- glow.nvim
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
  },

  -- rainbow delimiter
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufEnter",
  },

  -- eagle
  {
    "soulis-1256/eagle.nvim",
    lazy = false,
    config = function()
      require("eagle").setup {}
      vim.o.mousemoveevent = true
    end,
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.notify = require "notify"
    end,
  },

  -- rooter
  {
    "notjedi/nvim-rooter.lua",
    lazy = false,
    config = function()
      require("nvim-rooter").setup {
        rooter_patterns = { ".git", ".hg", ".svn", ".config" },
        trigger_patterns = { "*" },
        manual = false,
        fallback_to_parent = false,
      }
    end,
  },

  -- cosmic-ui
  {
    "CosmicNvim/cosmic-ui",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("cosmic-ui").setup()
    end,
  },

  -- venv-selector
  {
    "linux-cultist/venv-selector.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      auto_refresh = true,
    },
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "cljoly/telescope-repo.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "jvgrootveld/telescope-zoxide",
      "nvim-telescope/telescope-frecency.nvim",
    },
    config = function()
      require "custom.configs.telescope"
    end,
  },

  -- nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require "custom.configs.ufo"
    end,
  },

  -- nvim-surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  --surround-ui
  {
    "roobert/surround-ui.nvim",
    event = "VeryLazy",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    config = function()
      require("surround-ui").setup {
        root_key = "S",
      }
    end,
  },

  -- telescope-fzf-native
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  -- tailwindcss-colorizer-cmp
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    opts = { color_square_width = 2 },
  },

  -- yazi
  {
    "DreamMaoMao/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },

  -- auto-save
  {
    "okuuva/auto-save.nvim",
    event = "InsertEnter",
    config = function()
      require "custom.configs.autosave"
    end,
  },

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
      require "custom.configs.nvimtree"
    end,
  },

  -- better-escape
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- conform
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- toggler
  {
    "nguyenvukhang/nvim-toggler",
    event = "VeryLazy",
    opts = {},
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      window = {
        border = "none",
        margin = { 2, 7, 2, 2 },
        padding = { 1, 0, 1, 0 },
      },
    },
  },

  -- nvim-web-devicons
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      color_icons = true,
      default = true,
      strict = true,
    },
  },

  -- neogit
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },

  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
    },
    opts = {
      performance = {
        max_view_entries = 8,
      },
    },
  },
}

return plugins
