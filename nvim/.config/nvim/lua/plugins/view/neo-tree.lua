-- configuration:
-- https://github.com/nvim-neo-tree/neo-tree.nvim#configuration

local mappings = {
  n = {
    ["<Leader>e"] = {
      function()
        require("neo-tree.command").execute {
          toggle = true,
          source = "filesystem",
          position = "left",
          reveal_force_cwd = false,
        }
      end,
      desc = "open neotree",
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
          ["\\"] = "open_split",
          ["|"] = "open_vsplit",
          ["<space>"] = "",
          ["<esc>"] = "close_window",
          ["e"] = "close_window",
          ["a"] = "focus_preview",
          ["<tab>"] = {
            "toggle_preview",
            config = {
              use_float = true,
              use_snacks_image = true,
              use_image_nvim = true,
            },
          },
          ["A"] = {
            "add",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "relative", -- "none", "relative", "absolute"
            },
          },
        },
      },
      default_component_configs = {
        container = {
          enable_character_fade = true,
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
        ["_"] = { -- match any node
          collapse = true,
          match = function(node) return node.type == "directory" and node.name:match "^src$" end,
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
          hide_gitignored = true,
          hide_dotfiles = false,
          always_show_by_pattern = {
            ".env*",
          },
          hide_by_name = {
            "node_modules",
            ".github",
            -- ".gitignore",
            "package-lock.json",
            ".changeset",
            -- ".prettierrc.json",
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
    commands = {},
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
