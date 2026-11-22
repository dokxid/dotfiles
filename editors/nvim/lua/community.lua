-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- lsp
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
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

  -- utility
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },
}
