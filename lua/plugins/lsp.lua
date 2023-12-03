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
              -- `ruff` for Python
              null_ls.builtins.formatting.ruff,
              -- `rustfmt` for Rust
              null_ls.builtins.formatting.rustfmt,
              -- `shfmt` for Bash
              null_ls.builtins.formatting.shfmt,
              -- `stylua` for Lua
              null_ls.builtins.formatting.stylua,
              -- `taplo` for TOML
              null_ls.builtins.formatting.taplo,
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
      -- Signature
      "ray-x/lsp_signature.nvim",
    },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    keys = {
      {
        "gd",
        "<Cmd>lua vim.lsp.buf.definition()<CR>",
        desc = "Definition (LSP)",
      },
      {
        "gD",
        "<Cmd>lua vim.lsp.buf.declaration()<CR>",
        desc = "Declaration (LSP)",
      },
      {
        "gi",
        "<Cmd>lua vim.lsp.buf.implementation()<CR>",
        desc = "Implementation (LSP)",
      },
      {
        "K",
        "<Cmd>lua vim.lsp.buf.hover()<CR>",
        desc = "Information (LSP)",
      },
      {
        "<C-K>",
        "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
        desc = "Signature (LSP)",
      },
      {
        "<Leader>ld",
        "<Cmd>lua vim.diagnostic.open_float()<CR>",
        desc = "Diagnostics",
      },
      {
        "<Leader>lf",
        "<Cmd>lua User.p.format()<CR>",
        mode = { "n", "x" },
        desc = "Format",
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
        clangd = {
          capabilities = {
            offsetEncoding = { "utf-16", "utf-8" },
          },
        },
        -- `deno` for frontend
        -- denols = {
        --   filetypes = {
        --     "javascript",
        --     "javascriptreact",
        --     "javascript.jsx",
        --     "typescript",
        --     "typescriptreact",
        --     "typescript.tsx",
        --     "json",
        --     "jsonc",
        --     "markdown",
        --   },
        -- },
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
              hint = {
                enable = true,
              },
            },
          },
        },
        -- `ruff-lsp` for Python
        ruff_lsp = {},
        -- `rust-analyzer` for Rust
        rust_analyzer = {
          general = { positionEncodings = { "utf-16", "utf-8" } },
          cargo = { features = "all" },
        },
        -- `tailwindcss-language-server` for TailwindCSS
        tailwindcss = {},
        -- `taplo` for TOML
        taplo = {},
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
        -- `typst-lsp` for Typst
        typst_lsp = {
          settings = {
            exportPdf = "onType", -- Choose onType, onSave or never.
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      -- Server setups
      for _, server in pairs(vim.tbl_keys(opts.servers)) do
        lspconfig[server].setup(
          User.p.server_opts_with_fallback(opts.servers[server])
        )
      end
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
