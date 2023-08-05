-- This is for specific languages and filetypes.

return {
  -- Requires `deno` for Markdown
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    ft = "markdown",
    keys = {
      {
        "<LocalLeader>p",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Toggle markdown preview (peek.nvim)",
      },
    },
    opts = {
      theme = "light",
    },
    config = function(_, opts)
      require("peek").setup(opts)
    end,
  },
  -- Requires `rust-analyzer` for Rust
  --
  -- This plugin sets up the `servers.rust_analyzer` for `nvim-lspconfig`, so
  -- don't do that manually in `lsp.lua`.
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = { server = User.p.server_opts_with_fallback({}) },
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  -- A `tsserver` alternative for TypeScript
  --
  -- This plugin acts as a replacement of `servers.tsserver` for
  -- `nvim-lspconfig`, so don't set up `tsserver` manually in `lsp.lua`.
  {
    "pmizio/typescript-tools.nvim",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = User.p.server_opts_with_fallback({
      settings = {
        tsserver_file_preferences = {
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = true,
        },
      },
    }),
    config = function(_, opts)
      require("typescript-tools").setup(opts)
    end,
  },
  -- Typst support
  {
    "kaarmu/typst.vim",
    ft = "typst",
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
