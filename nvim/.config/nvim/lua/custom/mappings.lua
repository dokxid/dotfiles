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

M.code_action = {
  n = {
    ["<leader>re"] = {
      function()
        require("renamer").rename()
      end,
      "rename",
    },
    ["<leader>ca"] = {
      function()
        require("cosmic-ui").code_actions()
      end,
      "code_action",
    },
    ["<leader>i"] = {
      function()
        require("nvim-toggler").toggle()
      end,
      "inverse value",
    },
  },
}

M.menus = {
  n = {
    ["<leader>rt"] = { ":OverseerRun <CR>", "run code" },
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
    ["<C-Up>"] = {
      function()
        require("moveline").up()
      end,
      "move line up",
    },
    ["<C-Down>"] = {
      function()
        require("moveline").down()
      end,
      "move line down",
    },
    ["<S-Up>"] = { "<C-U>", "go up" },
    ["<S-Down>"] = { "<C-D>", "go down" },
    ["<leader>as"] = { ":ASToggle <CR>", "toggle auto save" },
    ["<leader>v"] = { ":ZenMode <CR>", "toggle zenmode" },
    ["<leader>cv"] = { "<C-V>", "enter visual block mode" },
  },
  v = {
    ["<C-Up>"] = {
      function()
        require("moveline").block_up()
      end,
      "move sel lines up",
    },
    ["<C-Down>"] = {
      function()
        require("moveline").block_down()
      end,
      "move sel lines down",
    },
  },
}

return M
