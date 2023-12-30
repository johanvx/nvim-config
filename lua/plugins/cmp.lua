function User.p.jump_next_with_fallback(key)
  if vim.fn["vsnip#jumpable"](1) then
    return "<Plug>(vsnip-jump-next)"
  end

  return key
end

function User.p.jump_prev_with_fallback(key)
  if vim.fn["vsnip#jumpable"](-1) then
    return "<Plug>(vsnip-jump-prev)"
  end

  return key
end

return {
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "rcarriga/cmp-dap",
    },
    keys = {
      {
        "<Tab>",
        function()
          return User.p.jump_next_with_fallback("<Tab>")
        end,
        mode = { "i", "s" },
        desc = "Jump to the next item",
        expr = true,
      },
      {
        "<S-Tab>",
        function()
          return User.p.jump_prev_with_fallback("<S-Tab>")
        end,
        mode = { "i", "s" },
        desc = "Jump to the previous item",
        expr = true,
      },
    },
    opts = function()
      local cmp = require("cmp")

      return {
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-]>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = {
          ghost_text = true,
        },
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")

      cmp.setup(opts)

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "dap" },
        }),
      })
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
