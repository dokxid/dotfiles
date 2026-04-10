-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
-- require("lspconfig").glsl_analyzer.setup {}

-- based on https://github.com/stevearc/aerial.nvim/issues/408#issuecomment-2336852084 after breaking, still need to figure out what triggered this
local has_aer, aer = pcall(require, "aerial")
if not has_aer then return end

aer.setup {
  backends = { "lsp", "markdown", "asciidoc", "man" },
}
