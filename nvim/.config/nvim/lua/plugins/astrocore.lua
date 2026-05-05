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
      opt = { -- vim.opt.<key>
        shell = "/usr/bin/env fish",
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        shiftwidth = 2, -- sets vim.opt.shiftwidth
        tabstop = 2, -- sets vim.opt.tabstop
        cmdheight = 0, -- sets vim.opt.cmdheight
        scrolloff = 10, -- sets vim.opt.scrolloff
        laststatus = 3, -- sets vim.opt.laststatus
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
      },
    },
  },
}
