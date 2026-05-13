return {
  "rebelot/heirline.nvim",
  dependencies = {
    { -- configure AstroUI to include a new UI icon
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          Clock = "", -- add icon for clock
        },
      },
    },
  },
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode {
        -- hl = {
        --   bg = require("astroui.status").hl.get_attributes("mode").bg,
        --   fg = require("catppuccin.palettes").get_palette().surface0,
        --   bold = true,
        -- },
      },
      -- status.component.git_diff {
      --   padding = { left = 0, right = 1 },
      -- },
      status.component.builder {
        provider = function()
          local icon = "  "
          local cwd = vim.fn.getcwd(0)
          cwd = vim.fn.fnamemodify(cwd, ":~")
          return icon .. cwd
        end,
        padding = { left = 1, right = 1 },
        hl = { fg = require("catppuccin.palettes").get_palette("mocha").lavender, italic = true },
      },
      -- status.component.git_branch(),
      status.component.file_info(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      -- status.component.virtual_env(),
      -- status.component.lsp(),
      -- status.component.treesitter(),
      status.component.builder {
        provider = "%8(󰷈 %l/%L%)", -- show hour and minute in 24 hour format
        padding = { left = 1, right = 0 },
        hl = { fg = require("catppuccin.palettes").get_palette("mocha").peach, bold = true },
      },
      status.component.nav {
        padding = { left = 0, right = 0 },
        ruler = false,
        percentage = false,
        scrollbar = { padding = { left = 0, right = 0 } },
      },
    }
  end,
}
