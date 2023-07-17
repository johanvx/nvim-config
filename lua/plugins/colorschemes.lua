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
        -- Use colors from the default color palette of TailwindCSS
        mocha = {
          rosewater = "#f43f5e", -- rose.500
          flamingo = "#ec4899", -- pink.500
          pink = "#ec4899", -- pink.500
          mauve = "#8b5cf6", -- violet.500
          red = "#ef4444", -- red.500
          maroon = "#f59e0b", -- amber.500
          peach = "#f97316", -- orange.500
          yellow = "#eab308", -- yellow.500
          green = "#10b981", -- emerald.500
          teal = "#10b981", -- emerald.500
          sky = "#06b6d4", -- cyan.500
          sapphire = "#0ea5e9", -- sky.500
          blue = "#3b82f6", -- blue.500
          lavender = "#6366f1", -- indigo.500
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
