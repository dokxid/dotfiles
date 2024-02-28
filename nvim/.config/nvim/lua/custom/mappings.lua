---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
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

M.misc = {
  n = {
    ["<leader>n"] = { ":ASToggle <CR>", "toggle auto save" },
    ["<leader>ld"] = { ":Lazy <CR>", "lazy" },
    ["<leader>pp"] = { ":Telescope workspaces <CR>", "open session" },
    ["<leader>cv"] = { "<C-V>", "enter visual block mode" },
    ["\\"] = {
	    function()
		    require("ufo").peekFoldedLinesUnderCursor()
	    end,
    },
    ["zz"] = { "zi", "toggle fold" },
  },
}

return M
