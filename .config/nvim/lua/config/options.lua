-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- add any additional options here
require("lazy").setup({
  spec = {
    { "folke/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "plugins" },
  },
})