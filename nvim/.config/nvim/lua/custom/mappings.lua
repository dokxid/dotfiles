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

		--  format with conform
		["<leader>fm"] = {
			function()
				---@diagnostic disable-next-line: different-requires
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
		["<leader>e"] = { ":NvimTreeToggle <CR>", "toggle tree" },
		["<leader>rr"] = { ":Yazi <CR>", "open yazi" },
		["<leader>pp"] = { ":Telescope workspaces <CR>", "open session" },
		["<leader>ff"] = { ":NvimTreeFocus <CR> :Telescope zoxide list <CR>", "open zoxide" },
		["<leader>fd"] = { ":Telescope find_files <CR>", "open telescope" },
		["<leader>cv"] = { "<C-V>", "enter visual block mode" },
		["<leader>v"] = { ":ZenMode <CR>", "toggle zenmode" },
		["\\"] = {
			function()
				require("ufo").peekFoldedLinesUnderCursor()
			end,
		},
		["zz"] = { "zi", "toggle fold" },
	},
}

return M
