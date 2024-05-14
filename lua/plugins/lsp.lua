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
      -- Neovim plugin development
      "folke/neodev.nvim",
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
        "<Leader>la",
        "<Cmd>lua vim.lsp.buf.code_action()<CR>",
        mode = { "n", "v" },
        desc = "Code action",
      },
      {
        "<Leader>ld",
        "<Cmd>lua vim.diagnostic.open_float()<CR>",
        desc = "Diagnostics",
      },
      {
        "<Leader>lq",
        "<Cmd>lua vim.diagnostic.setqflist()<CR>",
        desc = "Set quickfix list",
      },
      {
        "<Leader>lr",
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
