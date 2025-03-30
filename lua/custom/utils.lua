function Log(message, tag)
  print('[' .. vim.fn.strftime("%X") .. ']' .. '[' .. tag .. ']: ' .. message)
end
