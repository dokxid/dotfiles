-- some recommended exclusions. you can use `:lua print(vim.bo.filetype)` to
-- get the filetype string of the current buffer
local excluded_filetypes = {
  -- this one is especially useful if you use neovim as a commit message editor
  "gitcommit",
  "hyprlang",
}

local excluded_filenames = {
  "do-not-autosave-me.lua",
}

local function save_condition(buf)
  local fn = vim.fn
  local utils = require "auto-save.utils.data"
  if
    vim.tbl_contains(excluded_filetypes, vim.fn.getbufvar(buf, "&filetype"))
    or vim.tbl_contains(excluded_filenames, vim.fn.expand "%:t")
  then
    if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then return true end
  end
  return false
end

-- in your config table
return {
  "okuuva/auto-save.nvim",
  enabled = true,
  opts = {
    condition = save_condition,
  },
}
