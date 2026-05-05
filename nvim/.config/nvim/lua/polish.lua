-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
-- require("lspconfig").glsl_analyzer.setup {}

-- fix toggle constants
local APPLY_RESTRICT_TREESITTER = false

-- based on https://github.com/stevearc/aerial.nvim/issues/408#issuecomment-2336852084 after breaking, still need to figure out what triggered this
local function restrict_treesitter()
  local has_aer, aer = pcall(require, "aerial")
  if not has_aer then return end
  aer.setup {
    backends = { "lsp", "asciidoc", "man" },
  }
end

if APPLY_RESTRICT_TREESITTER then restrict_treesitter() end

vim.api.nvim_create_user_command("LspLogClear", function()
  local lsplogpath = vim.fn.stdpath "state" .. "/lsp.log"
  print(lsplogpath)
  if io.close(io.open(lsplogpath, "w+b")) == false then vim.notify("Clearing LSP Log failed.", vim.log.levels.WARN) end
end, { nargs = 0 })

-- neovide config
if vim.g.neovide or vim.v.servername then
  local enableClipboard = true
  local animationConfig = true
  local fontConfig = true
  local themeConfig = true
  -- this will enable the clipboard passthrough
  if enableClipboard then
    -- copy
    vim.keymap.set("v", "<C-c>", '"+y')
    vim.keymap.set("v", "<D-c>", '"+y')
    -- paste normal mode
    vim.keymap.set("n", "<C-v>", '"+P')
    vim.keymap.set("n", "<D-v>", '"+P')
    -- paste visual mode
    vim.keymap.set("v", "<C-v>", '"+P')
    vim.keymap.set("v", "<D-v>", '"+P')
    -- paste command mode
    vim.keymap.set("c", "<C-v>", "<C-R>+")
    vim.keymap.set("c", "<D-v>", "<C-R>+")
    -- paste command mode
    vim.keymap.set("t", "<C-v>", '<ESC>l"+Pli')
    vim.keymap.set("t", "<D-v>", '<ESC>l"+Pli')
    -- paste insert mode
    vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli')
    vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli')
  end
  if animationConfig then
    vim.g.neovide_position_animation_length = 0.1
    vim.g.neovide_cursor_animation_length = 0.1
    vim.g.neovide_cursor_trail_size = 0.1
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = true
    vim.g.neovide_scroll_animation_far_lines = 20
    vim.g.neovide_scroll_animation_length = 0.1
  end
  if fontConfig then
    vim.o.guifont = "JetBrainsMono_Nerd_font:h12"
  end
  if themeConfig then vim.g.neovide_theme = "auto" end
  vim.g.neovide_input_macos_option_key_is_meta = "only_left" -- use left option as meta
end

-- Allow clipboard copy paste in neovim
-- non macos with ctrl
vim.api.nvim_set_keymap("", "<C-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<C-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-v>", "<C-R>+", { noremap = true, silent = true })
-- macos with meta
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.opt.linespace = 11

-- bind macros to a less common key bc im too dumb rn
-- vim.api.nvim_set_keymap("n", "q", "", { nowait = true })

-- easier escape from terminal mode
-- vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true })

-- bindings for saving files with ctrl-s or cmd-s
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<D-s>", ":w<CR>")

-- bind page up and page down to ctrl-u and ctrl-d
vim.api.nvim_set_keymap("n", "<PageUp>", "<C-u>", { noremap = false })
vim.api.nvim_set_keymap("n", "<PageDown>", "<C-d>", { noremap = false })

vim.api.nvim_set_keymap("n", "<M-v>", "<C-v>", { noremap = true })
