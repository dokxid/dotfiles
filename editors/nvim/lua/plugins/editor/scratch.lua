local mappings = {
  n = {
    ["<Leader>n"] = {
      desc = " scratch",
    },
    ["<Leader>nn"] = {
      "<cmd>Scratch<cr>",
      desc = "file ",
    },
    ["<Leader>no"] = {
      "<cmd>ScratchOpen<cr>",
      desc = "existing ",
    },
  },
}

---@type LazySpec
return {
  "LintaoAmons/scratch.nvim",
  event = "VeryLazy",
  opts = {
    scratch_file_dir = vim.fn.stdpath "cache" .. "/scratch.nvim",
    window_cmd = "edit",
    file_picker = "snacks",
    filetypes = { "lua", "sh", "fish", "js", "ts", "rs" },
    filetype_details = {
      json = {}, -- empty table is fine
      ["project-name.md"] = {
        subdir = "project-name", -- group scratch files under specific sub folder
      },
      ["yaml"] = {},
      py = {
        subdir = "python-scripts/%", -- group scratch files under path with random generated subdirectory
        content = { "#!/usr/bin/env python3", "", "" },
        cursor = {
          location = { 3, 0 },
          insert_mode = false,
        },
      },
      go = {
        subdir = true, -- isolate each scratch file in its own subdirectory
        filename = "main", -- the filename of the scratch file in the subdirectory
        content = { "package main", "", "func main() {", "  ", "}" },
        cursor = {
          location = { 4, 2 },
          insert_mode = true,
        },
      },
    },
    localKeys = {
      {
        filenameContains = { "sh" },
        LocalKeys = {
          {
            cmd = "<CMD>RunShellCurrentLine<CR>",
            key = "<C-r>",
            modes = { "n", "i", "v" },
          },
        },
      },
    },
    picker_keys = {
      delete = "<C-x>", -- key to delete a scratch file from the picker
      toggle_mode = "<C-f>", -- toggle between files/grep/multi (snacks only)
    },
    picker_snacks_multi = true, -- true to start snacks picker in multi mode
    hooks = {},
  },
  dependencies = {
    { "folke/snacks.nvim" },
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        mappings = mappings,
      },
    },
  },
}
