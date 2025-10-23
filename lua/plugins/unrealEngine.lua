return {
  "mbwilding/UnrealEngine.nvim",
  enabled = false,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>ug",
      desc = "UnrealEngine: Generate LSP",
      function()
        require("unrealengine.commands").generate_lsp()
      end,
    },
    {
      "<leader>ub",
      desc = "UnrealEngine: Build",
      function()
        require("unrealengine.commands").build()
      end,
    },
    {
      "<leader>ur",
      desc = "UnrealEngine: Rebuild",
      function()
        require("unrealengine.commands").rebuild()
      end,
    },
    {
      "<leader>uo",
      desc = "UnrealEngine: Open",
      function()
        require("unrealengine.commands").open()
      end,
    },
    {
      "<leader>uc",
      desc = "UnrealEngine: Clean",
      function()
        require("unrealengine.commands").clean()
      end,
    },
  },
  opts = {
    auto_generate = true, -- Auto generates LSP info when detected in CWD | default: false
    auto_build = false,   -- Auto builds on save | default: false
    engine_path = '/home/gmek/UnrealEngine'
  }
}
