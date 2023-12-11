return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      -- Formatter
      "stevearc/conform.nvim",
      -- Linter
      "mfussenegger/nvim-lint",
      -- Navigation
      "SmiteshP/nvim-navbuddy",
      -- Completion
      "hrsh7th/cmp-nvim-lsp",
      -- Signature
      "ray-x/lsp_signature.nvim",
      -- Neovim package manager
      "williamboman/mason-lspconfig.nvim",
    },
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
        "<Leader>lr",
        "<Cmd>lua vim.lsp.buf.rename()<CR>",
        desc = "Rename",
      },
    },
    opts = {
      servers = {
        -- `ast-grep` for many languages...
        ast_grep = {},
        -- `bash-language-server` for Bash
        bashls = {},
        -- `clangd` for C/C++
        clangd = {
          capabilities = {
            offsetEncoding = { "utf-16", "utf-8" },
          },
        },
        -- -- `deno` for frontend
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
                args = { "-X", "build" },
                executable = "tectonic",
              },
            },
          },
        },
        -- `typos-lsp` for spell check
        typos_lsp = {},
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
  {
    "SmiteshP/nvim-navbuddy",
    keys = {
      { "<Leader>n", "<Cmd>Navbuddy<CR>", desc = "Navbuddy" },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "SmiteshP/nvim-navic",
        opts = {
          highlight = true,
          click = true,
        },
        init = function()
          -- Use winbar to display
          vim.o.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
        end,
      },
    },
    opts = {
      border = "none",
      lsp = { auto_attach = true },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      -- Some are manually installed.
      automatic_installation = { exclude = { "denols", "rust_analyzer" } },
    },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
