-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
-- -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  -- language support
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.zig" },

  -- recipes
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  -- { import = "astrocommunity.recipes.picker-nvchad-theme" },

  -- diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },

  -- theme
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },

  -- git
  { import = "astrocommunity.git.diffview-nvim" },

  -- completion
  { import = "astrocommunity.completion.nvim-cmp" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.ai.opencode-nvim" },

  -- motion
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.nvim-spider" },

  -- editing-support
  -- { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
  -- { import = "astrocommunity.editing-support.codecompanion-nvim" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.utility.nvim-toggler" },

  -- motion
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.flash-nvim" },

  -- scrolling
  -- { import = "astrocommunity.scrolling.satellite-nvim" },

  -- note-taking
  -- { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },

  -- code-runner
  { import = "astrocommunity.code-runner.compiler-nvim" },

  -- utility
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  -- { import = "astrocommunity.editing-support.true-zen-nvim" },
  -- { import = "astrocommunity.utility.hover-nvim" },
  -- { import = "astrocommunity.utility.noice-nvim" },

  -- docker
  { import = "astrocommunity.docker.lazydocker" },
}
