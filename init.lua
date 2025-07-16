-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.opt.shiftwidth = 4
vim.o.ignorecase = true;

require("config.lazy")
require("config.lsp").setup()
require("config.unrealEngine").setup()
require("config.telescope").setup()
require("config.dap").setup()

-- TODO: MAYBE?
-- vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>')
-- vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function()
    vim.highlight.on_yank()
  end
})
