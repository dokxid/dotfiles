local options = {
  window = {
    width = 92,
    height = 1,
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      cursorline = false, -- disable cursorline
      cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      list = false, -- disable whitespace characters
    },
  },
  plugins = {
    options = {
      laststatus = 1,
    },
    gitsigns = { enabled = false },
  },
}

require("zen-mode").setup(options)
