--type nvimtree.options
local options = {
	filters = {
		dotfiles = false,
		git_ignored = false,
		-- exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
	},
	disable_netrw = true,
	reload_on_bufenter = true,
	hijack_netrw = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
		update_cwd = true,
	},
	view = {
		adaptive_size = true,
		side = "left",
		width = 35,
		preserve_window_proportions = true,
	},
	git = {
		enable = true,
		ignore = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = true,
			quit_on_open = true,
		},
	},
	renderer = {
		root_folder_label = true,
		highlight_git = true,
		highlight_opened_files = "all",
		symlink_destination = false,

		indent_markers = {
			enable = false,
		},

		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = true,
			},

			glyphs = {
				default = "󰈚",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
}

require("nvim-tree").setup(options)
