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
              -- `deno` for frontend
              null_ls.builtins.diagnostics.deno_lint,
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
      -- For hrsh7th/nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre, BufNewFile" },
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
    },
    opts = {
      servers = {
        -- `bash-language-server` for Bash
        bashls = {},
        -- `clangd` for C/C++
        clangd = {},
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
        -- `ruff-lsp` for Python
        ruff_lsp = {},
        -- `tailwindcss-language-server` for TailwindCSS
        tailwindcss = {},
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
        -- `typescript-language-server` for frontend
        -- tsserver = {},
        -- `typst-lsp` for Typst
        typst_lsp = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      -- Server setups
      for _, server in pairs(vim.tbl_keys(opts.servers)) do
        lspconfig[server].setup(vim.tbl_deep_extend("force", {
          on_attach = function(client, bufnr)
            -- Use echasnovski/mini.completion
            -- vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

            -- Use SmiteshP/nvim-navic
            if client.server_capabilities.documentSymbolProvider then
              require("nvim-navic").attach(client, bufnr)
            end
          end,
          -- Use hrsh7th/cmp-nvim-lsp for hrsh7th/nvim-cmp
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }, opts.servers[server]))
      end
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
