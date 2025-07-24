local M = {}

M.setup = function()
  local builtin = require('telescope.builtin')
  vim.keymap.set({ 'n', 'v' }, "<leader>ff", function() vim.lsp.buf.format() end)
  vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename)
  vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action)
  vim.keymap.set('n', '<leader>gr', builtin.lsp_references)
  vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions)
  vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations)

  vim.keymap.set('n', 'K',
    function() vim.lsp.buf.hover { border = "single", max_height = 25, max_width = 120 } end,
    { desc = "Show hover custom" })

  vim.diagnostic.config({
    -- virtual_lines = true,
    virtual_text = {
      prefix = '●', -- Could be '■', '▶', etc.
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })
end

return M
