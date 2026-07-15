-- configuration:
-- https://github.com/nvim-neo-tree/neo-tree.nvim#configuration

local mappings = {
  n = {
    ["<Leader>e"] = {
      function()
        require("neo-tree.command").execute {
          toggle = true,
          source = "filesystem",
          position = "float",
          reveal_force_cwd = true,
        }
      end,
      desc = "neotree",
    },
    ["E"] = {
      function()
        require("neo-tree.command").execute {
          toggle = true,
          source = "filesystem",
          position = "float",
          reveal_force_cwd = true,
        }
      end,
      desc = "neotree",
    },
  },
}

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,

    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
      commands = {
        open_yazi = function() require("yazi").yazi() end,
      },
      source_selector = {
        truncation_character = "",
        winbar = true,
        statusline = false,
        content_layout = "center",
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
        },
        separator = { left = "", right = "" },
        separator_active = nil,
      },
      close_if_last_window = true,
      hide_root_node = true,
      retain_hidden_root_indent = true,
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function() require("neo-tree.command").execute { action = "close" } end,
        },
      },
      window = {
        width = 30,
        mappings = {
          -- mouse
          ["<2-LeftMouse>"] = "open",
          ["<RightMouse>"] = "toggle_node",

          -- opening / nodes
          ["<s-down>"] = "open_split",
          ["<s-right>"] = "open_vsplit",
          ["<space>"] = { "toggle_node" },
          ["c"] = "toggle_node",
          ["C"] = "close_node",

          -- preview
          ["l"] = "focus_preview",
          ["<tab>"] = {
            "toggle_preview",
            config = {
              use_float = true,
              use_snacks_image = true,
              use_image_nvim = true,
            },
          },

          -- manipulation
          ["A"] = {
            "add_directory",
            config = {
              show_path = "relative",
            },
          },
          ["a"] = {
            "add",
            config = {
              show_path = "relative",
            },
          },

          -- view
          ["<esc>"] = "close_window",
          ["e"] = "close_window",
          ["E"] = "open_yazi",
          ["q"] = "close_window",
          -- [","] = "prev_source",
          -- ["."] = "next_source",
          ["?"] = "show_help",
        },
      },
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        name = {
          trailing_slash = true,
        },
        indent = {
          indent_size = 2,
          padding = 0,
          with_markers = false,
          indent_marker = "│",
          last_indent_marker = "└",
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
        },
      },
      nesting_rules = {
        ["package.json"] = {
          pattern = "^package%.json$",
          files = { "package-lock.json", "yarn*", "pnpm*", "bun*" },
        },
        ["mise.toml"] = {
          pattern = "^mise%.toml$",
          files = { "mise.local.toml" },
        },
        ["README.md"] = {
          pattern = "^README%.md$",
          files = { "LICENSE" },
        },
        ["nuxt.config.ts"] = {
          pattern = "^nuxt%.config%.ts$",
          files = { "*.config.ts", "*.config.mjs" },
        },
      },
      filesystem = {
        mappings = {
          ["."] = "toggle_hidden",
          ["R"] = "set_root",
        },
        group_empty_dirs = true,
        scan_mode = "deep",
        filtered_items = {
          show_hidden_count = false,
          visible = false, -- hide filtered items on open
          hide_gitignored = false,
          hide_dotfiles = false,
          always_show_by_pattern = {
            ".env*",
          },
          hide_by_name = {
            -- "node_modules",
            ".github",
            -- ".gitignore",
            "package-lock.json",
            "pnpm-lock.json",
            "bun.lock",
            ".changeset",
            -- ".prettierrc.json",
            ".nuxt",
            ".output",
            "dist",
          },
          never_show = {
            ".DS_Store",
            ".git",
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    },
    config = function(_, opts)
      opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
      require("neo-tree").setup(opts)
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "saifulapm/neotree-file-nesting-config",
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = mappings,
        },
      },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function() require("lsp-file-operations").setup() end,
  },
}
