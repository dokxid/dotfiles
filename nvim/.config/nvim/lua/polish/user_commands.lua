vim.api.nvim_create_user_command("LspLogClear", function()
  local lsplogpath = vim.fn.stdpath "state" .. "/lsp.log"
  print(lsplogpath)
  if io.close(io.open(lsplogpath, "w+b")) == false then vim.notify("Clearing LSP Log failed.", vim.log.levels.WARN) end
end, { nargs = 0 })
