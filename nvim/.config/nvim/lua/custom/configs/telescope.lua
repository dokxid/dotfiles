local actions = require "telescope.actions"

local options = {

  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
      },
    },
  },

  extensions = {

    rooter = {
      enable = true,
      patterns = {
        ".git",
      },
      debug = false,
    },

    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {},
      },
    },

    frecency = {
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      disable_devicons = false,
      show_filter_column = true,
      auto_validate = true,
      max_timestamps = 100,
      db_validate_threshold = 50,
      workspaces = {
        ["nvim"] = "/home/dokxid/dotfiles/nvim/.config/nvim/lua/custom/",
        ["conf"] = "/home/dokxid/.config",
        ["data"] = "/home/dokxid/.local/share",
        ["project"] = "/home/dokxid/projects",
      },
    },

    repo = {
      cached_list = {
        locate_opts = {
          "-d",
          vim.env.HOME .. "/locatedb",
        },
        file_ignore_patterns = {
          -- global ignores
          "/%.cache/",
          "/%.cargo/",
          "/%.local/",
          "/%.config/",
          -- macos
          "/Library/",
        },
        -- shorten_path = true,
      },
    },
  },
}

require("telescope").setup(options)
require("telescope").load_extension "repo"
require("telescope").load_extension "ui-select"
require("telescope").load_extension "zoxide"
require("telescope").load_extension "frecency"
