-- https://github.com/folke/flash.nvim
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type Flash.Config
      opts = {
        label = {
          rainbow = {
            enabled = true,
            shade = 3,
          },
        },
        modes = {
          char = {
            jump_labels = true,
            search = { wrap = true },
          },
          treesitter = {
            label = { before = true, after = true, style = "overlay" },
            highlight = {
              backdrop = true,
              matches = true,
            },
          },
          treesitter_search = {
            label = { before = true, after = true, style = "overlay" },
            highlight = {
              backdrop = true,
              matches = true,
            },
          },
        },
        mappings = {
          x = {
            ["s"] = {
              function() require("flash").jump() end,
              desc = "Flash",
            },
            ["R"] = {
              function() require("flash").treesitter_search() end,
              desc = "Treesitter Search",
            },
            ["S"] = {
              function() require("flash").treesitter() end,
              desc = "Flash Treesitter",
            },
          },
          o = {
            ["r"] = {
              function() require("flash").remote() end,
              desc = "Remote Flash",
            },
            ["R"] = {
              function() require("flash").treesitter_search() end,
              desc = "Treesitter Search",
            },
            ["s"] = {
              function() require("flash").jump() end,
              desc = "Flash",
            },
            ["S"] = {
              function() require("flash").treesitter() end,
              desc = "Flash Treesitter",
            },
          },
          n = {
            ["s"] = {
              function() require("flash").jump() end,
              desc = "Flash",
            },
            ["S"] = {
              function() require("flash").treesitter() end,
              desc = "Flash Treesitter",
            },
            ["<C-F>"] = {
              function()
                require("flash").jump {
                  pattern = ".", -- initialize pattern with any char
                  search = {
                    mode = function(pattern)
                      -- remove leading dot
                      if pattern:sub(1, 1) == "." then pattern = pattern:sub(2) end
                      -- return word pattern and proper skip pattern
                      return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
                    end,
                  },
                  -- select the range
                  jump = { pos = "range" },
                }
              end,
            },
          },
        },
      },
    },
  },
  opts = {},
}
