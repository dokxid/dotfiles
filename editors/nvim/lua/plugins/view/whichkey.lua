return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@class wk.Opts
  opts = {
    ---@type wk.Win.opts
    win = {
      -- height = { min = 6, max = 25 },
      no_overlap = false,
      title = true,
    },
    ---@type (string|wk.Sorter)[]
    --- Available sorters:
    --- * local: buffer-local mappings first
    --- * order: order of the items (Used by plugins like marks / registers)
    --- * group: groups last
    --- * alphanum: alpha-numerical first
    --- * mod: special modifier keys last
    --- * manual: the order the mappings were added
    --- * case: lower-case first
    sort = { "alphanum", "order", "group", "mod" },
    ---@type "classic" | "modern" | "helix"
    preset = "helix",
    delay = 100,
    show_help = false,
    show_keys = true,
    icons = {
      separator = "", -- symbol used between a key and it's label
    },
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
  },
}
