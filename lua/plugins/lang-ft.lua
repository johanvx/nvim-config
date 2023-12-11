-- This is for specific languages and filetypes.

return {
  -- Requires `yarn` for Markdown
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
  -- This plugin doesn't set up the `servers.rust_analyzer` for `nvim-lspconfig`,
  -- so need to set up `servers.rust_analyzer` that manually in `lsp.lua`.
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
  -- A `tsserver` alternative for TypeScript
  --
  -- This plugin acts as a replacement of `servers.tsserver` for
  -- `nvim-lspconfig`, so don't set up `tsserver` manually in `lsp.lua`.
  {
    "pmizio/typescript-tools.nvim",
    enabled = true,
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
  },
  -- Typst support
  {
    "kaarmu/typst.vim",
    ft = "typst",
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
