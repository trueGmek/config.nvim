return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap');

      vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-dap',
        name = 'lldb'
      }
      dap.adapters.codelldb = {
        type = "executable",
        command = "/home/gmek/codelldb/extension/adapter/codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
        name = 'codelldb'
      }

      dap.configurations.cpp = {
        {
          name = "Launch Unreal Editor",
          type = "codelldb",
          request = "launch",
          program = "/home/gmek/UnrealEngine/Engine/Binaries/Linux/UnrealEditor",
          args = {
            "-project=\"$(pwd)/MyProject.uproject\"",
            "-game",
            "-progress",
            "-log"
          },
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          sourceLanguages = {"cpp"}
        },
        {
          name = 'Launch LLDB',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
        {
          name = "Attach to PID",
          type = "codelldb",
          request = "attach",
          pid = require('dap.utils').pick_process,
          stopOnEntry = false,
          runInTerminal = true,
        }
      }
    end
  }
}
