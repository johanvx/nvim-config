-- Requires `rust-analyzer` for Rust
--
-- This plugin setup the `servers.rust_analyzer` for `nvim-lspconfig`, so don't
-- do that manually in `lsp.lua`.

return {
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {},
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
}
