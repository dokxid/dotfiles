-- configuration
-- https://github.com/mikavilpas/yazi.nvim#%EF%B8%8F-configuration

local mappings = {
  ["<F2>"] = {
    "<cmd>Yazi toggle<cr>",
    desc = "Resume the last yazi session",
  },
  ["<F3>"] = {
    "<cmd>Yazi<cr>",
    desc = "Open yazi at the current file",
  },
  ["<s-F3>"] = {
    "<cmd>Yazi cwd<cr>",
    desc = "Open the file manager in nvim's working directory",
  },
}

---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",

  ---@type YaziConfig
  opts = {
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
      open_file_in_vertical_split = "|",
      open_file_in_horizontal_split = "\\",
      cycle_open_buffers = "<tab>",
    },
    highlight_hovered_buffers_in_same_directory = true,
  },

  -- https://github.com/mikavilpas/yazi.nvim/issues/802
  init = function() vim.g.loaded_netrwPlugin = 1 end,

  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = {
          n = mappings,
          v = mappings,
          l = mappings,
          o = mappings,
          t = mappings,
        },
      },
    },
    { "nvim-lua/plenary.nvim", lazy = true },
  },
}
