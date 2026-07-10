local default_sources = {
  -- "minuet",
  "lsp",
  "path",
  "calc",
}
local debug_sources = vim.list_extend(vim.deepcopy(default_sources), { "dap" })

---@type LazySpec
return {
  "Saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab",
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
        scrollbar = false,
      },
    },
    sources = {
      default = default_sources,
      per_filetype = { ["dap-repl"] = debug_sources, ["dap-view"] = debug_sources },
      providers = {
        minuet = {
          name = "minuet",
          module = "minuet.blink",
          score_offset = 50,
          async = true,
          timeout_ms = 3000,
        },
        lsp = {
          async = true,
        },
        calc = {
          name = "calc",
          module = "blink.compat.source",
        },
        dap = {
          name = "dap",
          module = "blink.compat.source",
          enabled = function() return require("cmp_dap").is_dap_buffer() end,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          fallbacks = { "lsp" },
        },
      },
    },
    appearance = {
      kind_icons = {
        Copilot = "",
        Minuet = "",
        Text = "󰉿",
        Method = "󰊕",
        Function = "󰊕",
        Constructor = "󰒓",

        Field = "󰜢",
        Variable = "󰆦",
        Property = "󰖷",

        Class = "󱡠",
        Interface = "󱡠",
        Struct = "󱡠",
        Module = "󰅩",

        Unit = "󰪚",
        Value = "󰦨",
        Enum = "󰦨",
        EnumMember = "󰦨",

        Keyword = "󰻾",
        Constant = "󰏿",

        Snippet = "󱄽",
        Color = "󰏘",
        File = "󰈔",
        Reference = "󰬲",
        Folder = "󰉋",
        Event = "󱐋",
        Operator = "󰪚",
        TypeParameter = "󰬛",
      },
    },
    cmdline = {
      completion = {
        menu = {
          auto_show = true,
        },
        ghost_text = {
          enabled = true,
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },
    },
    completion = {
      trigger = {
        prefetch_on_insert = false,
      },
      ghost_text = {
        enabled = true,
      },
      keyword = {
        range = "full",
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
        cycle = {
          from_bottom = true,
          from_top = true,
        },
      },
      accept = {
        auto_brackets = {
          enabled = true,
          override_brackets_for_filetypes = {
            tex = { "{", "}" },
          },
        },
      },
      menu = {
        min_width = 30,
        border = "rounded",
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 }, { "source" } },
          components = {
            label = {
              text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
              highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
            },
            source = {
              text = function(ctx)
                local map = {
                  ["lsp"] = "",
                  ["path"] = "󰉋",
                  ["snippets"] = "",
                  ["minuet"] = "",
                }

                return map[ctx.item.source_id]
              end,
              highlight = "BlinkCmpDoc",
            },
          },
        },
      },
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 500,
        update_delay_ms = 50,
        window = {
          max_width = math.min(80, vim.o.columns),
          border = "rounded",
        },
      },
    },
  },
  dependencies = {
    "xzbdmw/colorful-menu.nvim",
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
    "saghen/blink.compat",
    "onsails/lspkind.nvim",
    {
      "milanglacier/minuet-ai.nvim",
      lazy = true,
      enabled = true,
      opts = {
        provider = "openai_compatible",
        request_timeout = 2.5,
        throttle = 1000,
        debounce = 400,
        provider_options = {
          openai_compatible = {
            api_key = "COMPLETION_PROVIDER_API_KEY",
            end_point = os.getenv "COMPLETION_PROVIDER_ENDPOINT",
            model = "fhms/qwen3-coder-30b-a3b-instruct",
            stream = true,
            optional = {
              stream = true,
              max_tokens = 128,
              top_p = 0.5,
              reasoning_effort = "none",
              thinking = { type = "disabled" },
            },
          },
        },
      },
    },
  },
}
