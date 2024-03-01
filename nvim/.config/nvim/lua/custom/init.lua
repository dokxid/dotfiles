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
			vim.cmd("quit")
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

-- case: neovide
if vim.g.neovide then
	-- vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<C-c>", '"+y') -- Copy
	vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_scroll_animation_length = 0.05
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.5
	vim.o.guifont = "JetBrainsMono Nerd Font:h11"
	vim.g.neovide_padding_top = 30
	vim.g.neovide_padding_bottom = 30
	vim.g.neovide_padding_right = 30
	vim.g.neovide_padding_left = 30
end

-- change vim cursor globally to vert25
-- vim.opt.guicursor = "n-v-i-c:vert25"
