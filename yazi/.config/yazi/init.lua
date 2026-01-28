require("folder-rules"):setup()
require("git"):setup()
require("starship"):setup()

-- You can configure your bookmarks using simplified syntax
local bookmarks = {
  { tag = "Desktop",   path = "~/Desktop",   key = "d" },
  { tag = "Documents", path = "~/Documents", key = "D" },
  { tag = "Downloads", path = "~/Downloads", key = "o" },
}

-- -- You can also configure bookmarks with key arrays
-- local bookmarks = {
--   { tag = "Desktop",   path = "~/Desktop",   key = { "d", "D" } },
--   { tag = "Documents", path = "~/Documents", key = { "d", "d" } },
--   { tag = "Downloads", path = "~/Downloads", key = "o" },
-- }

-- Windows-specific bookmarks
if ya.target_family() == "windows" then
  local home_path = os.getenv("USERPROFILE")
  table.insert(bookmarks, {
    tag = "Scoop Local",
    path = os.getenv("SCOOP") or (home_path .. "\\scoop"),
    key = "p",
  })
  table.insert(bookmarks, {
    tag = "Scoop Global",
    path = os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop",
    key = "P",
  })
end

require("whoosh"):setup({
  -- Configuration bookmarks (cannot be deleted through plugin)
  bookmarks = bookmarks,

  -- Notification settings
  jump_notify = false,

  -- Key generation for auto-assigning bookmark keys
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",

  -- Configure the built-in menu action hotkeys
  -- false - hide menu item
  special_keys = {
    create_temp = "<Enter>",    -- Create a temporary bookmark from the menu
    fuzzy_search = "<Space>",   -- Launch fuzzy search (fzf)
    history = "<Tab>",          -- Open directory history
    previous_dir = "<Backspace>", -- Jump back to the previous directory
  },

  -- File path for storing user bookmarks
  bookmarks_path = (
    ya.target_family() == "windows"
    and os.getenv("APPDATA") .. "\\yazi\\config\\plugins\\whoosh.yazi\\bookmarks"
  ) or (os.getenv("HOME") .. "/.config/yazi/plugins/whoosh.yazi/bookmarks"),

  -- Replace home directory with "~"
  home_alias_enabled = true, -- Toggle home aliasing in displays

  -- Path truncation in navigation menu
  path_truncate_enabled = false, -- Enable/disable path truncation
  path_max_depth = 3,           -- Maximum path depth before truncation

  -- Path truncation in fuzzy search (fzf)
  fzf_path_truncate_enabled = false, -- Enable/disable path truncation in fzf
  fzf_path_max_depth = 5,           -- Maximum path depth before truncation in fzf

  -- Long folder name truncation
  path_truncate_long_names_enabled = false,    -- Enable in navigation menu
  fzf_path_truncate_long_names_enabled = false, -- Enable in fzf
  path_max_folder_name_length = 20,            -- Max length in navigation menu
  fzf_path_max_folder_name_length = 20,        -- Max length in fzf

  -- History directory settings
  history_size = 10,                                   -- Number of directories in history (default 10)
  history_fzf_path_truncate_enabled = false,           -- Enable/disable path truncation by depth for history
  history_fzf_path_max_depth = 5,                      -- Maximum path depth before truncation for history (default 5)
  history_fzf_path_truncate_long_names_enabled = false, -- Enable/disable long folder name truncation for history
  history_fzf_path_max_folder_name_length = 30,        -- Maximum length for folder names in history (default 30)
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
