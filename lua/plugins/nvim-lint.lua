return {
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = "VeryLazy",
    opts = {
      linters_by_ft = {
        ["*"] = { "typos", "proselint" },
        bash = { "shellcheck" },
        fish = { "fish" },
        javascript = { "biomejs", "deno" },
        javascriptreact = { "biomejs", "deno" },
        json = { "biomejs", "deno" },
        jsonc = { "biomejs", "deno" },
        lua = { "luacheck" },
        markdown = { "deno" },
        python = { "ruff" },
        sh = { "shellcheck" },
        typescript = { "biomejs", "deno" },
        typescriptreact = { "biomejs", "deno" },
        yaml = { "actionlint" },
      },
    },
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd(
        { "BufEnter", "BufWritePost", "InsertLeave" },
        {
          callback = function()
            lint.try_lint()
          end,
        }
      )
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
