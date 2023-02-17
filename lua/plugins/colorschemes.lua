return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    keys = {
      {
        "<LocalLeader><LocalLeader>",
        function()
          vim.pretty_print(vim.treesitter.get_captures_at_cursor(0))
        end,
        desc = "Get captures at cursor",
      },
    },
    opts = {
      flavour = "mocha",
      integrations = {
        gitsigns = true,
        mini = true,
        telescope = true,
        which_key = true,
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
      },
      color_overrides = {
        mocha = {
          base = "#22212c",
          text = "#f8f8f2",
          red = "#ff5555",
          -- blue = "#5555ff",
          yellow = "#ffff80",
          green = "#8aff80",
          pink = "#ff80bf",
          orange = "#ff9580",
          purple = "#9580ff",
          cyan = "#80ffea",
          surface2 = "#8a86b4",
          surface1 = "#3c3a4f",
          surface0 = "#3b3b4a",
          none = "NONE",
        },
      },
      highlight_overrides = {
        mocha = function(p)
          return {
            -- Builtins
            Boolean = { fg = p.purple },
            Conditional = { fg = p.pink },
            Comment = { fg = p.purple },
            Character = { fg = p.pink },
            Constant = { fg = p.purple },
            CursorLine = { bg = p.none },
            Function = { fg = p.green },
            Include = { fg = p.purple },
            Keyword = { fg = p.cyan },
            Number = { fg = p.purple },
            Macro = { fg = p.pink },
            Operator = { fg = p.pink },
            Repeat = { fg = p.pink },
            StorageClass = { fg = p.cyan },
            String = { fg = p.yellow },
            Structure = { fg = p.pink },
            Tag = { fg = p.cyan },
            Type = { fg = p.cyan },
            TypeDef = { fg = p.yellow },
            VertSplit = { fg = p.surface2 },

            -- Treesitter
            ["@constant"] = { fg = p.purple },
            ["@constructor"] = { link = "@type" },
            ["@field"] = { fg = p.orange },
            ["@function.builtin"] = { fg = p.cyan },
            ["@function.macro"] = { link = "Macro" },
            ["@keyword"] = { fg = p.pink },
            ["@keyword.function"] = { fg = p.cyan },
            ["@keyword.operator"] = { link = "Operator" },
            ["@keyword.return"] = { link = "Operator" },
            ["@namespace"] = { link = "Structure" },
            ["@number"] = { link = "Number" },
            ["@parameter"] = { fg = p.orange, style = { "italic" } },
            ["@parameter.reference"] = { fg = p.orange },
            ["@punctuation.bracket"] = { fg = p.text },
            ["@punctuation.delimiter"] = { fg = p.text },
            ["@punctuation.special"] = { fg = p.text },
            ["@string.regex"] = { fg = p.red },
            ["@symbol"] = { fg = p.cyan },
            ["@tag"] = { fg = p.cyan },
            ["@tag.attribute"] = { fg = p.green },
            ["@tag.delimiter"] = { fg = p.cyan },
            ["@type.builtin"] = { fg = p.cyan, style = { "italic" } },
            ["@type.qualifier"] = { fg = p.pink },
            ["@text"] = { link = "Normal" },
            ["@text.emphasis"] = { fg = p.yellow, style = { "italic" } },
            ["@text.literal"] = { fg = p.green },
            ["@text.reference"] = { fg = p.pink },
            ["@text.strong"] = { fg = p.orange, style = { "bold" } },
            ["@text.title"] = { fg = p.purple },
            ["@text.underline"] = { fg = p.orange },
            ["@text.uri"] = { fg = p.cyan },
            ["@variable"] = { fg = p.text },
            ["@variable.builtin"] = { fg = p.pink },
          }
        end,
      },
      styles = {
        comments = {},
        conditionals = {},
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
