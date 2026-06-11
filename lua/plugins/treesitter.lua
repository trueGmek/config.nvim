return {
  'nvim-treesitter/nvim-treesitter',
  branch = "main",
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require('nvim-treesitter');
    treesitter.setup {
      -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
      install_dir = vim.fn.stdpath('data') .. '/site',
      ensure_installed = { "c", "cpp", "c_sharp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      highlight = { disable = { "openscad" } },
      incremental_selection = { disable = { "openscad" } },
      indent = { disable = { "openscad" } },
    }
  end
}
