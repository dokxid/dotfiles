return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    -- require "astronvim.plugins.configs.luasnip"(plugin, opts)
    -- vim.tbl_map(
    --   function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
    --   { "vscode", "snipmate", "lua" }
    -- )
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/snippets" },
    }
  end,
}
