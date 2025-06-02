local M = {}

M.setup = function()
  local builtin = require('telescope.builtin')
  vim.keymap.set({ 'n', 'v' }, "<leader>ff", function() vim.lsp.buf.format() end)
  vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
  vim.keymap.set('n', '<leader>gr', builtin.lsp_references)
  vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions)
  vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations)
end

return M
