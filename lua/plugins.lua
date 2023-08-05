-- Plugin-related table
User.p = {}

function User.p.format_and_save()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  local has_null_ls = #require("null-ls.sources").get_available(
    ft,
    "NULL_LS_FORMATTING"
  ) > 0

  -- Format
  vim.lsp.buf.format({
    bufnr = bufnr,
    filter = function(client)
      return has_null_ls == (client.name == "null-ls")
    end,
  })

  -- Save
  vim.cmd("update")
end

function User.p.server_opts_with_fallback(opts)
  return vim.tbl_deep_extend("keep", opts, {
    on_attach = function(client, bufnr)
      -- Use echasnovski/mini.completion
      -- vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

      -- Use SmiteshP/nvim-navic
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
      end

      -- Enable inlay hint
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint(bufnr, true)
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
