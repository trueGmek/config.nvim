return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        }
      }

      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope search files' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })

      vim.keymap.set('n', '<leader>erc', function()
        builtin.find_files({ cwd = vim.fn.stdpath('config') })
      end, { desc = 'Telescope search files' })
    end
  }
}
