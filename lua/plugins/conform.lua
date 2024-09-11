return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = "VeryLazy",
    keys = {
      {
        "<Leader>tf",
        "<Cmd>FormatToggle<CR>",
        mode = "",
        desc = "Toggle Format",
      },
    },
    opts = {
      default_format_opts = { stop_after_first = true },
      formatters = {
        -- typstyle
        typstyle = {
          command = "typstyle", -- YOU SHOULD INSTALL IT YOURSELF RIGHT NOW
          stdin = false,
          args = { "-i", "$FILENAME" },
        },
      },
      formatters_by_ft = {
        ["*"] = {
          --[["codespell",]]
          -- "autocorrect",
          -- "typos",
          "trim_newlines",
          "trim_whitespace",
        },
        bash = { "shfmt" },
        c = { "clang_format", "ast-grep" },
        cmake = { "gersemi" },
        cpp = { "clang_format", "ast-grep" },
        css = { "ast-grep" },
        fish = { "fish_indent" },
        go = { "ast-grep" },
        html = { "ast-grep" },
        javascript = { "prettier", "deno_fmt", "biome" },
        javascriptreact = { "prettier", "deno_fmt", "biome" },
        json = { "prettier", "deno_fmt", "biome" },
        jsonc = { "prettier", "deno_fmt", "biome" },
        lua = { "stylua", "ast-grep" },
        markdown = { "deno_fmt" },
        python = { "ruff_fix", "ruff_format" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        toml = { "taplo" },
        typescript = { "prettier", "deno_fmt", "biome" },
        typescriptreact = { "prettier", "deno_fmt", "biome" },
        typst = { "typstyle" },
        yaml = { "yamlfmt" },
      },
      format_on_save = function()
        if User.p.disable_format_on_save then
          return
        end
        return { lsp_fallback = true, timeout_ms = 500 }
      end,
    },
    init = function()
      vim.o.formatexpr = "v:lua.require('conform').formatexpr()"

      -- Enable format-on-save by default
      User.p.disable_format_on_save = false

      vim.api.nvim_create_user_command("FormatToggle", function()
        User.p.disable_format_on_save = not User.p.disable_format_on_save
        if User.p.disable_format_on_save then
          vim.notify("Format-on-save is disabled.", vim.log.levels.INFO)
        else
          vim.notify("Format-on-save is enabled.", vim.log.levels.INFO)
        end
      end, {
        desc = "Toggle format-on-save",
      })
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
