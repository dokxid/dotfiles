-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {

    autocmds = {},

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
        relativenumber = true,
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
      },
      g = {},
    },
  },
}
