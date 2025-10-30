-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        shiftwidth = 2, -- sets vim.opt.shiftwidth
        tabstop = 2, -- sets vim.opt.tabstop
        cmdheight = 0, -- sets vim.opt.cmdheight
        scrolloff = 5, -- sets vim.opt.scrolloff
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
      },
    },
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      i = {
        ["jj"] = { "<Esc>", desc = "Escape to normal mode" },
      },
      n = {

        -- buffers
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<Leader>bb"] = false,

        -- https://docs.astronvim.com/recipes/dashboard/#open-dashboard-automatically-when-no-more-buffers
        ["<Leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo { buflisted = 1 }
            require("astrocore.buffer").close(0)
            if not bufs[2] then require("snacks").dashboard() end
          end,
          desc = "Close buffer",
        },

        -- pickers
        ["<Leader>fe"] = {
          function() require("pick-resession").pick() end,
          desc = "find session",
        },

        -- neo-tree
        ["<Leader>e"] = { false, desc = "Explorer" },
        ["<Leader>ee"] = {
          ":Neotree toggle<CR>",
          desc = "explorer neo tree",
        },
        ["<Leader>ef"] = {
          ":Neotree float buffers<CR>",
          desc = "git neo tree",
        },
        ["<Leader>er"] = {
          ":Neotree float git_status git_base=main<CR>",
          desc = "git neo tree",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        ["q"] = false,
        ["<F1>"] = false,
      },
    },
  },
}
