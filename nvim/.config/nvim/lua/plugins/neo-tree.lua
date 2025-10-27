return {
  "neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false, -- hide filtered items on open
        hide_gitignored = false,
        hide_dotfiles = false,
        hide_by_name = {
          ".github",
          -- ".gitignore",
          "package-lock.json",
          ".changeset",
          -- ".prettierrc.json",
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
  },
}
