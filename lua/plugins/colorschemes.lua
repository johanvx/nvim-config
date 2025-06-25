return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        colorful_winsep = {
          enabled = true,
          color = "sky",
        },
        cmp = true,
        gitsigns = true,
        mini = {
          enabled = true,
          indentscope_color = "overlay2",
        },
        vimwiki = true,
      },
      color_overrides = {
        -- Use colors from Lettepa
        mocha = {
          -- Main colors
          text = "#bdc0ba", -- Shironezumi
          subtext1 = "#91989F", -- Ginnezumi
          subtext0 = "#91989F", -- Ginnezumi
          overlay2 = "#656765", -- Nibi
          overlay1 = "#656765", -- Nibi
          overlay0 = "#656765", -- Nibi
          surface2 = "#0F2540", -- Kon
          surface1 = "#0F2540", -- Kon
          surface0 = "#0F2540", -- Kon
          base = "#08192D", -- Kachi
          mantle = "#08192D", -- Kachi
          crust = "#08192D", -- Kachi
          -- Accent colors
          -- Red
          red = "#DB4D6D", -- Nakabeni
          rosewater = "#DB4D6D", -- Nakabeni
          -- Green
          green = "#66BAB7", -- Mizuasagi
          teal = "#66BAB7", -- Mizuasagi
          -- Blue
          blue = "#2EA9DF", -- Tsuyukusa
          mauve = "#2EA9DF", -- Tsuyukusa
          lavender = "#2EA9DF", -- Tsuyukusa
          -- Cyan
          sky = "#7DB9DE", -- Wasurenagusa
          sapphire = "#7DB9DE", -- Wasurenagusa
          -- Magenta (Pink)
          pink = "#F596AA", -- Mono
          flamingo = "#F596AA", -- Mono
          -- Yellow
          yellow = "#F7C242", -- Hanaba
          maroon = "#F7C242", -- Hanaba
          peach = "#F7C242", -- Hanaba
        },
        latte = {
          -- Main colors
          text = "#0F2540", -- Kon
          subtext1 = "#434343", -- Keshizumi
          subtext0 = "#434343", -- Keshizumi
          overlay2 = "#828282", -- Hai
          overlay1 = "#828282", -- Hai
          overlay0 = "#828282", -- Hai
          surface2 = "#BDC0BA", -- Shironezumi
          surface1 = "#BDC0BA", -- Shironezumi
          surface0 = "#BDC0BA", -- Shironezumi
          base = "#FCFAF2", -- Shironeri
          mantle = "#FCFAF2", -- Shironeri
          crust = "#FCFAF2", -- Shironeri
          -- Accent colors
          -- Red
          red = "#CB1B45", -- Kurenai
          rosewater = "#CB1B45", -- Kurenai
          -- Green
          green = "#268785", -- Seiheki
          teal = "#268785", -- Seiheki
          -- Blue
          blue = "#005CAF", -- Ruri
          mauve = "#005CAF", -- Ruri
          lavender = "#005CAF", -- Ruri
          -- Cyan
          sky = "#3A8FB7", -- Chigusa
          sapphire = "#3A8FB7", -- Chigusa
          -- Magenta (Pink)
          pink = "#E03C8A", -- Tsutsuji
          flamingo = "#E03C8A", -- Tsutsuji
          -- Yellow
          yellow = "#96632E", -- Chojicha
          maroon = "#96632E", -- Chojicha
          peach = "#96632E", -- Chojicha
        },
      },
      highlight_overrides = {
        all = function(p)
          return {
            -- Builtins
            NormalFloat = { fg = p.text, bg = p.surface0 },
            -- If you prefer grey-scale comment, consider p.overlay0
            Comment = { fg = p.yellow },
            Character = { fg = p.red },
            String = { fg = p.blue },
            Constant = { link = "String" },
            Boolean = { link = "Constant" },
            Number = { link = "Constant" },
            Float = { link = "Constant" },
            Identifier = { fg = p.green },
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
            SpecialComment = { link = "Special" },
            Debug = { link = "Special" },
            Underlined = { fg = p.sky, style = { "underline" } },
            Ignore = { fg = p.overlay0 },
            Conceal = { fg = p.overlay0 }, -- Same as Ignore
            NonText = { fg = p.overlay0 }, -- Same as Ignore
            EndOfBuffer = { fg = p.overlay0 }, -- Same as Ignore
            Whitespace = { fg = p.overlay0 }, -- Same as Ignore
            VertSplit = { fg = p.overlay0 }, -- Same as Ignore
            WinSeparator = { fg = p.overlay0 }, -- Same as Ignore
            LineNr = { fg = p.overlay0 }, -- Same as Ignore
            CursorLineNr = { fg = p.subtext0 }, -- The most contrast
            Error = { fg = p.red },
            Todo = { fg = p.sky },
            CursorLine = { bg = p.surface0 },
            ColorColumn = { link = "CursorLine" },
            FloatBorder = { fg = p.overlay0, bg = p.surface0 },
            MsgArea = { bg = p.base },
            StatusLine = { fg = p.text, bg = p.surface0 },
            StatusLineNC = { fg = p.subtext0, bg = p.surface0 },
            CurSearch = { link = "IncSearch" },
            Pmenu = { fg = p.text, bg = p.surface0 },
            PmenuKind = { fg = p.text, bg = p.surface0 },
            PmenuExtra = { fg = p.text, bg = p.surface0 },
            PmenuSel = { fg = p.surface0, bg = p.text, style = {} },
            PmenuKindSel = { fg = p.surface0, bg = p.text },
            PmenuExtraSel = { fg = p.surface0, bg = p.text },

            -- Cmp, used to highlight blink.cmp
            CmpItemAbbr = { fg = p.text },
            CmpItemAbbrDefault = { fg = p.text },
            CmpItemAbbrDeprecated = { fg = p.red },
            CmpItemAbbrDeprecatedDefault = { fg = p.red },
            CmpItemAbbrMatch = { fg = p.cyan },
            CmpItemAbbrMatchDefault = { fg = p.cyan },
            CmpItemAbbrMatchFuzzy = { fg = p.cyan },
            CmpItemAbbrMatchFuzzyDefault = { fg = p.cyan },

            -- LSP
            LspInlayHint = { fg = p.overlay0 }, -- Same as Ignore
            ["@lsp.mod.documentation"] = { fg = p.red },
            ["@lsp.typemod.comment.documentation"] = { fg = p.red },

            -- Mini
            MiniFilesCursorLine = { style = { "reverse" } },
            MiniHipatternsFixme = { fg = p.red, bg = p.surface0 },
            MiniHipatternsHack = { fg = p.pink, bg = p.surface0 },
            MiniHipatternsTodo = { fg = p.sky, bg = p.surface0 },
            MiniHipatternsNote = { fg = p.sky, bg = p.surface0 },
            MiniPickPrompt = { fg = p.sky, bg = p.surface0 },
            MiniPickBorderText = { fg = p.overlay0, bg = p.surface0 },
            MiniPickMatchCurrent = { style = { "reverse" } },
            MiniStatuslineInactive = { fg = p.overlay0, bg = p.surface0 },
            MiniTablineCurrent = { fg = p.text, bg = p.base, style = {} },
            MiniTablineFill = { bg = p.surface0 },
            MiniTablineHidden = { fg = p.overlay0, bg = p.surface0 },
            MiniTablineVisible = { fg = p.overlay0, bg = p.base },

            -- Treesitter
            ["@comment.documentation"] = { fg = p.red },
            ["@constant"] = { link = "Constant" },
            ["@constant.builtin"] = { link = "Constant" },
            ["@constructor"] = { link = "Type" },
            ["@field"] = { fg = p.text },
            ["@function.builtin"] = { link = "Function" },
            ["@function.macro"] = { link = "Macro" },
            ["@keyword"] = { link = "Keyword" },
            ["@keyword.function"] = { link = "Keyword" },
            ["@keyword.operator"] = { link = "Operator" },
            ["@keyword.return"] = { link = "Operator" },
            ["@label"] = { link = "Label" },
            ["@label.json"] = { link = "Label" },
            ["@namespace"] = { link = "Identifier" },
            ["@number"] = { link = "Number" },
            ["@number.css"] = { link = "Number" },
            ["@parameter"] = { fg = p.text },
            ["@parameter.reference"] = { fg = p.text },
            ["@property"] = { fg = p.text },
            ["@property.class.css"] = { link = "Type" },
            ["@property.css"] = { fg = p.text },
            ["@property.id.css"] = { fg = p.text },
            ["@property.toml"] = { fg = p.text },
            ["@punctuation.bracket"] = { link = "Ignore" },
            ["@punctuation.delimiter"] = { link = "Ignore" },
            ["@punctuation.special"] = { link = "SpecialChar" },
            ["@string"] = { link = "String" },
            ["@string.escape"] = { link = "Identifier" },
            ["@string.plain.css"] = { link = "String" },
            ["@string.regex"] = { link = "SpecialChar" },
            ["@string.special"] = { link = "SpecialChar" },
            ["@symbol"] = { link = "Type" },
            ["@tag"] = { link = "Tag" },
            ["@tag.attribute"] = { link = "@property" },
            ["@tag.delimiter"] = { link = "@punctuation.delimiter" },
            ["@text"] = { fg = p.text },
            ["@text.emphasis"] = { fg = p.yellow, style = { "italic" } },
            ["@text.literal"] = { fg = p.green },
            ["@text.note"] = { link = "MiniHipatternsNote" },
            ["@text.reference"] = { fg = p.pink },
            ["@text.strong"] = { fg = p.sky, style = { "bold" } },
            ["@text.title"] = { fg = p.sky },
            ["@text.todo"] = { link = "MiniHipatternsTodo" },
            ["@text.underline"] = { link = "Underlined" },
            ["@text.uri"] = { link = "Underlined" },
            ["@type"] = { link = "Type" },
            ["@type.builtin"] = { link = "Type" },
            ["@type.builtin.c"] = { link = "Type" },
            ["@type.builtin.cpp"] = { link = "Type" },
            ["@type.css"] = { link = "Type" },
            ["@type.qualifier"] = { link = "Type" },
            ["@type.tag.css"] = { link = "Tag" },
            ["@variable"] = { fg = p.text },
            ["@variable.builtin"] = { link = "Type" },
            ["@variable.member"] = { fg = p.text },
            ["@variable.parameter"] = { fg = p.text },
            ["@variable.parameter.builtin"] = { link = "Type" },
          }
        end,
      },
      styles = {
        comments = {},
        conditionals = {},
      },
    },
  },
  {
    "wincent/base16-nvim",
    enabled = false,
    lazy = false, -- load at start
    priority = 1000, -- load first
    config = function()
      vim.cmd("colorscheme gruvbox-dark-hard")
      vim.o.background = "dark"
      -- Make comments more prominent -- they are important.
      local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
      vim.api.nvim_set_hl(0, "Comment", bools)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
