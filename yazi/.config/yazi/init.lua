require("folder-rules"):setup()
require("git"):setup()
-- require("autosession"):setup()
require("recycle-bin"):setup()

-- nvim specific
if os.getenv("NVIM") then
	require("toggle-pane"):entry("min-preview")
else
	require("starship"):setup()
end

-- https://github.com/hankertrix/augment-command.yazi#configuration
require("augment-command"):setup({
	prompt = false,
	default_item_group_for_prompt = "hovered",
	smart_enter = true,
	smart_paste = false,
	smart_tab_switch = true,
	confirm_on_quit = true,
	open_file_after_creation = false,
	enter_directory_after_creation = false,
	use_default_create_behaviour = false,
	enter_archives = true,
	extract_retries = 3,
	recursively_extract_archives = true,
	preserve_file_permissions = false,
	encrypt_archives = false,
	encrypt_archive_headers = false,
	reveal_created_archive = true,
	remove_archived_files = false,
	must_have_hovered_item = true,
	skip_single_subdirectory_on_enter = true,
	skip_single_subdirectory_on_leave = true,
	smooth_scrolling = false,
	scroll_delay = 0.02,
	wraparound_file_navigation = true,
	protected_directories = {},
})

require("whoosh"):setup({
	bookmarks = {
		{ tag = "desktop", path = "~/Desktop", key = { "d", "D" } },
		{ tag = "documents", path = "~/Documents", key = { "d", "d" } },
		{ tag = "pictures", path = "~/Pictures", key = { "d", "p" } },
		{ tag = "videos", path = "~/Videos", key = { "d", "v" } },
		{ tag = "home", path = "~", key = { "h" } },
		{ tag = "downloads", path = "~/Downloads", key = { "o" } },
		{ tag = "repos", path = "~/repos", key = { "r" } },
		{ tag = "projects", path = "~/projects", key = { "p" } },
		{ tag = ".local/nvim", path = "~/.local/share/nvim/lazy", key = { "l", "n" } },
		{ tag = "dotfiles", path = "~/dotfiles", key = { "t" } },
		{ tag = ".config", path = "~/.config", key = { "c" } },
	},
	jump_notify = true,
	home_alias_enabled = true,
	special_keys = {
		fuzzy_search = "e",
		history = "<Backspace>",
		project_root = "-",
	},

	-- long folder name truncation
	path_truncate_enabled = false, -- Enable/disable path truncation
	path_max_depth = 3, -- Maximum path depth before truncation
	fzf_path_truncate_enabled = false, -- Enable/disable path truncation in fzf
	fzf_path_max_depth = 5, -- Maximum path depth before truncation in fzf
	path_truncate_long_names_enabled = false, -- Enable in navigation menu
	fzf_path_truncate_long_names_enabled = false, -- Enable in fzf
	path_max_folder_name_length = 20, -- Max length in navigation menu
	fzf_path_max_folder_name_length = 20, -- Max length in fzf

	-- History directory settings
	history_size = 10, -- Number of directories in history (default 10)
	history_fzf_path_truncate_enabled = false, -- Enable/disable path truncation by depth for history
	history_fzf_path_max_depth = 5, -- Maximum path depth before truncation for history (default 5)
	history_fzf_path_truncate_long_names_enabled = false, -- Enable/disable long folder name truncation for history
	history_fzf_path_max_folder_name_length = 30, -- Maximum length for folder names in history (default 30)

	-- File path for storing user bookmarks
	bookmarks_path = (
		ya.target_family() == "windows"
		and os.getenv("APPDATA") .. "\\yazi\\config\\plugins\\whoosh.yazi\\bookmarks"
	) or (os.getenv("HOME") .. "/.config/yazi/plugins/whoosh.yazi/bookmarks"),
})

require("eza-preview"):setup({
	-- Set the tree preview to be default (default: true)
	default_tree = true,

	-- Directory depth level for tree preview (default: 3)
	level = 3,

	-- Show file icons
	icons = true,

	-- Follow symlinks when previewing directories (default: true)
	follow_symlinks = true,

	-- Show target file info instead of symlink info (default: false)
	dereference = false,

	-- Show hidden files (default: true)
	all = true,

	-- Ignore files matching patterns (default: {})
	-- ignore_glob = "*.log"
	-- ignore_glob = { "*.tmp", "node_modules", ".git", ".DS_Store" }
	-- SEE: https://www.linuxjournal.com/content/pattern-matching-bash to learn about glob patterns
	ignore_glob = {},

	-- Ignore files mentioned in '.gitignore'  (default: true)
	git_ignore = true,

	-- Show git status (default: false)
	git_status = false,
})
