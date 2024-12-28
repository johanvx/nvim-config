return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      -- Formatter
      "stevearc/conform.nvim",
      -- Linter
      "mfussenegger/nvim-lint",
      -- Completion
      -- "hrsh7th/cmp-nvim-lsp",
      "saghen/blink.cmp",
      -- Signature
      "ray-x/lsp_signature.nvim",
      -- Neovim package manager
      "williamboman/mason-lspconfig.nvim",
      -- Fast LuaLS setup for Neovim
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
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
        "<LocalLeader><Leader>a",
        "<Cmd>lua vim.lsp.buf.code_action()<CR>",
        mode = { "n", "v" },
        desc = "Code action",
      },
      {
        "<LocalLeader><Leader>d",
        "<Cmd>lua vim.diagnostic.open_float()<CR>",
        desc = "Diagnostics",
      },
      {
        "<LocalLeader><Leader>q",
        "<Cmd>lua vim.diagnostic.setqflist()<CR>",
        desc = "Set quickfix list",
      },
      {
        "<LocalLeader><Leader>r",
        "<Cmd>lua vim.lsp.buf.rename()<CR>",
        desc = "Rename symbol",
      },
      {
        "<Leader>td",
        "<Cmd>DiagnosticsToggle<CR>",
        desc = "Toggle diagnostics",
      },
      {
        "<Leader>ti",
        "<Cmd>InlayHintToggle<CR>",
        desc = "Toggle inlay hint",
      },
    },
    opts = {
      servers = {
        -- `ast-grep` for many languages...
        ast_grep = {},
        -- `bash-language-server` for Bash
        bashls = {},
        -- `biome` for frontend
        biome = { single_file_support = true },
        -- `clangd` for C/C++
        clangd = {
          capabilities = {
            offsetEncoding = { "utf-16", "utf-8" },
          },
        },
        -- `css-variables-language-server` for CSS
        css_variables = {},
        -- `css-languageserver` from `vscode-langservers-extracted` for CSS
        cssls = {},
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
                globals = { "vim", "User" },
              },
              hint = {
                enable = true,
              },
            },
          },
        },
        -- `neocmakelsp` for CMake
        neocmake = {},
        -- `pylyzer` for Python
        -- pylyzer = {},
        -- `pyright` for Python
        pyright = {},
        -- `ruff` for Python
        ruff = {},
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
        -- `tinymist` for Typst
        tinymist = {
          settings = {
            exportPdf = "onType",
          },
        },
        -- `typos-lsp` for spell check
        typos_lsp = {},
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

      -- Diagnostic setups
      --
      -- No virtual texts, no underlines
      vim.diagnostic.config({ virtual_text = false, underline = false })

      -- Custom commands
      vim.api.nvim_create_user_command("DiagnosticsToggle", function()
        local is_enabled = vim.diagnostic.is_enabled()
        vim.diagnostic.enable(not is_enabled)
        if is_enabled then
          vim.notify("Diagnostics is disabled.", vim.log.levels.INFO)
        else
          vim.notify("Diagnostics is enabled.", vim.log.levels.INFO)
        end
      end, {
        desc = "Toggle diagnostics",
      })
      vim.api.nvim_create_user_command("InlayHintToggle", function()
        local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
        vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = 0 })
        if is_enabled then
          vim.notify("Inlay-hint is disabled.", vim.log.levels.INFO)
        else
          vim.notify("Inlay-hint is enabled.", vim.log.levels.INFO)
        end
      end, {
        desc = "Toggle inlay-hint",
      })
    end,
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
