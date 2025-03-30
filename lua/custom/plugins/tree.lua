-- File: lua/custom/plugins/tree.lua

Log("tree.lua", "LOADING")
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
        adaptive_size = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          }
        }
      },
    }
  end,

  vim.keymap.set('n', '<C-t>', '<cmd>NvimTreeFindFileToggle!<cr>'),
  vim.keymap.set('n', '<leader>tft', '<cmd>NvimTreeFindFileToggle!<cr>', { desc = "[Tree] [F]ind file [Toggle]" }),
  vim.keymap.set('n', '<leader>tff', '<cmd>NvimTreeFindFile!<cr>', { desc = "[T]ree [F]ind [F]ile" }),
}
