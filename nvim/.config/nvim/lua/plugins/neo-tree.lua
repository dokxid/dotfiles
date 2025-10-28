return {
  "neo-tree.nvim",
  opts = {
    window = {
      -- position = "float",
      mappings = {
        ["<Tab>"] = "next_source",
      },
    },
    filesystem = {
      -- group_empty_dirs = true,
      -- scan_mode = "deep",
      filtered_items = {
        visible = false, -- hide filtered items on open
        hide_gitignored = true,
        hide_dotfiles = false,
        hide_by_name = {
          ".github",
          -- ".gitignore",
          "package-lock.json",
          ".changeset",
          -- ".prettierrc.json",
        },
        never_show = {
          ".DS_Store",
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
  },
}
