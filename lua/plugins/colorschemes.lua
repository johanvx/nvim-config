return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        mini = true,
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
        neotree = true,
        telescope = true,
        vimwiki = true,
        which_key = true,
      },
      color_overrides = {
        mocha = {
          rosewater = "#ff60b0", -- pink
          flamingo = "#ff60b0", -- pink
          pink = "#ff60b0",
          mauve = "#b060ff", -- violet
          red = "#ff6060",
          maroon = "#ffb060", -- orange
          peach = "#ffb060", -- orange
          yellow = "#ffff60",
          green = "#60ff60",
          teal = "#60ffb0",
          sky = "#60ffff", -- cyan
          sapphire = "#60b0ff", -- azure
          blue = "#6060ff",
          lavender = "#6060ff", -- blue
          text = "#e2e2f1",
          subtext1 = "#80809e", -- lightgrey/lightgray, comment
          subtext0 = "#80809e", -- lightgrey/lightgray, comment
          overlay2 = "#59596f", -- grey/gray, ignore
          overlay1 = "#59596f", -- grey/gray, ignore
          overlay0 = "#59596f", -- grey/gray, ignore
          surface2 = "#40404f", -- darkgrey/darkgray, selection
          surface1 = "#40404f", -- darkgrey/darkgray, selection
          surface0 = "#40404f", -- darkgrey/darkgray, selection
          base = "#21212f",
          mantle = "#21212f", -- base
          crust = "#21212f", -- base
        },
      },
      highlight_overrides = {
        mocha = function(p)
          return {
            -- Builtins
            NormalFloat = { link = "Normal" },
            Comment = { fg = p.subtext0 },
            Constant = { fg = p.sapphire },
            String = { link = "Constant" },
            Character = { fg = p.pink },
            Boolean = { link = "Constant" },
            Number = { link = "Constant" },
            Float = { link = "Constant" },
            Identifier = { fg = p.teal },
            Function = { link = "Identifier" },
            Statement = { fg = p.pink },
            Conditional = { link = "Statement" },
            Repeat = { link = "Statement" },
            Label = { link = "Statement" },
            Operator = { link = "Statement" },
            Keyword = { link = "Statement" },
            Exception = { link = "Statement" },
            PreProc = { fg = p.pink },
            Include = { link = "PreProc" },
            Define = { link = "PreProc" },
            Macro = { link = "PreProc" },
            PreCondit = { link = "PreProc" },
            Type = { fg = p.sky },
            StorageClass = { link = "Type" },
            Structure = { link = "Type" },
            Typedef = { link = "Type" },
            Special = { fg = p.pink },
            SpecialChar = { link = "Special" },
            Tag = { link = "Special" },
            Delimiter = { fg = p.overlay0 },
            SpecialComment = { link = "Special" },
            Debug = { link = "Special" },
            Underlined = { fg = p.sapphire, style = { "underline" } },
            Ignore = { fg = p.overlay0 },
            Error = { fg = p.red },
            Todo = { fg = p.sky },
            CursorLine = { bg = p.none },
            Visual = { bg = p.surface0 },
            FloatBorder = { fg = p.subtext0 },
            MsgArea = { bg = p.base },
            StatusLine = { fg = p.text, bg = p.surface0 },
            VertSplit = { fg = p.subtext0 },

            -- Mini
            MiniStatuslineInactive = { bg = p.base },
            MiniTablineCurrent = { fg = p.text, bg = p.base, style = {} },
            MiniTablineFill = { bg = p.surface0 },
            MiniTablineHidden = { fg = p.overlay0, bg = p.surface0 },
            MiniTablineVisible = { fg = p.subtext0, bg = p.base },

            -- Treesitter
            ["@constant"] = { link = "Constant" },
            ["@constant.builtin"] = { fg = p.pink },
            ["@constructor"] = { link = "@type" },
            ["@field"] = { link = "@variable" },
            ["@function.builtin"] = { link = "Function" },
            ["@function.macro"] = { link = "Macro" },
            ["@keyword"] = { link = "Keyword" },
            ["@keyword.function"] = { link = "Keyword" },
            ["@keyword.operator"] = { link = "Operator" },
            ["@keyword.return"] = { link = "Operator" },
            ["@namespace"] = { link = "Structure" },
            ["@number"] = { link = "Number" },
            ["@number.css"] = { link = "Number" },
            ["@parameter"] = { link = "Normal"},
            ["@parameter.reference"] = { link = "Normal" },
            ["@property"] = { link = "@variable" },
            ["@property.css"] = { link = "@property" },
            ["@property.class.css"] = { fg = p.pink },
            ["@property.id.css"] = { link = "@property" },
            ["@punctuation.bracket"] = { link = "Delimiter" },
            ["@punctuation.delimiter"] = { link = "Delimiter" },
            ["@punctuation.special"] = { link = "SpecialChar" },
            ["@string"] = { link = "String" },
            ["@string.escape"] = { link = "Identifier" },
            ["@string.plain.css"] = { link = "String" },
            ["@string.regex"] = { link = "SpecialChar" },
            ["@string.special"] = { link = "SpecialChar" },
            ["@symbol"] = { fg = p.sky },
            ["@tag"] = { link = "Tag" },
            ["@tag.attribute"] = { link = "@property" },
            ["@tag.delimiter"] = { link = "@punctuation.delimiter" },
            ["@type"] = { link = "Type" },
            ["@type.builtin"] = { link = "@type" },
            ["@type.css"] = { link = "@type" },
            ["@type.qualifier"] = { link = "@type" },
            ["@type.tag.css"] = { link = "@tag" },
            ["@text"] = { link = "Normal" },
            ["@text.emphasis"] = { fg = p.yellow, style = { "italic" } },
            ["@text.literal"] = { fg = p.green },
            ["@text.reference"] = { fg = p.pink },
            ["@text.strong"] = { fg = p.sky, style = { "bold" } },
            ["@text.title"] = { fg = p.blue },
            ["@text.underline"] = { link = "Underlined" },
            ["@text.uri"] = { link = "Underlined" },
            ["@variable"] = { link = "Normal" },
            ["@variable.builtin"] = { fg = p.pink },

            -- WhichKey
            WhichKeyFloat = { link = "Normal" },
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
