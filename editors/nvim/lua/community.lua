-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
-- -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- recipes
  { import = "astrocommunity.recipes.picker-lsp-mappings" },

  -- diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- theme
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },

  -- motion
  { import = "astrocommunity.motion.mini-surround" },

  -- editing-support
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },
  { import = "astrocommunity.utility.nvim-toggler" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },

  -- scrolling
  { import = "astrocommunity.scrolling.nvim-scrollbar" },

  -- utility
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.utility.noice-nvim" },
  -- { import = "astrocommunity.recipes.picker-nvchad-theme" },
  -- { import = "astrocommunity.utility.hover-nvim" },

  -- docker
  { import = "astrocommunity.docker.lazydocker" },

  -- python
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.black" },
  { import = "astrocommunity.pack.python.isort" },
  -- { import = "astrocommunity.pack.typescript" },
}
