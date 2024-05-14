-- Plugin-related table
User.p = {}

function User.p.format()
  require("conform").format({ async = true, lsp_fallback = true })
end

function User.p.server_opts_with_fallback(opts)
  return vim.tbl_deep_extend("keep", opts, {
    on_attach = function(client, bufnr)
      -- Use echasnovski/mini.completion
      -- vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

      -- Use LSP omnifunc
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Use SmiteshP/nvim-navic
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
      end

      -- Enable inlay hint
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end

      -- Use ray-x/lsp_signature.nvim
      require("lsp_signature").on_attach({
        doc_lines = 0,
        handler_opts = {
          border = "none",
        },
      })
    end,
    -- Use hrsh7th/cmp-nvim-lsp for hrsh7th/nvim-cmp
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end

return {}
