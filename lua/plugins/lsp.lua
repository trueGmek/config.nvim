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
      capabilities = capabilities,
    })

    vim.lsp.config('lua_ls', {
      settings = {
        format = {
          tableSeparatorAlign = 'None',
          tableConstructorAlign = 'None',
        }
      }
    })

    vim.lsp.config('clangd', {
      root_markers = { 'compile_commands.json', '.clangd', 'build.ninja', '.git', '.clang-format' },
      cmd = {
        "clangd",
        "--clang-tidy",
        "--enable-config",
        "--completion-style=detailed",
        "--header-insertion=never",
        "--all-scopes-completion",
      }
    })

    vim.lsp.config('omnisharp', {
      root_markers = { ".sln", ".git", ".editorconfig" },
      settings = {
        FormattingOptions = { EnableEditorConfigSupport = true },
        RoslynExtensionsOptions = {
          EnableAnalyzersSupport = true,
          EnableDecompilationSupport = true
        }
      },
      cmd = {
        "omnisharp",
        "--languageserver"
      },
      cmd_env = {
        DOTNET_GCHeapHardLimit = "4294967296"
      }
    })

    vim.lsp.config('openscad_lsp', {
      cmd = { "/home/gmek/Dev/SCAD/openscad-LSP/target/release/openscad-lsp", "--stdio" },
    })

    vim.lsp.enable({ 'lua_ls', 'clangd', 'omnisharp', 'openscad_lsp' })
  end,
}

return M
