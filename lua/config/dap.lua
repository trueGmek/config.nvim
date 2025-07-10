local M = {};

M.setup = function()
  local dap = require('dap');
  vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" });
  vim.keymap.set('n', '<F7>', dap.step_into, { desc = "Debug Step Into" });
  vim.keymap.set('n', '<F8>', dap.step_over, { desc = "Debug Step Over" });
  vim.keymap.set('n', '<F9>', dap.continue, { desc = "Debug Continue" });

  dap.set_log_level('DEBUG')
end

return M;
