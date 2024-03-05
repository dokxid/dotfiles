---@type MappingsTable
---@class MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>v"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.telescope = {
  n = {
    ["<leader>fz"] = { ":NvimTreeFocus <CR> :Telescope zoxide list <CR>", "open dir_zoxide" },
    ["<leader>ff"] = { ":Telescope frecency <CR>", "open files_frecent" },
    ["<leader>fd"] = { ":Telescope find_files <CR>", "open files_fuzzy" },
    ["<leader>fg"] = { ":Telescope repo cached_list <CR>", "open repos" },
  },
}

M.menus = {
  n = {
    ["<leader>ld"] = { ":Lazy <CR>", "lazy" },
    ["<leader>rr"] = { ":Yazi <CR>", "open yazi" },
    ["<leader>gg"] = { ":Neogit <CR>", "show neogit" },
    ["<leader>e"] = { ":NvimTreeToggle <CR>", "toggle tree" },
  },
}

M.fold = {
  n = {
    ["zz"] = { "zi", "toggle fold" },
    ["\\"] = {
      function()
        require("ufo").peekFoldedLinesUnderCursor()
      end,
      "peek fold",
    },
  },
}

M.misc = {
  n = {
    ["<leader>n"] = { ":ASToggle <CR>", "toggle auto save" },
    ["<leader>v"] = { ":ZenMode <CR>", "toggle zenmode" },
    ["<leader>cv"] = { "<C-V>", "enter visual block mode" },
  },
}

return M
