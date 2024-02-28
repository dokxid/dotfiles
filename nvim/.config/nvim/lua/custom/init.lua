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
  end
})

-- save fold, see https://stackoverflow.com/a/77180744
autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})
autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})

autocmd({"BufAdd"}, {
  pattern = {"*.*"},
  desc = "only execute nvim-ufo when opening a buffer instead of dashboard",
  command = ":Lazy load nvim-ufo"
})

-- change vim cursor globally to vert25
-- vim.opt.guicursor = "n-v-i-c:vert25"
