local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values

local M = {}

M.live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      ---@diagnostic disable-next-line: deprecated
      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

M.setup = function()
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope search files' })
  vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })
  vim.keymap.set("n", "<leader>sg", M.live_multigrep, { desc = 'Telescope live grep' })

  vim.keymap.set('n', '<leader>erc', function()
    builtin.find_files({ cwd = vim.fn.stdpath('config') })
  end, { desc = 'Telescope search files' })

  vim.keymap.set('n', '<leader>ep', function()
    builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy') }
  end, { desc = 'Telescope search files' })
end

return M
