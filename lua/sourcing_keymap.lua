local M = {}

local sourceFile = function()
  -- <cmd>source %<CR>
  local filetype = vim.bo.filetype
  if filetype == 'lua' then
    vim.cmd.source();
  elseif filetype == 'javascript' then
    print("TODO: PARSE THE CONTENT TO NODE")
  else
    print(filetype .. "is not supported")
  end
end

local sourceLine = function()
  -- <cmd>source %<CR>
  local filetype = vim.bo.filetype
  if filetype == 'lua' then
    vim.cmd.source();
  elseif filetype == 'javascript' then
    print("TODO: PARSE THE CONTENT TO NODE")
  else
    print(filetype .. "is not supported")
  end
end


local sourceSelection = function()
  -- <cmd>source %<CR>
  local filetype = vim.bo.filetype
  if filetype == 'lua' then
    vim.cmd.source();
  elseif filetype == 'javascript' then
    print("TODO: PARSE THE CONTENT TO NODE")
  else
    print(filetype .. "is not supported")
  end
end

function M:SetUp()
  print "TODO: FINISH SOURCING KEYMAPS"

  vim.keymap.set('n', '<leader><leader>x', sourceFile, { desc = 'E[x]ecute current file' })
  vim.keymap.set('n', '<leader>x', ":.lua<CR>", { desc = "E[x]ecute current line" })
  vim.keymap.set('v', '<leader>x', ":lua<CR>", { desc = "E[x]ecute selected lines" })
end

return M;
