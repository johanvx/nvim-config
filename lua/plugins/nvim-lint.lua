return {
  {
    "mfussenegger/nvim-lint",
    enabled = false,
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = "VeryLazy",
    opts = {
      linters_by_ft = {
        ["*"] = { "typos", "proselint" },
        bash = { "shellcheck" },
        fish = { "fish" },
        javascript = { "eslint", "deno", "biomejs" },
        javascriptreact = { "deno", "biomejs" },
        json = { "eslint", "deno", "biomejs" },
        jsonc = { "eslint", "deno", "biomejs" },
        lua = { "luacheck" },
        markdown = { "deno" },
        python = { "ruff" },
        sh = { "shellcheck" },
        typescript = { "eslint", "deno", "biomejs" },
        typescriptreact = { "eslint", "deno", "biomejs" },
        yaml = { "yamllint" },
      },
    },
    config = function(_, opts)
      local lint = require("lint")

      for name, linter in pairs(opts.linters or {}) do
        if type(linter) == "table" and type(lint.linters[name]) == "table" then
          lint.linters[name] =
            vim.tbl_deep_extend("force", lint.linters[name], linter)
        else
          lint.linters[name] = linter
        end
      end
      lint.linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd(
        { "BufEnter", "BufWritePost", "InsertLeave" },
        {
          callback = function()
            local names = lint._resolve_linter_by_ft(vim.bo.filetype)
            names = vim.list_extend({}, names)

            -- Add fallback linters
            if #names == 0 then
              vim.list_extend(names, lint.linters_by_ft["_"] or {})
            end
            -- Add global linters
            vim.list_extend(names, lint.linters_by_ft["*"] or {})

            -- Filter out linters that don't exist or don't match the condition
            local ctx = { filename = vim.api.nvim_buf_get_name(0) }
            ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
            names = vim.tbl_filter(function(name)
              local linter = lint.linters[name]
              if not linter then
                vim.notify(
                  "Linter not found: " .. name,
                  vim.log.levels.WARN,
                  { title = "nvim-lint" }
                )
              end
              return linter
                and not (
                  type(linter) == "table"
                  and linter.condition
                  and not linter.condition(ctx)
                )
            end, names)

            if #names > 0 then
              lint.try_lint(names)
            end
          end,
        }
      )
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
