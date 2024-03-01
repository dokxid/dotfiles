local ucolors = require("catppuccin.utils.colors")
local mocha = require("catppuccin.palettes").get_palette("mocha")

local catppuccin = require("catppuccin")

catppuccin.setup({
	styles = {
		keywords = { "italic" },
		variables = { "italic" },
		booleans = { "italic" },
		properties = { "italic" },
	},
	transparent_background = false,
	term_colors = true,
	-- Integrations
	integrations = {
		hop = true,
		lsp_trouble = true,
		mason = true,
		neogit = true,
		noice = true,
		notify = true,
		symbols_outline = true,
		treesitter_context = true,
		native_lsp = {
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
			inlay_hints = {
				background = false,
			},
		},
	},
	custom_highlights = function(colors)
		return {
			-- Cmp Menu
			PmenuSel = { fg = colors.base, bg = colors.maroon, style = { "bold" } },

			-- Telescope
			TelescopeBorder = { fg = colors.blue },
			TelescopeSelectionCaret = { fg = colors.flamingo },
			TelescopeSelection = { fg = colors.text, bg = colors.surface0, style = { "bold" } },
			TelescopeMatching = { fg = colors.blue },
			TelescopePromptPrefix = { fg = colors.yellow, bg = colors.crust },
			TelescopePromptNormal = { bg = colors.crust },
			TelescopeResultsNormal = { bg = colors.mantle },
			TelescopePreviewNormal = { bg = colors.crust },
			TelescopePromptBorder = { bg = colors.crust, fg = colors.crust },
			TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
			TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
			TelescopePromptTitle = { fg = colors.crust, bg = colors.mauve },
			TelescopeResultsTitle = { fg = colors.crust, bg = colors.mauve },
			TelescopePreviewTitle = { fg = colors.crust, bg = colors.mauve },

			-- Bufferline
			BufferLineIndicatorSelected = { fg = colors.pink },
			BufferLineIndicator = { fg = colors.base },
			BufferLineModifiedSelected = { fg = colors.teal },
			TabLineSel = { bg = colors.pink },

			-- Cursorline & Linenumbers
			CursorLine = { bg = colors.mantle },

			-- Visual Mode
			Visual = { bg = ucolors.darken("#9745be", 0.25, mocha.mantle), style = { "italic" } },
		}
	end,
	highlight_overrides = {},
	color_overrides = {},
})
