-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  -- language support
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },

  -- recipes
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.recipes.picker-nvchad-theme" },

  -- diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },

  -- theme
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- git
  { import = "astrocommunity.git.diffview-nvim" },

  -- completion
  { import = "astrocommunity.completion.nvim-cmp" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- motion
  { import = "astrocommunity.motion.nvim-surround" },

  -- editing-support
  { import = "astrocommunity.editing-support.codecompanion-nvim" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },

  -- motion
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.flash-nvim" },

  -- scrolling
  -- { import = "astrocommunity.scrolling.satellite-nvim" },

  -- note-taking
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },

  -- code-runner
  { import = "astrocommunity.code-runner.overseer-nvim" },

  -- utility
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  -- { import = "astrocommunity.editing-support.true-zen-nvim" },
  -- { import = "astrocommunity.utility.hover-nvim" },
  -- { import = "astrocommunity.utility.noice-nvim" },
}
