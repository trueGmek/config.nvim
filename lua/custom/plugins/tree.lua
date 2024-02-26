-- File: lua/custom/plugins/tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      view = {
        width = 25,
      }
    }
  end,

  vim.keymap.set('n', '<C-t>', '<cmd>NvimTreeToggle<cr>')
}
