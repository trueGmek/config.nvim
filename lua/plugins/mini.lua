return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }

    local surround = require('mini.surround')
    surround.setup()

    local comment = require 'mini.comment'
    comment.setup({
      mappings = {
        comment = 'gc',
        comment_line = 'gcc',
        comment_visual = 'gc',
        textobject = 'gc',
      },
    })
  end
}
