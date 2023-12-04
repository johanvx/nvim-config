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
        mini = {
          enabled = true,
          indentscope_color = "surface2",
        },
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
        vimwiki = true,
      },
      color_overrides = {
        -- Use colors from the default color palette of TailwindCSS
        mocha = {
          rosewater = "#f43f5e", -- rose.500
          flamingo = "#f472b6", -- pink.400
          pink = "#f472b6", -- pink.400
          mauve = "#818cf8", -- indigo.400
          red = "#f43f5e", -- rose.500
          maroon = "#fcd34d", -- amber.300
          peach = "#fcd34d", -- amber.300
          yellow = "#fcd34d", -- amber.300
          green = "#2dd4bf", -- teal.400
          teal = "#2dd4bf", -- teal.400
          sky = "#38bdf8", -- sky.400
          sapphire = "#38bdf8", -- sky.400
          blue = "#818cf8", -- indigo.400
          lavender = "#818cf8", -- indigo.400
          text = "#f8fafc", -- slate.50
          subtext1 = "#f1f5f9", -- slate.100
          subtext0 = "#e2e8f0", -- slate.200
          overlay2 = "#cbd5e1", -- slate.300
          overlay1 = "#94a3b8", -- slate.400
          overlay0 = "#64748b", -- slate.500
          surface2 = "#475569", -- slate.600
          surface1 = "#334155", -- slate.700
          surface0 = "#1e293b", -- slate.800
          base = "#0f172a", -- slate.900
          mantle = "#020617", -- slate.950
          crust = "#020617", -- slate.950
        },
      },
      highlight_overrides = {
        mocha = function(p)
          return {
            -- Builtins
            NormalFloat = { fg = p.text, bg = p.surface0 },
            Comment = { fg = p.blue },
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
            Ignore = { fg = p.surface2 },
            Error = { fg = p.red },
            Todo = { fg = p.sky },
            CursorLine = { bg = p.surface1 },
            FloatBorder = { fg = p.surface1, bg = p.surface0 },
            MsgArea = { bg = p.base },
            StatusLine = { fg = p.text, bg = p.surface0 },
            StatusLineNC = { link = "Comment" },
            VertSplit = { fg = p.surface1 },
            LineNr = { fg = p.surface2 },
            CurSearch = { link = "IncSearch" },

            -- LSP
            LspInlayHint = { fg = p.surface2, bg = p.none },

            -- Mini
            MiniStatuslineInactive = { bg = p.base },
            MiniTablineCurrent = { fg = p.text, bg = p.base, style = {} },
            MiniTablineFill = { bg = p.surface0 },
            MiniTablineHidden = { fg = p.overlay0, bg = p.surface0 },
            MiniTablineVisible = { fg = p.overlay1, bg = p.base },

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
            ["@parameter"] = { fg = p.text },
            ["@parameter.reference"] = { fg = p.text },
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
            ["@text"] = { fg = p.text },
            ["@text.emphasis"] = { fg = p.yellow, style = { "italic" } },
            ["@text.literal"] = { fg = p.green },
            ["@text.reference"] = { fg = p.pink },
            ["@text.strong"] = { fg = p.sky, style = { "bold" } },
            ["@text.title"] = { fg = p.sky },
            ["@text.todo"] = { link = "MiniHipatternsTodo" },
            ["@text.note"] = { link = "MiniHipatternsNote" },
            ["@text.underline"] = { link = "Underlined" },
            ["@text.uri"] = { link = "Underlined" },
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
