-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
-- vim.opt.shell = "/usr/bin/fish"
vim.opt.scrolloff = 10

-- neovide config
if vim.g.neovide then
  local enableClipboard = true
  local animationConfig = true
  local fontConfig = true
  local themeConfig = true
  -- this will enable the clipboard passthrough
  if enableClipboard then
    -- non macos with ctrl
    vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
    vim.keymap.set("v", "<C-c>", '"+y') -- Copy
    vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
    vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
    vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
    vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
    -- macos with meta
    vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
    vim.keymap.set("v", "<D-c>", '"+y') -- Copy
    vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
    vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
    vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
    vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
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
    vim.opt.linespace = 9
    vim.o.guifont = "JetBrainsMono_Nerd_font:h13"
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

-- bind macros to a less common key bc im too dumb rn
vim.api.nvim_set_keymap("n", "q", "", { nowait = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
