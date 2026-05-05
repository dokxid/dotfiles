---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {

      n = {
        -- lsp
        ["gt"] = {
          function() vim.lsp.buf.type_definition() end,
          desc = "go to type definition",
        },

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
        ["<Leader>e"] = { desc = "explorer" },
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
        ["<F12>"] = { "<Cmd>ToggleTerm name=default<CR>", desc = "ToggleTerm" },

        -- misc
        ["<Leader>a"] = { desc = "misc" },
        ["<Leader>ar"] = {
          "<cmd>AstroRoot<cr>",
          desc = "astroroot",
        },
        ["<Leader>ad"] = {
          "<cmd>DiffviewOpen<ct>",
          desc = "diff view: working tree changes",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        ["q"] = "<Nop>",
        ["<Leader>w"] = false,
        ["<Leader>Q"] = false,
      },
      i = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
      },
      t = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
        ["qq"] = { "<cmd>confirm q<cr>", desc = "Quit with confirmation" },
        -- ["<Esc>"] = { "<cmd>confirm q<cr>", desc = "Quit with confirmation" },
        -- ["q"] = "<Nop>",
      },
      v = {
        ["q"] = "<Nop>",
      },
    },
  }
}
