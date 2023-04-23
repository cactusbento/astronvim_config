return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup({
          hint_enable = true,
          hint_prefix = "!>",
      })
    end,
  },
  {
    "ishan9299/nvim-solarized-lua",
    as = "solarized",
    lazy = false,
  },
}
