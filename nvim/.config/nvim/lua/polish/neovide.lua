function IS_MACOS() return vim.fn.has "macunix" == 1 end

-- constants
local enableClipboard = true
local animationConfig = true
local fontConfig = true
local themeConfig = true
local transparencyConfig = true

vim.g.neovide_input_macos_option_key_is_meta = "only_left"

if enableClipboard then
  local function save() vim.cmd.write() end
  local function copy() vim.cmd [[normal! "+y]] end
  local function paste() vim.api.nvim_paste(vim.fn.getreg "+", true, -1) end
  vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
  vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
  vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })
  vim.keymap.set({ "n", "i", "v" }, "<C-s>", save, { desc = "Save" })
  vim.keymap.set("v", "<C-c>", copy, { silent = true, desc = "Copy" })
  vim.keymap.set({ "n", "i", "v", "c", "t" }, "<C-v>", paste, { silent = true, desc = "Paste" })
end

if animationConfig then
  vim.g.neovide_position_animation_length = 0.1
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_scroll_animation_far_lines = 20
  vim.g.neovide_scroll_animation_length = 0.1
end

if fontConfig then
  vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h12" }
  vim.opt.linespace = 20
end

if themeConfig then vim.g.neovide_theme = "auto" end

if transparencyConfig then
  vim.g.neovide_opacity = IS_MACOS() and 1.0 or 0.7
  vim.g.neovide_normal_opacity = 1
  vim.g.neovide_floating_blur_amount_x = 4.0
  vim.g.neovide_floating_blur_amount_y = 4.0
end
