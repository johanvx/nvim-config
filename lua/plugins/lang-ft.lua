-- This is for specific languages and filetypes.

return {
  -- Requires `deno` for Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
    keys = {
      {
        "<LocalLeader>p",
        "<Cmd>MarkdownPreviewToggle<CR>",
        desc = "Toggle markdown preview (markdown-preview.nvim)",
      },
    },
    opts = {
      mkdp_auto_close = 0,
    },
    config = function(_, opts)
      for k, v in pairs(opts) do
        vim.g[k] = v
      end
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
