vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require 'keymaps'
require 'options'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { 'onenord' } },
  checker = { enabled = false },
})
