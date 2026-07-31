-- Prepend mise shims to PATH
-- https://mise.jdx.dev/ide-integration.html#neovim
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- https://mise.jdx.dev/mise-cookbook/neovim.html
return {
  "jmbuhr/otter.nvim",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      init = function()
        require("vim.treesitter.query").add_predicate("is-mise?", function(_, _, bufnr, _)
          local filepath = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
          local filename = vim.fn.fnamemodify(filepath, ":t")
          return string.match(filename, ".*mise.*%.toml$") ~= nil
        end, { force = true, all = false })
      end,
    },
  },
  config = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "toml" },
      group = vim.api.nvim_create_augroup("EmbedToml", {}),
      callback = function() require("otter").activate() end,
    })
  end,
}
