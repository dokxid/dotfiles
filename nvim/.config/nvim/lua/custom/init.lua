local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end,
})

-- save fold, see https://stackoverflow.com/a/77180744
autocmd({ "BufWinLeave" }, {
  pattern = { "*.*" },
  desc = "save view (folds), when closing file",
  command = "mkview",
})
autocmd({ "BufWinEnter" }, {
  pattern = { "*.*" },
  desc = "load view (folds), when opening file",
  command = "silent! loadview",
})

autocmd({ "BufAdd" }, {
  pattern = { "*.*" },
  desc = "only execute nvim-ufo when opening a buffer instead of dashboard",
  command = ":Lazy load nvim-ufo",
})

vim.o.breakindent = true
vim.o.showbreak = "󱞩 "
vim.o.number = true
vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.o.wrap = true
vim.o.linebreak = true
-- vim.o.timeoutlen = 5000

-- neovide settings
if vim.g.neovide then
  -- KEYBINDS
  vim.keymap.set("v", "<C-c>", '"+y') -- Copy
  vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
  -- vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save

  -- SCALING
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
  vim.keymap.set("n", "<D-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<D-->", function()
    change_scale_factor(1 / 1.25)
  end)

  -- LAYOUT
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  vim.g.neovide_padding_top = 30
  vim.g.neovide_padding_bottom = 30
  vim.g.neovide_padding_right = 30
  vim.g.neovide_padding_left = 30

  -- BEHAVIOUR
  vim.g.neovide_fullscreen = false
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_scroll_animation_length = 0.05

  -- ANIMATIONS
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.5
end

-- change vim cursor globally to vert25
-- vim.opt.guicursor = "n-v-i-c:vert25"
