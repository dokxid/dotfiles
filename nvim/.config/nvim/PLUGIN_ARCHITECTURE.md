# NeoVim Plugin Architecture

## Overview

This is an AstroNvim v5-based configuration with a modular plugin system. Plugins are loaded via Lazy.nvim with specs imported from three sources:
1. **AstroNvim core** — Base framework and essential plugins
2. **AstroCommunity** — Curated plugin packs for language support, features, and recipes
3. **Custom plugins** (`lua/plugins/`) — User-specific configurations and overrides

## Directory Structure

```
~/.config/nvim/
├── init.lua                 # Entry point, bootstraps Lazy.nvim
├── lazy-lock.json          # Plugin version lock file
├── lua/
│   ├── lazy_setup.lua      # Lazy.nvim initialization & spec imports
│   ├── polish.lua          # Post-load customizations
│   ├── community.lua       # AstroCommunity pack imports
│   └── plugins/            # Custom plugin configurations (30+ files)
├── overseer/               # Task runner templates
├── snippets/               # Custom snippets
└── [config files]          # .luarc.json, .neoconf.json, etc.
```

## Plugin Loading Order

1. **init.lua** — Bootstraps Lazy.nvim, sets shell to fish, configures Neovide
2. **lazy_setup.lua** calls `lazy.setup()` with specs in this order:
   - `AstroNvim/AstroNvim` (v5) — Core framework
   - `community.lua` — Language packs and recipes
   - `plugins/` — Custom overrides and user plugins
3. **polish.lua** — Runs last for any post-load customizations

## Core Architecture Components

### 1. AstroNvim Framework (`AstroNvim/AstroNvim`)

**Version:** ^5 (stable)

**Provides:**
- Base plugin specs (LSP, completion, UI, git, etc.)
- Core modules: `astrocore`, `astroui`, `astrolsp`
- Resession (session management) with extensions support
- Key mappings framework (`which-key` integration)
- Default statusline via heirline

**Key Files in Your Config:**
- `lua/plugins/astrocore.lua` — Core settings, keymaps, options
- `lua/plugins/astroui.lua` — Theme, icons, UI tweaks
- `lua/plugins/astrolsp.lua` — LSP configuration

---

### 2. AstroCommunity Packs (`AstroNvim/astrocommunity`)

Community-curated plugin collections. Imported in `lua/community.lua`.

#### Language Support Packs
| Pack | Purpose | Plugins Included |
|------|---------|------------------|
| `lua` | Lua development | formatter, linter, LSP |
| `html-css` | Web development | HTML, CSS, SCSS support |
| `typescript` | TypeScript/JavaScript | ESLint, prettier, LSP |
| `zig` | Zig language | Zig LSP, compiler integration |
| `vue` | Vue.js support | Vue LSP, formatter |

#### Feature & Recipe Packs
| Pack | Purpose |
|------|---------|
| `neovide` | Neovide GUI optimizations |
| `vscode` | VSCode keybindings & features |
| `picker-lsp-mappings` | LSP picker integration |
| `trouble-nvim` | Diagnostics list integration |
| `tiny-inline-diagnostic-nvim` | Inline diagnostics |
| `dropbar-nvim` | Breadcrumb navigation |
| `diffview-nvim` | Git diff viewer |
| `nvim-surround` | Surrounds editing (motion) |
| `nvim-spider` | Smart word motions |
| `conform-nvim` | Code formatting |
| `vim-move` | Block movement |
| `auto-save-nvim` | Auto-save functionality |
| `nvim-neoclip-lua` | Register/clipboard manager |
| `snacks-indent-hlchunk` | Indent guide highlighting |
| `grug-far-nvim` | Find & replace |
| `nvim-toggler` | Toggle booleans, comments |
| `flash-nvim` | Enhanced motion/search |
| `obsidian-nvim` | Obsidian vault integration |
| `compiler-nvim` | Code compilation runner |
| `flatten-nvim` | Terminal integration |
| `suda-vim` | Sudo write support |
| `lazydocker` | Docker management |

---

### 3. Custom Plugin Overrides & Additions

Located in `lua/plugins/`, these 30+ files override or extend AstroNvim defaults and add custom plugins.

#### Core Configuration Files
| File | Purpose | Key Settings |
|------|---------|--------------|
| **astrocore.lua** | Core options, keymaps, autocmds | Leader/localleader keys, buffer mappings, root directory detection |
| **astroui.lua** | Theme, icons, UI customization | Colorscheme (catppuccin mocha), LSP loading spinner, highlights |
| **astrolsp.lua** | LSP server configuration | Language servers setup, formatting servers |
| **astrocore_sessions.lua** | Session autosave config | Last session & CWD session autosave |
| **astrocore_rooter.lua** | Project root detection | Root directory patterns |

#### Session Management
| File | Purpose | Function |
|------|---------|----------|
| **resession.lua** | Session persistence | Auto-save/load sessions by CWD, pick-resession UI, tabline state preservation via astrocore extension |

#### Editor Features
| File | Plugin | Purpose |
|------|--------|---------|
| **blink.lua** | `saghen/blink.cmp` | Completion engine (Blink.cmp, not nvim-cmp) |
| **completion.lua** | Completion config | Completion behavior settings |
| **conform.lua** | `stevearc/conform.nvim` | Code formatter integration |
| **none-ls.lua** | `nvimtools/none-ls.nvim` | Linting, formatting fallback |
| **lsp_signature.lua** | `ray-x/lsp_signature.nvim` | LSP signature help popup |
| **comment.lua** | `numToStr/Comment.nvim` | Toggle line/block comments |
| **treesitter.lua** | `nvim-treesitter/nvim-treesitter` | Syntax highlighting & tree parsing |

#### UI & Navigation
| File | Plugin | Purpose |
|------|--------|---------|
| **heirline.lua** | `rebelot/heirline.nvim` | Statusline components (mode, git, diagnostics, LSP, nav) |
| **neo-tree.lua** | `nvim-neo-tree/neo-tree.nvim` | File explorer sidebar |
| **whichkey.lua** | `folke/which-key.nvim` | Keymap menu & documentation |
| **snacks.lua** | `folke/snacks.nvim` | Dashboard, picker integration |
| **trouble.lua** | `folke/trouble.nvim` | Diagnostics list panel |

#### Tools & Integrations
| File | Plugin | Purpose |
|------|--------|---------|
| **dap.lua** | `mfussenegger/nvim-dap` | Debugger adapter protocol |
| **overseer.lua** | `stevearc/overseer.nvim` | Task runner / build system |
| **mason.lua** | `williamboman/mason.nvim` | LSP/formatter/linter installer |
| **yazi.lua** | `mikavilpnen/yazi.nvim` | Yazi file manager integration |
| **auto-save.lua** | `okuuva/auto-save.nvim` | Auto-save on idle/focus loss |

#### AI & Advanced Features
| File | Plugin | Purpose |
|------|--------|---------|
| **avante.lua** | `yetone/avante.nvim` | AI code assistant (Claude/GPT) |
| **copilot.lua** | `zbirenbaum/copilot.lua` | GitHub Copilot integration |
| **opencode.lua** | `anomalyco/opencode` | OpenCode CLI integration |

#### Environment-Specific
| File | Purpose | Notes |
|------|---------|-------|
| **non-neovide-plugins.lua** | Conditionally disable plugins in Neovide | Optimizes performance in GUI mode |
| **user.lua** | Miscellaneous user plugins | Catch-all for one-off plugins |

---

## Key Plugin Interactions & Dependencies

### Session Management (Resession)
- **Main plugin:** `stevearc/resession.nvim`
- **UI plugin:** `scottmckendry/pick-resession.nvim`
- **Extensions:**
  - `astrocore` extension (from `AstroNvim/astrocore`) — Handles tab-scoped buffer lists & alternate buffer tracking
  - Aerial extension (available but not enabled)
  - Overseer extension (available but not enabled)
- **Configuration:** 
  - `buf_filter` — Filters which buffers are restorable via `astrocore.buffer.is_restorable()`
  - `tab_buf_filter` — Preserves per-tab buffer lists
  - `extensions = { astrocore = { enable_in_tab = true } }` — Enables tabline state persistence
  - Auto-save every 15 seconds
  - Auto-load on startup when no args provided
- **How it works:** Resession saves/restores buffer layout, workspace state, and cursor position. The `astrocore` extension preserves heirline tabline buffer lists (`vim.t[tabpage].bufs`), so your open buffers display correctly after session restore.

### Statusline (Heirline)
- **Plugin:** `rebelot/heirline.nvim` (configured via AstroNvim)
- **Config file:** `lua/plugins/heirline.lua`
- **Components:**
  - Left: mode, git_branch, git_diff, file_info, diagnostics
  - Center: cmd_info (flanked by fill)
  - Right: lsp, treesitter, nav, mode (right separator)
- **Tabline:** Inherited from AstroNvim defaults (not customized), displays per-tab buffer lists stored in `vim.t[tabpage].bufs`
- **Integration:** Works with resession's `astrocore` extension to restore buffer lists on session load

### Completion Pipeline
- **Engine:** `saghen/blink.cmp` (Blink.cmp)
- **Config:** `lua/plugins/blink.lua`, `lua/plugins/completion.lua`
- **Sources:** LSP, snippets, buffer words
- **Alternative:** `nvim-cmp` is replaced with Blink.cmp (newer, faster)

### LSP Setup
- **Base config:** `lua/plugins/astrolsp.lua` (AstroNvim framework)
- **Installer:** `williamboman/mason.nvim` → Auto-installs LSP servers, formatters, linters
- **Signature help:** `ray-x/lsp_signature.nvim` → Float popup for function signatures
- **Formatting:** Blink.cmp + `stevearc/conform.nvim` + `nvimtools/none-ls.nvim` fallback
- **Diagnostics:** Inline via `folke/trouble.nvim` + `tiny-inline-diagnostic-nvim` community pack

### File Navigation
- **Explorer:** `nvim-neo-tree/neo-tree.nvim` (sidebar)
- **Alternative file manager:** `mikavilpnen/yazi.nvim` (terminal-based)
- **Root detection:** `astrocore_rooter.lua` → Pattern-based project root discovery

### Git Integration
- **Diff viewer:** `sindrets/diffview.nvim` (via astrocommunity)
- **Git branch/diff in statusline:** heirline components
- **No separate git plugin** — Relies on AstroNvim's git integration

### Code Formatting & Linting
- **Primary formatter:** `stevearc/conform.nvim`
- **Fallback:** `nvimtools/none-ls.nvim` (null-ls successor)
- **Plugins configured:** Lua, TypeScript, HTML/CSS, Zig, Vue

### AI & Coding Assistance
- **Avante (Claude/GPT):** `lua/plugins/avante.lua`
- **Copilot:** `lua/plugins/copilot.lua`
- **OpenCode CLI:** `lua/plugins/opencode.lua` → Integrates with OpenCode terminal commands
- **No CodeCompanion** — Community pack available but not imported

### Terminal & Build System
- **Terminal integration:** `flatten-nvim` (transparent terminal passthrough)
- **Task runner:** `stevearc/overseer.nvim` → Compile Zig, run scripts
- **Task templates:** `lua/overseer/template/vscode/provider/` (Zig, GDScript)

---

## Plugin Configuration Patterns

### Pattern 1: Using AstroNvim's `opts` Function
Override plugin defaults while preserving framework features:
```lua
return {
  "plugin/name",
  opts = function(_, opts)
    opts.some_setting = value
    return opts
  end,
}
```
Example: `heirline.lua`, `astroui.lua`

### Pattern 2: Custom `config` Function with Full Control
Full custom configuration while still managing dependencies:
```lua
return {
  "plugin/name",
  config = function()
    local plugin = require("plugin")
    plugin.setup { ... }
  end,
}
```
Example: `resession.lua` (properly includes all necessary filters and extensions)

### Pattern 3: Conditional Plugin Loading
Load plugins only in specific environments:
```lua
return {
  "plugin/name",
  cond = function() return not vim.g.neovide end,
}
```
Example: `non-neovide-plugins.lua`

---

## Critical Configuration Notes

### Resession Configuration ✅ (FIXED)
- **Location:** `lua/plugins/resession.lua:29-38`
- **Status:** Properly configured with all necessary components
- **Includes:**
  - `buf_filter` — Uses `astrocore.buffer.is_restorable()` for session-worthy buffers
  - `tab_buf_filter` — Preserves per-tab buffer lists from `vim.t[tabpage].bufs`
  - `extensions = { astrocore = { enable_in_tab = true } }` — Enables tabline state persistence
- **Result:** After session restore, buffers correctly display in the tabline

### None-ls (null-ls Successor)
- **Location:** `lua/plugins/none-ls.lua`
- **Note:** `none-ls.nvim` is the maintained successor to `null-ls` (archived)
- **Used for:** Fallback formatting, linting not covered by LSP

### Virtual Env Component Commented Out
- **Location:** `lua/plugins/heirline.lua:20`
- **Note:** Python virtual environment display is disabled in statusline
- **Reason:** Likely performance or preference

---

## Plugin Specs Reference

### How to Add a New Plugin

1. **Create a new file** in `lua/plugins/myfeature.lua`
2. **Return a LazySpec table:**
   ```lua
   return {
     "author/plugin-name",
     event = "VeryLazy",  -- or "BufReadPre", etc.
     opts = { ... },      -- or config = function() ... end
     dependencies = { ... },  -- other plugins required
     keys = { ... },      -- keymaps
   }
   ```
3. **No need to register** — Lazy.nvim auto-imports from `lua/plugins/` via the spec in `lazy_setup.lua`

### How to Override a Community Plugin

Community plugins can be overridden by creating a file with the same name in `lua/plugins/`:
```lua
-- In lua/plugins/trouble.lua
return {
  "folke/trouble.nvim",
  opts = function(_, opts)
    opts.my_custom_option = true
    return opts
  end,
}
```

### How to Disable a Community Plugin

Add a `enabled = false` condition:
```lua
return {
  "folke/plugin.nvim",
  enabled = false,
}
```

---

## Performance Optimizations

1. **Disabled RTP plugins** (in `lazy_setup.lua`):
   - `gzip`, `netrwPlugin`, `tarPlugin`, `tohtml`, `zipPlugin`
   - These are rarely-used built-in plugins that slow startup

2. **Neovide-specific disables** (`non-neovide-plugins.lua`):
   - Some plugins are disabled when running in Neovide GUI for better performance

3. **Lazy loading**:
   - Most plugins use event-based or command-based lazy loading
   - Only essential plugins are loaded at startup

---

## Init.lua Configuration Highlights

### Neovide GUI Setup
- **Clipboard passthrough:** Ctrl-C/Cmd-C for copy, Ctrl-V/Cmd-V for paste
- **Animations:** Cursor trails, position/scroll animations enabled
- **Font:** JetBrainsMono Nerd Font 12pt, line spacing 11
- **Theme:** Auto-detect (light/dark)

### Global Keybindings
- `Ctrl-S` / `Cmd-S` → Save file
- `Escape Escape` (terminal) → Exit terminal mode
- `PageUp` → `Ctrl-U` (scroll up)
- `PageDown` → `Ctrl-D` (scroll down)
- Clipboard keybindings for cross-platform paste

### Shell Configuration
- **Default shell:** Fish shell (configured in `init.lua`)

---

## Summary Table: Plugin Categories

| Category | Key Plugins | Files |
|----------|------------|-------|
| **Framework** | AstroNvim v5 | `lazy_setup.lua` |
| **Completion** | Blink.cmp | `blink.lua`, `completion.lua` |
| **LSP & Formatting** | Mason, conform, none-ls | `astrolsp.lua`, `mason.lua`, `conform.lua`, `none-ls.lua` |
| **UI & Navigation** | Heirline, neo-tree, snacks | `heirline.lua`, `neo-tree.lua`, `snacks.lua` |
| **Sessions** | Resession, pick-resession | `resession.lua` ✅ |
| **Git** | Diffview | `community.lua` |
| **Tools** | Overseer, DAP, Yazi | `overseer.lua`, `dap.lua`, `yazi.lua` |
| **AI** | Avante, Copilot, OpenCode | `avante.lua`, `copilot.lua`, `opencode.lua` |
| **Editing** | Surround, Comment, Flash | `community.lua` |
| **Diagnostics** | Trouble, tiny-inline-diagnostic | `trouble.lua`, `community.lua` |

---

## Next Steps / Maintenance

1. **Monitor plugin updates** via `:Lazy update` (respects pinned versions)
2. **Review none-ls configuration** if linting/formatting isn't working as expected
3. **Consider enabling disabled AstroCommunity packs** as needed:
   - `ts-error-translator-nvim` for better TypeScript errors
   - `codecompanion-nvim` for local AI alternatives
   - `render-markdown-nvim` for markdown previews
4. **Deduplicate pick-resession specs** if you notice duplicate configs in `user.lua`
