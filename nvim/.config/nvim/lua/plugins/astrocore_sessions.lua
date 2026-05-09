local home_path = os.getenv "HOME"
local config_path = os.getenv "XDG_CONFIG_HOME" or os.getenv "HOME" .. "/.config/"
local dotfiles_path = os.getenv "HOME" .. "/dotfiles/"
local home = "󱂵 "
local repo = "󱞊 "
local config = "󱁿 "

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- Configuration table of session options for AstroNvim's session management powered by Resession
      sessions = {
        -- Configure auto saving
        autosave = {
          last = true, -- auto save last session
          cwd = true,  -- auto save session for each working directory
          enabled = true,
          notify = true,
        },
        -- Patterns to ignore when saving sessions
        ignore = {
          dirs = {},                                -- working directories to ignore sessions in
          filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
          buftypes = {},                            -- buffer types to ignore sessions
        },
      },
      autocmds = {
        restore_session = {
          {
            event = "VimEnter",
            desc = "Restore previous directory session if neovim opened with no arguments",
            nested = true, -- trigger other autocommands as buffers open
            callback = function()
              -- Only load the session if nvim was started with no args
              if vim.fn.argc(-1) == 0 then
                -- try to load a directory session using the current working directory
                require("resession").load(
                  vim.fn.getcwd(),
                  { dir = "dirsession", silence_errors = true }
                )
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
        { match = config_path,           icon = config, highlight = "Directory" },
        { match = dotfiles_path,         icon = config, highlight = "Special" },
        { match = home_path .. "/repos", icon = repo,   highlight = "Special" },
        { match = home_path,             icon = home,   highlight = "Directory" },
      },
    },
  }
}
