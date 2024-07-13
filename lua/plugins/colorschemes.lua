return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        barbecue = {
          dim_dirname = false,
          bold_basename = true,
          dim_context = false,
          alt_background = false,
        },
        colorful_winsep = {
          enabled = true,
          color = "sapphire",
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
          rosewater = "#ED5A65", -- Nakabeni
          flamingo = "#FD67B8", -- brTsutsuji
          pink = "#FD67B8", -- brTsutsuji
          mauve = "#37B4FD", -- brRuri
          red = "#ED5A65", -- Nakabeni
          maroon = "#F9BF45", -- Tamako
          peach = "#F9BF45", -- Tamako
          yellow = "#F9BF45", -- Tamako
          green = "#47D2BC", -- brAomidori
          teal = "#47D2BC", -- brAomidori
          sky = "#71DCEA", -- brChigusa
          sapphire = "#71DCEA", -- brChigusa
          blue = "#37B4FD", -- brRuri
          lavender = "#37B4FD", -- brRuri
          text = "#CCE0EC", -- White
          subtext1 = "#83A2B7", -- brGrey
          subtext0 = "#83A2B7", -- brGrey
          overlay2 = "#728A9E", -- Grey
          overlay1 = "#728A9E", -- Grey
          overlay0 = "#728A9E", -- Grey
          surface2 = "#24384F", -- brBlack
          surface1 = "#24384F", -- brBlack
          surface0 = "#24384F", -- brBlack
          base = "#08192D", -- Black, Kachi
          mantle = "#08192D", -- Black, Kachi
          crust = "#08192D", -- Black, Kachi
        },
        latte = {
          rosewater = "#CB1B45", -- kurenai
          flamingo = "#E03C8A", -- Tsutsuji
          pink = "#E03C8A", -- Tsutsuji
          mauve = "#005CAF", -- Ruri
          red = "#CB1B45", -- kurenai
          maroon = "#CA7A2C", -- Kohaku
          peach = "#CA7A2C", -- Kohaku
          yellow = "#CA7A2C", -- Kohaku
          green = "#00AA90", -- Aomidori
          teal = "#00AA90", -- Aomidori
          sky = "#3A8FB7", -- Chigusa
          sapphire = "#3A8FB7", -- Chigusa
          blue = "#005CAF", -- Ruri
          lavender = "#005CAF", -- Ruri
          text = "#24384F", -- brBlack
          subtext1 = "#5C7186", -- dimGrey
          subtext0 = "#5C7186", -- dimGrey
          overlay2 = "#728A9E", -- Grey
          overlay1 = "#728A9E", -- Grey
          overlay0 = "#728A9E", -- Grey
          surface2 = "#CCE0EC", -- White
          surface1 = "#CCE0EC", -- White
          surface0 = "#CCE0EC", -- White
          base = "#DFF3FF", -- brWhite
          mantle = "#DFF3FF", -- brWhite
          crust = "#DFF3FF", -- brWhite
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
            Type = { fg = p.sapphire },
            StorageClass = { link = "Type" },
            Structure = { link = "Type" },
            Typedef = { link = "Type" },
            Special = { fg = p.pink },
            SpecialChar = { link = "Special" },
            Tag = { link = "Special" },
            SpecialComment = { link = "Special" },
            Debug = { link = "Special" },
            Underlined = { fg = p.sapphire, style = { "underline" } },
            Ignore = { fg = p.overlay0 },
            Conceal = { fg = p.overlay0 }, -- Same as Ignore
            NonText = { fg = p.overlay0 }, -- Same as Ignore
            EndOfBuffer = { fg = p.overlay0 }, -- Same as Ignore
            Whitespace = { fg = p.overlay0 }, -- Same as Ignore
            VertSplit = { fg = p.overlay0 }, -- Same as Ignore
            WinSeparator = { fg = p.overlay0 }, -- Same as Ignore
            LineNr = { fg = p.overlay0 }, -- Same as Ignore
            CursorLineNr = { fg = p.subtext1 }, -- The most contrast
            Error = { fg = p.red },
            Todo = { fg = p.sapphire },
            CursorLine = { bg = p.surface0 },
            ColorColumn = { link = "CursorLine" },
            FloatBorder = { fg = p.overlay0, bg = p.surface0 },
            MsgArea = { bg = p.base },
            StatusLine = { fg = p.text, bg = p.surface0 },
            StatusLineNC = { fg = p.subtext1, bg = p.surface0 },
            CurSearch = { link = "IncSearch" },
            Pmenu = { fg = p.text, bg = p.surface0 },
            PmenuKind = { fg = p.text, bg = p.surface0 },
            PmenuExtra = { fg = p.text, bg = p.surface0 },
            PmenuSel = { fg = p.surface0, bg = p.text, style = {} },
            PmenuKindSel = { fg = p.surface0, bg = p.text },
            PmenuExtraSel = { fg = p.surface0, bg = p.text },

            -- Cmp
            CmpItemAbbr = { fg = p.text },
            CmpItemAbbrDefault = { fg = p.text },
            CmpItemAbbrDeprecated = { fg = p.red },
            CmpItemAbbrDeprecatedDefault = { fg = p.red },
            CmpItemAbbrMatch = { fg = p.cyan },
            CmpItemAbbrMatchDefault = { fg = p.cyan },
            CmpItemAbbrMatchFuzzy = { fg = p.cyan },
            CmpItemAbbrMatchFuzzyDefault = { fg = p.cyan },

            -- Gitsigns
            GitSignsCurrentLineBlame = { fg = p.overlay0 }, -- Same as Ignore

            -- LSP
            LspInlayHint = { fg = p.overlay0 }, -- Same as Ignore

            -- Mini
            MiniFilesCursorLine = { style = { "reverse" } },
            MiniHipatternsFixme = { fg = p.red, bg = p.surface0 },
            MiniHipatternsHack = { fg = p.pink, bg = p.surface0 },
            MiniHipatternsTodo = { fg = p.sapphire, bg = p.surface0 },
            MiniHipatternsNote = { fg = p.sapphire, bg = p.surface0 },
            MiniPickPrompt = { fg = p.sapphire, bg = p.surface0 },
            MiniPickBorderText = { fg = p.overlay0, bg = p.surface0 },
            MiniPickMatchCurrent = { style = { "reverse" } },
            MiniStatuslineInactive = { fg = p.overlay0, bg = p.surface0 },
            MiniTablineCurrent = { fg = p.text, bg = p.base, style = {} },
            MiniTablineFill = { bg = p.surface0 },
            MiniTablineHidden = { fg = p.overlay0, bg = p.surface0 },
            MiniTablineVisible = { fg = p.overlay0, bg = p.base },

            -- Treesitter
            ["@comment.documentation"] = { fg = p.green },
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
            ["@text.strong"] = { fg = p.sapphire, style = { "bold" } },
            ["@text.title"] = { fg = p.sapphire },
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
    lazy = false, -- load at start
    priority = 1000, -- load first
    config = function()
      vim.cmd("colorscheme base16-gruvbox-dark-hard")
      -- vim.cmd("colorscheme base16-solarized-dark")
      vim.o.background = "dark"
      -- Make comments more prominent -- they are important.
      local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
      vim.api.nvim_set_hl(0, "Comment", bools)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
