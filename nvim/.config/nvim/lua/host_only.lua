function NO_SSH()
  if vim.g.remote_neovim_host then return {} end
end

NO_SSH()

return {

  -- script / config languages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.python" },

  -- web languages
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.eslint" },

  -- compiled languages
  -- { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.cpp" },

  -- jvm languages
  { import = "astrocommunity.pack.java" },
  -- { import = "astrocommunity.pack.kotlin" },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "zulu-21",
                path = "/home/dokxid/.local/share/mise/installs/java/zulu-21/bin/java",
              },
              {
                name = "zulu-25",
                path = "/home/dokxid/.local/share/mise/installs/java/zulu-25/bin/java",
              },
            },
          },
        },
        format = {
          enabled = true,
          settings = { -- you can use your preferred format style
            url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
            profile = "GoogleStyle",
          },
        },
      },
    },
  },

  -- neovide support
  { import = "astrocommunity.recipes.neovide" },
}
