function NO_SSH()
  if vim.g.remote_neovim_host then return {} end
end

NO_SSH()

return {
  -- language support
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.zig" },
  -- { import = "astrocommunity.pack.haskell" },
  -- { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.eslint" },
  { import = "astrocommunity.pack.go" },

  -- neovide support
  { import = "astrocommunity.recipes.neovide" },
}
