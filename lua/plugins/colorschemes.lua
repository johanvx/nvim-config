return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
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
          base = "#21212f",
          text = "#e2e2f1",
          red = "#ff6060",
          blue = "#6060ff",
          yellow = "#ffff60",
          green = "#60ff60",
          pink = "#ff60b0",
          peach = "#ffb060", -- orange
          mauve = "#b060ff", -- purple
          sky = "#60ffff", -- cyan
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
            Boolean = { fg = p.mauve },
            Conditional = { fg = p.pink },
            Comment = { fg = p.blue },
            Character = { fg = p.pink },
            Constant = { fg = p.mauve },
            CursorLine = { bg = p.none },
            Function = { fg = p.green },
            Include = { fg = p.pink },
            Keyword = { fg = p.sky },
            NormalFloat = { link = "Normal" },
            Number = { fg = p.mauve },
            Macro = { fg = p.pink },
            MsgArea = { bg = p.base },
            Operator = { fg = p.pink },
            Repeat = { fg = p.pink },
            StatusLine = { fg = p.text, bg = p.base },
            StorageClass = { fg = p.sky },
            String = { fg = p.yellow },
            Structure = { fg = p.pink },
            Tag = { fg = p.sky },
            Type = { fg = p.sky },
            TypeDef = { fg = p.yellow },
            VertSplit = { fg = p.surface2 },

            -- Mini
            MiniStatuslineInactive = { bg = p.base },
            MiniTablineHidden = { fg = p.surface0, bg = p.base },

            -- Treesitter
            ["@constant"] = { fg = p.mauve },
            ["@constructor"] = { link = "@type" },
            ["@field"] = { fg = p.peach },
            ["@function.builtin"] = { fg = p.sky },
            ["@function.macro"] = { link = "Macro" },
            ["@keyword"] = { fg = p.pink },
            ["@keyword.function"] = { fg = p.sky },
            ["@keyword.operator"] = { link = "Operator" },
            ["@keyword.return"] = { link = "Operator" },
            ["@namespace"] = { link = "Structure" },
            ["@number"] = { link = "Number" },
            ["@parameter"] = { fg = p.peach, style = { "italic" } },
            ["@parameter.reference"] = { fg = p.peach },
            ["@punctuation.bracket"] = { fg = p.text },
            ["@punctuation.delimiter"] = { fg = p.text },
            ["@punctuation.special"] = { fg = p.text },
            ["@string.regex"] = { fg = p.red },
            ["@symbol"] = { fg = p.sky },
            ["@tag"] = { fg = p.sky },
            ["@tag.attribute"] = { fg = p.green },
            ["@tag.delimiter"] = { fg = p.sky },
            ["@type.builtin"] = { fg = p.sky, style = { "italic" } },
            ["@type.qualifier"] = { fg = p.pink },
            ["@text"] = { link = "Normal" },
            ["@text.emphasis"] = { fg = p.yellow, style = { "italic" } },
            ["@text.literal"] = { fg = p.green },
            ["@text.reference"] = { fg = p.pink },
            ["@text.strong"] = { fg = p.peach, style = { "bold" } },
            ["@text.title"] = { fg = p.mauve },
            ["@text.underline"] = { fg = p.peach },
            ["@text.uri"] = { fg = p.sky },
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
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("gruvbox").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
