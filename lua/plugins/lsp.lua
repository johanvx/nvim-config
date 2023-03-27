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

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        opts = function()
          local null_ls = require("null-ls")
          return {
            sources = {
              -- Diagnostics
              -- `chktex` for LaTeX
              null_ls.builtins.diagnostics.chktex,
              -- `fish` for fish
              null_ls.builtins.diagnostics.fish,
              -- `ruff` for Python
              null_ls.builtins.diagnostics.ruff,

              -- Formatting
              -- `black` for Python
              null_ls.builtins.formatting.black,
              -- `clang-format` for C/C++/...
              null_ls.builtins.formatting.clang_format,
              -- `deno` for frontend
              null_ls.builtins.formatting.deno_fmt,
              -- `shfmt` for Bash
              null_ls.builtins.formatting.shfmt,
              -- `stylua` for Lua
              null_ls.builtins.formatting.stylua,
              -- `ruff` for Python
              null_ls.builtins.formatting.ruff,
              -- `rustfmt` for Rust
              null_ls.builtins.formatting.rustfmt,
            },
          }
        end,
        config = function(_, opts)
          require("null-ls").setup(opts)
        end,
      },
      {
        "SmiteshP/nvim-navic",
        opts = {
          highlight = true,
        },
        config = function(_, opts)
          require("nvim-navic").setup(opts)

          -- Use winbar to display
          vim.o.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
        end,
      },
    },
    event = "VeryLazy",
    keys = {
      {
        "<Leader>ld",
        "<Cmd>lua vim.diagnostic.open_float()<CR>",
        desc = "Diagnostics",
      },
      {
        "<Leader>lh",
        "<Cmd>lua vim.lsp.buf.hover()<CR>",
        desc = "Information",
      },
      {
        "<Leader>lf",
        "<Cmd>lua User.p.format_and_save()<CR>",
        desc = "Format and save",
      },
      {
        "<Leader>lr",
        "<Cmd>lua vim.lsp.buf.rename()<CR>",
        desc = "Rename",
      },
      {
        "]d",
        "<Cmd>lua vim.diagnostic.goto_next()<CR>",
        desc = "Next diagnostic",
      },
      {
        "[d",
        "<Cmd>lua vim.diagnostic.goto_prev()<CR>",
        desc = "Previous diagnostic",
      },
    },
    opts = {
      servers = {
        -- `bash-language-server` for Bash
        bashls = {},
        -- `deno` for frontend
        denols = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "json",
            "jsonc",
            "markdown",
          },
        },
        -- `ruff-lsp` for Python
        ruff_lsp = {},
        -- `rust-analyzer` for Rust
        rust_analyzer = {},
        -- `lua-language-server` for Lua
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        -- `texlab` for LaTeX
        texlab = {
          settings = {
            texlab = {
              build = {
                args = { "-X", "bulid" },
                executable = "tectonic",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      -- Server setups
      local lspconfig = require("lspconfig")
      for _, server in pairs(vim.tbl_keys(opts.servers)) do
        lspconfig[server].setup(vim.tbl_deep_extend("force", {
          on_attach = function(client, bufnr)
            -- Use mini.completion
            vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

            -- Use SmiteshP/nvim-navic
            if client.server_capabilities.documentSymbolProvider then
              require("nvim-navic").attach(client, bufnr)
            end

            -- Disable LSP highlight
            client.server_capabilities.semanticTokensProvider = nil
          end,
        }, opts.servers[server]))
      end
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
