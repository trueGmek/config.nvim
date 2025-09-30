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
    local status_ok, blink_cmp = pcall(require, 'blink.cmp')

    if not status_ok then
      vim.notify("Could not load module 'blink.cmp'", vim.log.levels.ERROR)
      return
    end

    local capabilities = blink_cmp.get_lsp_capabilities()

    vim.lsp.config('*', {
      root_markers = { '.git' },
    })

    vim.lsp.config.lua_ls = { capabilities = capabilities }
    vim.lsp.config.basedpyright = { capabilities = capabilities }
    vim.lsp.config.clangd = {
      capabilities = capabilities,
      root_markers = { 'compile_commands.json', '.clangd', 'build.ninja', '.git', '.clang-format' },
      cmd = {
        "clangd",
        "--clang-tidy",
        "--enable-config",
        "--completion-style=detailed",
        "--header-insertion=never",
        "--all-scopes-completion",
      }
    }

    vim.lsp.config.omnisharp = {
      capabilities = capabilities,
      root_markers = { "*.sln", ".git", ".editorconfig" },
      settings = {
        FormattingOptions = { EnableEditorConfigSupport = true },
        RoslynExtensionsOptions = {
          EnableAnalyzersSupport = true
        }
      },
      cmd = {
        "omnisharp",
        "--languageserver"
      }
    }

    vim.lsp.enable({ 'lua_ls', 'clangd', 'omnisharp' })
  end,
}

return M
