return {
  "zhisme/copy_with_context.nvim",
  -- enabled = false,
  config = function()
    require("copy_with_context").setup {
      -- Customize mappings
      mappings = {
        relative = "<leader>ay",
        absolute = "<leader>aY",
        remote = "<leader>ar",
      },
      formats = {
        default = "# {filepath}:{line}", -- Used by relative and absolute mappings
        remote = "# {remote_url}",
      },
      -- whether to trim lines or not
      trim_lines = false,
    }
  end,
}
