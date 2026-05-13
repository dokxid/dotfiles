-- configuration:
-- https://docs.astronvim.com/recipes/mappings/

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {

      n = {
        -- splits
        ["|"] = { "<cmd>vsplit<cr>", desc = "vertical split" },
        ["\\"] = { "<cmd>split<cr>", desc = "horizontal split" },
        ["Q"] = { "<cmd>confirm q<cr>", desc = "Quit with confirmation" },

        -- buffers
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["}"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["{"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- leaders
        ["<Leader>bb"] = false,
        ["<Leader>c"] = {
          -- https://docs.astronvim.com/recipes/dashboard/#open-dashboard-automatically-when-no-more-buffers
          function()
            local bufs = vim.fn.getbufinfo { buflisted = 1 }
            require("astrocore.buffer").close(0)
            if not bufs[2] then require("snacks").dashboard() end
          end,
          desc = "Close buffer",
        },
        ["<Leader>a"] = { desc = "misc" },
        ["<Leader>."] = {
          "<cmd>AstroRoot<cr>",
          desc = "astroroot",
        },
        ["<Leader>ar"] = {
          "<cmd>AstroReload<cr>",
          desc = "astroreload",
        },
        ["<Leader>ad"] = {
          "<cmd>DiffviewOpen<ct>",
          desc = "diff view: working tree changes",
        },
        ["<Leader>w"] = false,
        ["<Leader>Q"] = false,

        -- terminal
        ["<F12>"] = { "<Cmd>ToggleTerm name=default<CR>", desc = "ToggleTerm" },

        -- util
        ["<Esc>"] = { "<Cmd>nohlsearch<CR>", desc = "Clear search highlights" },
        ["<C-s>"] = { ":w<CR>", desc = "save file" },

        -- view manipulation
        ["<PageUp>"] = { "<C-u>", desc = "Scroll up" },
        ["<PageDown>"] = { "<C-d>", desc = "Scroll down" },

        -- text manipulation
        ["<C-S-Down>"] = { "<Cmd>move .+1<CR>", desc = "Move line down" },
        ["<C-S-Up>"] = { "<Cmd>move .-2<CR>", desc = "Move line up" },
        ["<C-S-Left>"] = { "<S-v><<Esc>", desc = "Move line down" },
        ["<C-S-Right>"] = { "<S-v>><Esc>", desc = "Move line up" },

        -- splits
        ["<C-Left>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
        ["<C-Down>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
        ["<C-Up>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
        ["<C-Right>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
        ["<C-K>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<C-J>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
        ["<C-H>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<C-L>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },

        -- nops
        ["q"] = "<Nop>",
        ["x"] = "<Nop>",
      },
      i = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
        ["<S-Down>"] = { "<Esc><Cmd>move .+1<CR>==gi", desc = "Move line down" },
        ["<S-Up>"] = { "<Esc><Cmd>move .-2<CR>==gi", desc = "Move line up" },
        ["<C-Space>"] = "<Nop>",
      },
      t = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
        ["qq"] = { "<cmd>confirm q<cr>", desc = "Quit with confirmation" },
        ["<Esc><Esc>"] = {
          "<C-\\><C-n>",
          desc = "exit terminal mode",
        },
      },
      v = {
        -- nops
        ["q"] = "<Nop>",
      },
    },
  },
}
