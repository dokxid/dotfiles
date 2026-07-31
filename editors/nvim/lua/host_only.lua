-- see https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack

return {

  -- script / config languages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.sql" },
  -- { import = "astrocommunity.pack.python" },

  -- web languages
  -- { import = "astrocommunity.pack.html-css" },
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.eslint" },

  -- compiled languages
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.rust" },

  -- jvm languages
  -- { import = "astrocommunity.pack.java" },
  -- { import = "astrocommunity.pack.kotlin" },
  {
    "mfussenegger/nvim-jdtls",
    enabled = false,
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
  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type for details
      }

      vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

      -- Recommended/example keymaps
      vim.keymap.set(
        { "n", "x" },
        "<leader>oa",
        function() require("opencode").ask "@this: " end,
        { desc = "Ask OpenCode…" }
      )
      vim.keymap.set(
        { "n", "x" },
        "<leader>os",
        function() require("opencode").select() end,
        { desc = "Select OpenCode…" }
      )

      vim.keymap.set(
        { "n", "x" },
        "go",
        function() return require("opencode").operator "@this " end,
        { desc = "Append range to OpenCode", expr = true }
      )
      vim.keymap.set(
        "n",
        "goo",
        function() return require("opencode").operator "@this " .. "_" end,
        { desc = "Append line to OpenCode", expr = true }
      )

      vim.keymap.set(
        "n",
        "<S-C-u>",
        function() require("opencode").command "session.half.page.up" end,
        { desc = "Scroll OpenCode up" }
      )
      vim.keymap.set(
        "n",
        "<S-C-d>",
        function() require("opencode").command "session.half.page.down" end,
        { desc = "Scroll OpenCode down" }
      )
    end,
  },

  -- neovide support
  -- { import = "astrocommunity.recipes.neovide" },
}
