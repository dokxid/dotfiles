---@module 'snacks'

local Tree = require "snacks.explorer.tree"

local tree_get = Tree.get
Tree.get = function(self, cwd, cb, opts)
  local cwd_node = Tree:find(cwd)
  local cwd_open = cwd_node.open
  tree_get(self, cwd, function(node)
    if node.path == cwd_node.path then node.open = cwd_open end
    if node.path ~= cwd_node.path and not cwd_open then return end
    cb(node)
  end, opts)
end

local cache_open = {}

local tree_toggle = function(path, open)
  if open == false or open == nil then
    Tree:close(path)
  else
    Tree:open(path)
  end
end

return {
  "folke/snacks.nvim",
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          dirs = { "~/dotfiles/", "~/repos/", "~/projects/" },
          finder = function(opts, ctx)
            local find = require("snacks.picker.source.explorer").explorer(opts, ctx)
            local dirs = opts.dirs or { ctx:cwd() } ---@diagnostic disable-line
            return function(cb)
              for _, cwd in ipairs(dirs) do
                if not ctx.picker.shown then tree_toggle(cwd, cache_open[cwd]) end
                cache_open[cwd] = Tree:node(cwd).open
                ctx.picker:set_cwd(cwd)
                find(cb)
              end
            end
          end,
        },
      },
    },
  },
  dependencies = {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader><CR>"] = {
            function() Snacks.picker.explorer() end,
            desc = "open snacks explorer",
          },
        },
      },
    },
  },
}
