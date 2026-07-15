-- configuration:
-- https://docs.astronvim.com/recipes/mappings/

-- https://docs.astronvim.com/recipes/dashboard/#open-dashboard-automatically-when-no-more-buffers
local function close_buffer()
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  require("astrocore.buffer").close(0)
  if not bufs[2] then require("snacks").dashboard() end
end

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
        ["Q"] = { "<cmd>confirm q<cr>", desc = "quit with confirmation" },

        -- buffers
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["}"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["{"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- leaders
        ["<Leader>E"] = { function() require("yazi").yazi() end, desc = "yazi" },
        ["<Leader>c"] = { close_buffer, desc = " bfr" },
        ["<Leader>C"] = {
          function() require("astrocore.buffer").close_all(true) end,
          desc = " bfrs",
        },
        ["<Leader>a"] = { desc = "misc" },
        ["<Leader>R"] = {
          "<cmd>AstroRoot<cr>",
          desc = "astroroot",
        },
        ["<Leader>ar"] = {
          "<cmd>AstroReload<cr>",
          desc = "astroreload",
        },
        ["<Leader>ad"] = {
          "<cmd>DiffviewOpen<ct>",
          desc = "diff_view",
        },
        ["<Leader>p"] = { desc = " pacmans" },
        ["<Leader>pp"] = { function() require("lazy").home() end, desc = "lazy" },
        ["<Leader>po"] = { "<cmd>Mason<cr>", desc = "mason" },
        ["<Leader>pm"] = false,
        ["<Leader>pM"] = false,
        ["<Leader>ps"] = false,
        ["<Leader>pS"] = false,
        ["<Leader>pu"] = false,
        ["<Leader>pU"] = false,
        ["<Leader>pi"] = false,
        ["<Leader>bb"] = false,
        ["<Leader>bc"] = false,
        ["<Leader>w"] = false,
        ["<Leader>Q"] = false,
        ["<Leader>n"] = false,
        ["<Leader>h"] = false,
        ["<Leader>o"] = false,
        ["<Leader>S"] = false,
        ["<Leader>Sl"] = false,
        ["<Leader>SL"] = false,
        ["<Leader>Sd"] = false,
        ["<Leader>SD"] = false,
        ["<Leader>Sf"] = false,
        ["<Leader>SF"] = false,
        ["<Leader>Ss"] = false,
        ["<Leader>SS"] = false,
        ["<Leader>St"] = false,
        ["<Leader>S."] = false,

        -- session / cwd
        ["<Leader>s"] = { desc = "󱀀 sessions" },
        ["<Leader>sc"] = {
          function() require("yazi").yazi { change_neovim_cwd_on_close = true } end,
          desc = "yazi with cwd",
        },
        ["<Leader>ss"] = {
          function() require("resession").save(vim.uv.cwd(), { dir = "dirsession" }) end,
          desc = "dirsession 󰆓",
        },

        -- terminal
        ["<F12>"] = { "<Cmd>ToggleTerm name=default<CR>", desc = "ToggleTerm" },

        -- util
        ["<Esc>"] = { "<Cmd>nohlsearch<CR>", desc = "Clear search highlights" },
        ["<C-s>"] = {
          function()
            vim.cmd.write()
            require("resession").save(vim.uv.cwd(), { dir = "dirsession" })
          end,
          desc = "file and dirses 󰆓",
        },
        ["<C-S>"] = {
          function() vim.cmd.write() end,
          desc = "file 󰆓",
        },
        ["<C-w>"] = { close_buffer, desc = "close buffer" },

        -- view/cursor manipulation
        ["<PageUp>"] = { "<C-u>", desc = "Scroll up" },
        ["<PageDown>"] = { "<C-d>", desc = "Scroll down" },
        ["`"] = { "^", desc = "go to start of line" },
        ["~"] = { "$", desc = "go to end of line" },

        -- text manipulation
        ["<C-/>"] = { require("vim._comment").operator() .. "_", desc = "Toggle comment" },
        ["<C-c>"] = { function() vim.cmd [[normal! "+y]] end, desc = "copy to clipboard" },
        ["<C-v>"] = { function() vim.api.nvim_paste(vim.fn.getreg "+", true, -1) end, desc = "paste from clipboard" },

        -- splits
        ["<C-Left>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
        ["<C-Down>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
        ["<C-Up>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
        ["<C-Right>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
        ["<C-A-Left>"] = { function() require("smart-splits").swap_buf_left() end, desc = "swap with left split" },
        ["<C-A-Down>"] = { function() require("smart-splits").swap_buf_down() end, desc = "swap with below split" },
        ["<C-A-Up>"] = { function() require("smart-splits").swap_buf_up() end, desc = "swap with above split" },
        ["<C-A-Right>"] = { function() require("smart-splits").swap_buf_right() end, desc = "swap with right split" },
        ["<C-K>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<C-J>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
        ["<C-H>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<C-L>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
        ["<C-S-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<C-S-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
        ["<C-S-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<C-S-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },

        -- nops
        ["q"] = "<Nop>",
        ["x"] = "<Nop>",
      },
      i = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
        ["<S-Down>"] = { "<Esc><Cmd>move .+1<CR>==gi", desc = "Move line down" },
        ["<S-Up>"] = { "<Esc><Cmd>move .-2<CR>==gi", desc = "Move line up" },
        ["<C-Space>"] = "<Nop>",

        -- text manipulation
        ["<C-v>"] = { function() vim.api.nvim_paste(vim.fn.getreg "+", true, -1) end, desc = "paste from clipboard" },
      },
      t = {
        ["<F12>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
        ["qq"] = { "<cmd>confirm q<cr>", desc = "Quit with confirmation" },
        ["<Esc><Esc>"] = {
          "<C-\\><C-n>",
          desc = "exit terminal mode",
        },

        -- text manipulation
        ["<C-v>"] = { function() vim.api.nvim_paste(vim.fn.getreg "+", true, -1) end, desc = "paste from clipboard" },
      },
      v = {
        ["v"] = { "<Esc><C-V>", desc = "block select" },

        -- text manipulation
        ["<C-v>"] = { function() vim.api.nvim_paste(vim.fn.getreg "+", true, -1) end, desc = "paste from clipboard" },

        -- nops
        ["q"] = "<Nop>",
      },
    },
  },
}
