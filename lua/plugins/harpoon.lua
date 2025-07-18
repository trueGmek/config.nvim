return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

    config = function()
      local harpoon = require("harpoon")
      local TELESCOPE = true

      -- REQUIRED
      harpoon:setup({})
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = 'Add a file to harpoon list' })
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-j>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():next() end)

      vim.api.nvim_create_user_command('HClear', function() harpoon:list():clear() end,
        { desc = 'Clear Harpoon list' })

      -- basic telescope configuration
      if TELESCOPE then
        local conf = require("telescope.config").values

        local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
          { desc = "Open harpoon window" })
      end
    end
  }
}
