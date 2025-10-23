return {
  {
    -- 'trueGmek/c-unity.nvim',
    dir = "~/Dev/c-unity.nvim",
    enabled = true,
    config = function()
      local plugin = require("c-unity")
      plugin.setup({ debug = false, unity = { path = "~/Unity/Hub/Editor/" } })

      vim.api.nvim_create_user_command('UOpen', plugin.editor.open_project, { desc = "Open Unity Project" })
      vim.api.nvim_create_user_command('ULog', plugin.window.toggle, { desc = "Toggle logs window" })
      vim.api.nvim_create_user_command('ULogs', plugin.window.toggle, { desc = "Toggle logs window" })
      vim.api.nvim_create_user_command('UClear', plugin.window.clear_buffer, { desc = 'Clear logs' })
      vim.api.nvim_create_user_command('UBuild', plugin.pipe.send_recomipile, { desc = "Send recompile command" })
      vim.api.nvim_create_user_command('UConnect', plugin.pipe.setup_connection, { desc = "Connect to Unity Server" })
      vim.api.nvim_create_user_command('UDisconnect', plugin.pipe.disconnect_from_unity,
        { desc = "Disconnect from Unity Server" })
    end
  }
}
