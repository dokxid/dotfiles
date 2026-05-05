return {
  "neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function() require("neo-tree.command").execute { action = "close" } end,
      },
    },
    window = {
      -- position = "float",
      mappings = {
        ["<Tab>"] = "next_source",
        ["K"] = {
          "toggle_preview",
          config = {
            use_float = true,
            title = "preview",
          },
        },
        ["."] = "toggle_hidden",
        ["`"] = "set_root",
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
    filesystem = {
      group_empty_dirs = false,
      scan_mode = "deep",
      filtered_items = {
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
}
