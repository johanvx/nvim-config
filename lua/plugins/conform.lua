return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = "VeryLazy",
    keys = {
      {
        "<Leader>lf",
        "<Cmd>lua User.p.format()<CR>",
        mode = "",
        desc = "Format",
      },
    },
    opts = {
      formatters_by_ft = {
        ["*"] = { "typos", "codespell", "autocorrect" },
        bash = { "shfmt" },
        c = { { "clang_format", "ast-grep" } },
        cpp = { { "clang_format", "ast-grep" } },
        css = { "ast-grep" },
        fish = { "fish_indent" },
        go = { "ast-grep" },
        html = { "ast-grep" },
        javascript = { { "biome", "deno_fmt" } },
        javascriptreact = { { "biome", "deno_fmt" } },
        json = { { "biome", "deno_fmt" } },
        jsonc = { { "biome", "deno_fmt" } },
        lua = { { "stylua", "ast-grep" } },
        markdown = { "deno_fmt" },
        python = { "ruff_fix", "ruff_format" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        toml = { "taplo" },
        typescript = { { "biome", "deno_fmt" } },
        typescriptreact = { { "biome", "deno_fmt" } },
        typst = { "typstfmt" },
        yaml = { "yamlfmt" },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    end,
  },
}
