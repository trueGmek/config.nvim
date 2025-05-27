local M = {}

M.setup = function()
  vim.api.nvim_create_user_command('UGenerate', require("unrealengine.commands").generate_lsp,
    { desc = 'Unreal Engine: Generate LSP' })
  vim.api.nvim_create_user_command('UBuild', require("unrealengine.commands").build, { desc = 'Unreal Engine: Build' })
  vim.api.nvim_create_user_command('URebuild', require("unrealengine.commands").rebuild,
    { desc = 'Unreal Engine: Rebuild' })
  vim.api.nvim_create_user_command('UOpen', require("unrealengine.commands").open, { desc = 'Unreal Engine: Open' })
  vim.api.nvim_create_user_command('UClean', require("unrealengine.commands").clean, { desc = 'Unreal Engine: Clean' })

  local builtin = require('telescope.builtin')
  local UEPath = '/home/gmek/UnrealEngine/Engine/Source/'
  vim.keymap.set('n', '<leader>eue', function()
    builtin.find_files({ cwd = UEPath })
  end, { desc = 'Telescope Unreal Engine' })

  local custom = require('config.telescope')
  vim.keymap.set('n', '<leader>gue', function()
    custom.live_multigrep { cwd = UEPath }
  end, { desc = 'Telescope Unreal Engine' })
end

return M
