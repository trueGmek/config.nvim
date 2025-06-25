return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap');

      -- vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-dap',
        name = 'lldb'
      }

      dap.configurations.cpp = {
        {
          name = 'Launch',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }
    end
  }
}
