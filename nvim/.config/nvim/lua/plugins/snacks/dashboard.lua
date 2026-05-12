local Snacks = require "snacks"

-- filter by dirsessions
local function generate_dirsessions()
  local sessions = {}
  for idx, session in ipairs(require("resession").list { dir = "dirsession" }) do
    local sanitized_dirpath = session:gsub("__", ":/"):gsub("_", "/")
    local path_structure = {}
    local display_value
    for item in string.gmatch(sanitized_dirpath, "[^/]+") do
      table.insert(path_structure, item)
    end
    if path_structure[5] == ".config" and path_structure[4] == path_structure[6] then
      display_value = string.format(".dot/%s", path_structure[6])
    else
      display_value = sanitized_dirpath
    end

    sessions[#sessions + 1] = {
      score = 0,
      text = session,
      value = session,
      idx = idx,
      display_value = display_value,
      file = sanitized_dirpath,
    }
  end
  return sessions
end

---@class snacks.dashboard.Config
return {
  preset = {
    header = [[the potato editor]],
    keys = {
      {
        icon = " ",
        key = "e",
        desc = "sessions",
        action = function() require("pick-resession").pick { snacks_finder = generate_dirsessions, dir = "dirsession" } end,
      },
      {
        icon = " ",
        key = "o",
        desc = "recent files",
        action = function() require("pick-resession").pick { snacks_finder = generate_dirsessions, dir = "dirsession" } end,
      },
      {
        icon = " ",
        key = ",",
        desc = ".config/nvim",
        action = function() Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath "config" }) end,
      },
      { icon = "󰒲 ", key = "l", desc = ":lazy zzz", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
    },
  },
  sections = {
    -- { section = "startup", padding = 2 },
    {
      pane = 1,
      cmd = "if not test '$zen' = ''; cat ~/.config/nvim/dashboard_header; sleep 0.1; end",
      section = "terminal",
      height = 13,
      padding = 2,
    },
    { section = "header", padding = 2 },
    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
  },
}
