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

  -- move
  {
    "matze/vim-move",
    event = "BufEnter",
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

  -- gitsign
  { "lewis6991/gitsigns.nvim" },

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

  -- nvim-rooter
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
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    config = function()
      require "custom.configs.telescope"
    end,
  },

  -- telescope-repo-nvim
  {
    "cljoly/telescope-repo.nvim",
    config = function()
      require("telescope").load_extension "repo"
    end,
  },

  -- telescope-rooter
  {
    "desdic/telescope-rooter.nvim",
    config = function()
      require("telescope").load_extension "rooter"
    end,
  },

  -- telescope-z
  {
    "jvgrootveld/telescope-zoxide",
    config = function()
      require("telescope").load_extension "zoxide"
    end,
  },

  -- telescope-frecency
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },

  -- promise_async
  { "kevinhwang91/promise-async" },

  -- nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
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
    lazy = false,
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
    -- opts = overrides.nvimtree,
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

  -- which-key
  {
    "folke/which-key.nvim",

    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      window = {
        border = "single",
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
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },
}

return plugins
