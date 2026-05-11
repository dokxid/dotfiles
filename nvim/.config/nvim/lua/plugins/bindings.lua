local layouts = {
  keybindings = {},
}

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
        ["}"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["{"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["Q"] = { "<cmd>confirm q<cr>", desc = "Quit with confirmation" },

        --- LEADERS
        -- ["<Leader>bb"] = false,
        ["<Leader>c"] = {
          -- https://docs.astronvim.com/recipes/dashboard/#open-dashboard-automatically-when-no-more-buffers
          function()
            local bufs = vim.fn.getbufinfo { buflisted = 1 }
            require("astrocore.buffer").close(0)
            if not bufs[2] then require("snacks").dashboard() end
          end,
          desc = "Close buffer",
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
        ["<Leader>w"] = false,
        ["<Leader>Q"] = false,

        -- nops
        ["q"] = "<Nop>",
      },
      i = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
      },
      t = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
        ["qq"] = { "<cmd>confirm q<cr>", desc = "Quit with confirmation" },
      },
      v = {
        -- nops
        ["q"] = "<Nop>",
      },
    },
  },
}
