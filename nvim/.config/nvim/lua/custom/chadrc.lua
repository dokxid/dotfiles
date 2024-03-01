---@type ChadrcConfig
---@class ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "catppuccin",
	theme_toggle = { "catppuccin", "one_light" },
	hl_override = highlights.override,
	hl_add = highlights.add,

	statusline = {
		theme = "minimal",
		separator_style = "block",
		overriden_modules = function(modules)
			-- define the somefunction anywhwere in your custom dir, just call it well!
			-- modules[2] = somefunction()

			-- adding a module between 2 modules
			-- Use the table.insert functin to insert at specific index
			-- This will insert a new module at index 2 and previous index 2 will become 3 now

			table.insert(
				modules,
				5,
				(function()
					return vim.fn.getcwd()
				end)()
			)
		end,
	},

	nvdash = {
		load_on_startup = true,
		header = {
			" ⢀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣧⣄ ",
			"⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠉⠉⠉⠙⠻⣅⠀⠈⢧⠀⠈⠛⠉⠉⢻⣿⣿⣿⣧",
			"⠨⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣤⡶⠟⠀⠀⣈⠓⢤⣶⡶⠿⠛⠻⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣿⢣⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣀⣴⠶.⠿⢷⡄⠀⠀⢀⣤⣾⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⣡⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣦⣤⣤⡀⠀⢷⡀⢀⣻⣿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠛⠶⠛⠃⠈⠈⢿⣿⣿⣿⣿",
			"⣿⣿⣿⣿⠟⠘⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀|⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿",
			"⣿⣿⣿⠏⠀⠁⠀⠀⠀⠀⠀⠀⠀⢀x⡄⠀⠀⠀⠀⠀⠀⣡⣄,⡆⠀⠀⠀⠀⣿⣿⣿⣿",
			"⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠛⠛⢛⣲⣶⣿⣷⣉⠉⢉⣥⡄⠀⠀⠀⠨⣿⣿⣿⣿",
			"⣿⣿⡇⢠⡆⠀⠀⢰⠀⠀⠀⠀⢸⣿⣧⣠⣠⣿⣿⣿⣿⣿⣷⣾⣿⡅⠀⠀⡄⠠⢸⣿⣿⣿",
			"",
			"",
			"why are we doing all",
			"of this again? ,,,,,",
			"",
		},
		project = {
			enable = true,
			limit = 8,
			icon = "your icon",
			label = "",
			action = "Telescope find_files cwd=",
		},
		buttons = {
			{ "persisted,,,", "l_pp", "Telescope persisted" },
			{ "find me,,,", "l_ff", "Telescope find_files" },
			{ "desperate,,,", "l_ch", "NvCheatSheet" },
			{ "lazy bug,,,", "l_ld", "Lazy" },
		},
		footer = {
			"",
			"♡( ◡‿◡ )",
		},
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
