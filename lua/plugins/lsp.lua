local M = {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    { 'saghen/blink.cmp' }
  },
  config = function()
    local config = require("lspconfig")
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    config.lua_ls.setup { capabilities = capabilities }
    config.basedpyright.setup { capabilities = capabilities }
    config.clangd.setup {
      capabilities = capabilities,
      root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".clangd", "build.ninja", ".git"),
      cmd = {
        "clangd",
        "--clang-tidy",
        "--enable-config",
        "--completion-style=detailed",
        "--header-insertion=never",
        "--all-scopes-completion",
      } }
  end,
}

return M
