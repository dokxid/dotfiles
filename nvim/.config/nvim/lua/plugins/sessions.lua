-- filter by dirsessions
function GENERATE_DIRSESSIONS()
  local sessions = {}
  for idx, session in ipairs(require("resession").list { dir = "dirsession" }) do
    local sanitized_dirpath = session:gsub("__", ":/"):gsub("_", "/")
    local path_structure = {}
    local display_value

    for item in string.gmatch(sanitized_dirpath, "[^/]+") do
      table.insert(path_structure, item)
    end

    if string.match(sanitized_dirpath, os.getenv "HOME" .. "/dotfiles/") then
      display_value = string.format(".dot/%s", (".dots/" .. path_structure[#path_structure]))
    elseif string.match(sanitized_dirpath, os.getenv "HOME" .. "/projects/") then
      display_value = string.format(".projects/%s", (".proj/" .. path_structure[#path_structure]))
    elseif string.match(sanitized_dirpath, "/repos") then
      display_value = string.format(".repos/%s", (".repo/" .. path_structure[#path_structure]))
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

return {
  {
    "AstroNvim/astrocore",
    fn = {
      picker = function()
        require("pick-resession").pick {
          snacks_finder = GENERATE_DIRSESSIONS,
          dir = "dirsession",
        }
      end,
    },
    ---@type AstroCoreOpts
    opts = {
      -- Configuration table of session options for AstroNvim's session management powered by Resession
      sessions = {
        -- Configure auto saving
        autosave = {
          last = true, -- auto save last session
          cwd = true, -- auto save session for each working directory
          enabled = true,
          notify = true,
        },
        -- Patterns to ignore when saving sessions
        ignore = {
          dirs = {}, -- working directories to ignore sessions in
          filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
          buftypes = {}, -- buffer types to ignore sessions
        },
      },
      autocmds = {
        restore_session = {
          {
            event = "VimEnter",
            desc = "Restore previous directory session if neovim opened with no arguments",
            nested = true, -- trigger other autocommands as buffers open
            callback = function()
              if vim.fn.argc(-1) == 0 then
                -- try to load a directory session using the current working directory if no args
                local cwd = vim.fn.getcwd()
                -- except home dir
                if not (cwd == os.getenv "HOME") then
                  require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = false })
                end
              end
            end,
          },
        },
      },
    },
  },
  {
    "scottmckendry/pick-resession.nvim",
    opts = {
      prompt_title = "sessions",
      layout = "default", -- "default", "dropdown", "ivy", "select", "vscode"
      default_icon = {
        icon = " ",
        highlight = "Directory",
      },
      -- These are processed in order, so put more specific matches first
      path_icons = {
        {
          match = os.getenv "XDG_CONFIG_HOME" or os.getenv "HOME" .. "/.config/",
          icon = " ",
          highlight = "Special",
        },
        {
          match = ".dot/",
          icon = " ",
          highlight = "Special",
        },
        {
          match = ".repos/",
          icon = " ",
          highlight = "Special",
        },
        {
          match = ".projects/",
          icon = "󰄛 ",
          highlight = "Special",
        },
        {
          match = os.getenv "HOME",
          icon = "󰄛 ",
          highlight = "Directory",
        },
      },
    },
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fe"] = {
              function()
                require("pick-resession").pick {
                  snacks_finder = GENERATE_DIRSESSIONS,
                  dir = "dirsession",
                }
              end,
              desc = "find session",
            },
          },
        },
      },
    },
  },
}
