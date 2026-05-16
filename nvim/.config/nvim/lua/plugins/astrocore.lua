-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {

    autocmds = {},

    commands = {
      LspLogClear = {
        function()
          local lsplogpath = vim.fn.stdpath "state" .. "/lsp.log"
          if io.close(io.open(lsplogpath, "w+b")) == false then
            vim.notify("Clearing LSP Log failed.", vim.log.levels.WARN)
          end
        end,
        desc = "Clear the LSP log file",
      },
    },

    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },

    diagnostics = {
      virtual_text = true,
      underline = true,
      update_in_insert = false,
    },

    -- passed to `vim.filetype.add`
    filetypes = {
      extension = {
        foo = "fooscript",
        fish = "fish",
        kdl = "kdl",
        gd = "gdscript",
      },
      filename = {
        [".foorc"] = "fooscript",
        ["compose.*%.ya?ml"] = "yaml.docker-compose",
        ["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
        [".env.*"] = "sh",
      },
    },
    options = {
      opt = {
        shell = "/usr/bin/env fish",
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        shiftwidth = 2,
        tabstop = 2,
        cmdheight = 0,
        scrolloff = 10,
        laststatus = 3,
        linespace = 11,
        cursorlineopt = "both",
      },
      g = {},
    },
  },
}
