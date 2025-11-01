return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode(),
      status.component.git_branch(),
      status.component.git_diff(),
      status.component.file_info(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      -- status.component.nav(),
      status.component.fill(),
      -- status.component.virtual_env(),
      status.component.lsp(),
      status.component.treesitter(),
      status.component.mode { surround = { separator = "right" } },
    }
  end,
}
