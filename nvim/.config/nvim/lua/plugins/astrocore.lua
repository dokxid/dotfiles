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
        fish = "fish",
        kdl = "kdl",
        gd = "gdscript",
      },
      filename = {
        [".foorc"] = "fooscript",
        ["docker-compose.yml"] = "yaml.dockercompose",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
        [".env.*"] = "sh",
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
        scrolloff = 10, -- sets vim.opt.scrolloff
        laststatus = 3, -- sets vim.opt.laststatus
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
      },
    },
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      n = {
        -- utils
        ["<F6>"] = {
          "<cmd>CompilerOpen<cr>",
          desc = "Open compiler",
        },

        -- splits
        ["\\"] = {
          "<cmd>vsplit<cr>",
          desc = "vertical split",
        },
        ["|"] = {
          "<cmd>split<cr>",
          desc = "horizontal split",
        },

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
        ["Q"] = { "<cmd>confirm q<cr>", desc = "Quit with confirmation" },

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
        ["<Leader>fw"] = {
          function() require("snacks").picker.grep { dirs = { vim.fn.getcwd() } } end,
          desc = "grep",
        },
        ["<Leader>fW"] = {
          function() require("snacks").picker.grep { dirs = { vim.fn.getcwd() }, hidden = true, ignored = true } end,
          desc = "grep in all files",
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

        -- terminal
        ["<Leader>tf"] = false,
        ["<Leader>tt"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm float" },
        ["<F12>"] = { "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        ["q"] = "<Nop>",
        ["<F1>"] = "<Nop>",
      },
      i = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
      },
      t = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
        ["qq"] = { "<cmd>confirm q<cr>", desc = "Quit with confirmation" },
      },
      v = {
        ["q"] = "<Nop>",
      },
    },
  },
}
