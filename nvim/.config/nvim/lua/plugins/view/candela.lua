---@type Candela.Config
local opts = {
  window = {
    width = 0.5, -- fraction of screen width
    min_height = 5,
    max_height = 30,
    margin = 16,
  },
  engine = {
    command = nil, -- auto-detected: rg > ag > ugrep > ack > grep
    args = {},
  },
  matching = {
    auto_refresh = false, -- refresh highlights on buffer switch
    case = "system", -- "system" | "sensitive" | "ignore" | "smart"
    hl_eol = false, -- highlight entire line vs matched text only
  },
  lightbox = {
    default_view = "system-vsplit", -- default split for UI keymap
    fold_style = "nvim", -- "nvim" | "fillchar" | "count" | "preview" | "detailed"
    fillchar = "-",
    custom_foldtext = nil,
  },
  icons = {
    nerd_font = false, -- set true for default nerd font icons
    -- if nerd_font == true:
    -- if nerd_font == false:
  },
  palette = {
    use = "replace", -- "replace" | "prepend" | "append"
    cycle = "constant", -- "constant" | "random"
    colors = { dark = { ... }, light = { ... } },
    swatches = { dark = { ... }, light = { ... } },
  },
  syntax_highlighting = {
    enabled = true,
    file_types = { ".log", "text" },
  },
}

return {
  "KieranCanter/candela.nvim",
  lazy = true,
  opts = opts,
  specs = {
    { "AstroNvim/astroui", opts = { icons = { log = "" } } },
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        local prefix = "<Leader>C"
        maps.n[prefix] = { desc = require("astroui").get_icon("log", 1, true) .. "log" }
        maps.n[prefix .. "c"] = {
          "<Plug>CandelaUi",
          desc = "toggle candela",
        }
        maps.n[prefix .. "r"] = {
          "<Plug>CandelaRefresh",
          desc = "refresh candela",
        }
        maps.n[prefix .. "x"] = {
          "<Plug>CandelaClear",
          desc = "clear candela",
        }
        maps.n[prefix .. "<F1>"] = {
          "<Plug>CandelaHelp",
          desc = "show candela help",
        }
        maps.n[prefix .. "d"] = {
          "<Plug>CandelaLightbox",
          desc = "toggle candela lightbox",
        }
      end,
    },
  },
}
