return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",
    config = function()
      local luasnip = require("luasnip")
      luasnip.filetype_extend("cpp", { "unreal" })
      luasnip.filetype_extend("cs", { "unity" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  }
}
