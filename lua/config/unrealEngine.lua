local M = {}

M.setup = function()
  vim.api.nvim_create_user_command('UGenerate', function()
      -- if pcall(vim.cmd('wa')) then
      --   print("Saving failed")
      -- end
      require("unrealengine.commands").generate_lsp()
    end,
    { desc = 'Unreal Engine: Generate LSP' })

  vim.api.nvim_create_user_command('UBuild', function()
    -- if pcall(vim.cmd('wa')) then
    --   print("Saving failed")
    -- end
    require("unrealengine.commands").build()
  end, { desc = 'Unreal Engine: Build' })

  vim.api.nvim_create_user_command('URebuild', function()
      -- if pcall(vim.cmd('wa')) then
      --   print("Saving failed")
      -- end
      require("unrealengine.commands").rebuild()
    end,
    { desc = 'Unreal Engine: Rebuild' })

  vim.api.nvim_create_user_command('UOpen', require("unrealengine.commands").open, { desc = 'Unreal Engine: Open' })
  vim.api.nvim_create_user_command('UClean', require("unrealengine.commands").clean, { desc = 'Unreal Engine: Clean' })

  local builtin = require('telescope.builtin')
  local UEPath = '/home/gmek/UnrealEngine/Engine/'
  local search_dirs = { vim.fs.joinpath(UEPath, '/Source/'), vim.fs.joinpath(UEPath, '/Plugins/Runtime/SmartObjects/') };
  local file_ingore_patterns = { '%.svg', '%.uasset', '%.a', '%.cpp.o', '%.tps' }


  vim.keymap.set('n', '<leader>eue', function()
    builtin.find_files({
      cwd = UEPath,
      search_dirs = search_dirs,
      file_ignore_patterns = file_ingore_patterns,
    })
  end, { desc = 'Find Files in Unreal Engine' })

  local custom = require('config.telescope')
  vim.keymap.set('n', '<leader>gue', function()
    builtin.live_grep({
      cwd = UEPath,
      search_dirs = search_dirs,
      file_ignore_pattern = file_ingore_patterns,
    })
    -- custom.live_multigrep { cwd = vim.fs.joinpath(UEPath, '/Source/')}
  end, { desc = 'Telescope Unreal Engine' })
end

return M
