local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
---@class NvPluginSpec
local plugins = {

	-- suda
	{
		"lambdalisue/suda.vim",
	},

	-- catppuccin
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

	-- transparent
	{
		"xiyaowong/transparent.nvim",
		lazy = true,
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
			-- auto_refresh = false
		},
		event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
		keys = {
			-- Keymap to open VenvSelector to pick a venv.
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
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
