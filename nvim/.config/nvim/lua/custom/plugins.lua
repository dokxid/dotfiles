---@diagnostic disable: different-requires
local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
---@class NvPluginSpec
local plugins = {

	-- suda
	{ "lambdalisue/suda.vim" },

	{
		"NvChad/ui",
		config = function()
			-- require("plugins.configs.others").nvchad_ui()
			-- vim.opt.statusline = ""
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("custom.configs.catppuccin")
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},

	-- nougat
	{
		"MunifTanjim/nougat.nvim",
		enabled = false,
		lazy = false,
		config = function()
			require("custom.ui.pointy")
		end,
	},

	-- cinnamon
	{
		"declancm/cinnamon.nvim",
		lazy = false,
		-- enabled = false,
		config = function()
			require("cinnamon").setup({
				-- extra_keymaps = true,
				extended_keymaps = true,
				hide_cursor = true,
				always_scroll = true,
				default_delay = 2,
				-- override_keymaps = true,
			})
		end,
	},

	-- wilder
	{
		"gelguy/wilder.nvim",
		lazy = false,
		config = function()
			local wilder = require("wilder")
			wilder.setup({
				modes = { ":", "/", "?" },
			})
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
					-- 'single', 'double', 'rounded' or 'solid'
					-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
					border = "rounded",
					max_width = 40,
					max_height = "20%", -- max height of the palette
					min_height = 0, -- set to the same as 'max_height' for a fixed height window
					prompt_position = "bottom", -- 'top' or 'bottom' to set the location of the prompt
					reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
				}))
			)
		end,
	},

	-- auto-indent
	{
		"vidocqh/auto-indent.nvim",
		lazy = false,
		config = function()
			require("auto-indent").setup({
				lightmode = true, -- Lightmode assumes tabstop and indentexpr not change within buffer's lifetime
				indentexpr = nil, -- Use vim.bo.indentexpr by default, see 'Custom Indent Evaluate Method'
				ignore_filetype = {}, -- Disable plugin for specific filetypes, e.g. ignore_filetype = { 'javascript' }
			})
		end,
	},

	-- move
	{
		"matze/vim-move",
		lazy = false,
	},

	-- nvim-scrollbar
	{
		"petertriho/nvim-scrollbar",
		lazy = false,
		dependencies = {
			"catppuccin/nvim",
		},
		config = function()
			local mocha = require("catppuccin.palettes").get_palette("mocha")
			require("scrollbar").setup({
				throttle_ms = 50,
				handle = {
					text = "  ",
					color = mocha.peach,
					blend = 0,
				},
				handlers = {
					cursor = false,
					diagnostic = true,
					gitsigns = false, -- Requires gitsigns
					handle = true,
					search = false, -- Requires hlslens
					ale = false, -- Requires ALE
				},
				excluded_filetypes = {
					"NvimTree",
				},
			})
		end,
	},

	-- gitsign
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			-- require("scrollbar.handlers.gitsigns").setup()
		end,
	},

	-- zen-mode
	{
		"folke/zen-mode.nvim",
		lazy = false,
		priority = 900,
		config = function()
			require("zen-mode").setup({
				window = {
					width = 92,
					height = 1,
					options = {
						signcolumn = "no", -- disable signcolumn
						number = false, -- disable number column
						-- relativenumber = false, -- disable relative numbers
						cursorline = false, -- disable cursorline
						cursorcolumn = false, -- disable cursor column
						-- foldcolumn = "0", -- disable fold column
						list = false, -- disable whitespace characters
					},
				},
				plugins = {
					options = {
						laststatus = 1,
					},
					gitsigns = { enabled = false },
				},
			})
		end,
	},

	-- transparent
	{ "xiyaowong/transparent.nvim" },

	-- follow-md-links
	{
		"jghauser/follow-md-links.nvim",
		lazy = false,
	},

	-- nvim-lspimport
	{ "stevanmilic/nvim-lspimport" },

	-- fm-nvim (yazi fork)
	{ "is0n/fm-nvim" },

	-- dropbar (note: requires neovim >0.10.0)
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	["NvChad/ui"] = {
		config = function()
			require("plugins.configs.others").nvchad_ui()
			vim.opt.statusline = ""
		end,
	},

	-- barbecue (use this for dropbar fallback)
	{
		"utilyre/barbecue.nvim",
		enabled = false,
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},

	-- glow.nvim
	{
		"ellisonleao/glow.nvim",
		-- lazy = false,
		config = true,
		cmd = "Glow",
	},

	-- rainbow delimiter
	{
		"HiPhish/rainbow-delimiters.nvim",
		lazy = false,
	},

	-- eagle
	{
		"soulis-1256/eagle.nvim",
		lazy = false,
		config = function()
			require("eagle").setup({
				-- override the default values found in config.lua
			})
			vim.o.mousemoveevent = true
		end,
	},

	-- nvim-rooter
	{
		"notjedi/nvim-rooter.lua",
		lazy = false,
		config = function()
			require("nvim-rooter").setup({
				rooter_patterns = { ".git", ".hg", ".svn", ".config" },
				trigger_patterns = { "*" },
				manual = false,
				fallback_to_parent = false,
			})
		end,
	},

	-- venv-selector
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		opts = {
			-- Your options go here
			-- name = "venv",
			auto_refresh = true,
		},
		event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
		keys = {
			-- { "<leader>vs", "<cmd>VenvSelect<cr>" },
			-- { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
		},
	},

	-- telescope-z
	{
		"jvgrootveld/telescope-zoxide",
		lazy = false,
		config = function()
			require("telescope").load_extension("zoxide")
		end,
	},

	-- promise_async
	{
		"kevinhwang91/promise-async",
	},

	-- nvim-ufo
	{
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
		config = function()
			require("custom.configs.ufo")
		end,
	},

	-- nvim-surround
	{
		"kylechui/nvim-surround",
		lazy = false,
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- default
			})
		end,
	},

	-- nvim-workspaces
	{
		"natecraddock/workspaces.nvim",
		lazy = false,
		config = function()
			require("workspaces").setup({
				hooks = {
					open = { "NvimTreeOpen", "Telescope find_files" },
				},
				-- bla
			})
		end,
	},

	-- fzf
	{
		"junegunn/fzf",
		build = "./install --bin",
	},

	-- zoxide
	{
		"nanotee/zoxide.vim",
		lazy = false,
	},

	-- project
	{
		"ahmedkhalf/project.nvim",
		enabled = false,
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	-- tailwindcss-colorizer-cmp
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		lazy = false,
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},

	-- yazi
	{
		"DreamMaoMao/yazi.nvim",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},

		keys = {
			{ "<leader>gy", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
		},
	},

	-- persisted
	{
		"olimorris/persisted.nvim",
		enabled = false,
		lazy = true,
		priority = 90,
		config = function()
			require("persisted").setup({
				follow_cwd = false,
				ignored_dirs = { "/", "~" },
			})
		end,
	},

	-- auto-save
	{
		"Pocco81/auto-save.nvim",
		lazy = false,
		config = function()
			require("auto-save").setup({
				-- your config goes here
				-- or just leave it empty :)
			})
		end,
	},

	-- neoscroll
	{
		"karb94/neoscroll.nvim",
		enabled = false,
		lazy = false,
		config = function()
			require("neoscroll").setup({})
		end,
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- mason
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		-- opts = overrides.nvimtree,
		lazy = false,
		config = function()
			require("custom.configs.nvimtree")
			-- require("nvim-tree").setup {
			--
			--   sync_root_with_cwd = true,
			--   respect_buf_cwd = true,
			--   update_focused_file = {
			--     enable = true,
			--     update_root = true,
			--   },
			-- }
		end,
		-- require "custom.configs.nvimtree",
	},

	-- better-escape
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- conform
	{
		"stevearc/conform.nvim",
		--  for users those who want auto-save conform + lazyloading!
		event = "BufWritePre",
		config = function()
			require("custom.configs.conform")
		end,
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		opts = function()
			-- require('telescope').load_extension('projects')
			require("telescope").load_extension("workspaces")

			-- require("telescope").load_extension "persisted"
			-- require("telescope").setup {
			--   defaults = {},
			--   extensions = {
			--     persisted = {
			--       layout_config = { width = 0.55, height = 0.55 },
			--     },
			--   },
			-- }
		end,
	},
}

return plugins
