local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    -- "hyprlang",
  },
  indent = {
    enable = false,
    -- disable = {
    --   "python"
    -- },
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "tailwindcss-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python stuff
    "black",
    "isort",
    "pyright",
  },
  ui = {
    keymaps = {
      apply_language_filter = "<C-\\>",
    },
  },
}

return M
