return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      sessions = {
        autosave = {
          last = true,
          cwd = true,
          enabled = false,
          notify = true,
        },
        ignore = {
          dirs = { os.getenv "HOME" },
          filetypes = { "gitcommit", "gitrebase" },
          buftypes = {},
        },
      },
      autocmds = {
        restore_session = {
          {
            event = "VimEnter",
            desc = "Restore previous directory session if neovim opened with no arguments",
            nested = true,
            callback = function()
              -- no args & not home dir => load directory_session(cwd)
              if vim.fn.argc(-1) == 0 then
                local cwd = vim.fn.getcwd()
                if not (cwd == os.getenv "HOME") then
                  require("resession").load(cwd, { dir = "dirsession", silence_errors = true })
                end
              end
            end,
          },
        },
      },
    },
  },
}
