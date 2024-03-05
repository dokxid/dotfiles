local actions = require "telescope.actions"

local previewers = require "telescope.previewers"

local Job = require "plenary.job"

-- local new_maker = function(filepath, bufnr, opts)
--   filepath = vim.fn.expand(filepath)
--   Job:new({
--     command = "file",
--     args = { "--mime-type", "-b", filepath },
--     on_exit = function(j)
--       local mime_type = vim.split(j:result()[1], "/")[1]
--       if mime_type == "text" then
--         previewers.buffer_previewer_maker(filepath, bufnr, opts)
--       else
--         -- maybe we want to write something to the buffer here
--         vim.schedule(function()
--           vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
--         end)
--       end
--     end,
--   }):sync()
-- end

local options = {

  defaults = {
    -- buffer_previewer_maker = new_maker,
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
        file_ignore_patterns = {
          "/%.cache/",
          "/%.cargo/",
          "/%.local/",
          "/%.config/",
        },
        -- shorten_path = true,
      },
    },
  },
}

require("telescope").setup(options)
