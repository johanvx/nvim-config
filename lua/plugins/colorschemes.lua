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
          indentscope_color = "overlay0",
        },
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
        vimwiki = true,
      },
      color_overrides = {
        -- Use colors from the default color palette of TailwindCSS
        --
        -- Use only 6 color names:
        -- red, green, blue, sapphire, pink and yellow
        mocha = {
          rosewater = "#ED5A65", -- Nakabeni
          flamingo = "#FD67B8", -- brTsutsuji
          pink = "#FD67B8", -- brTsutsuji
          mauve = "#37B4FD", -- brRuri
          red = "#ED5A65", -- rose.500, pick
          maroon = "#F9BF45", -- Tamako
          peach = "#F9BF45", -- Tamako
          yellow = "#F9BF45", -- Tamako
          green = "#47D2BC", -- brAomidori
          teal = "#47D2BC", -- brAomidori
          sky = "#71DCEA", -- brChigusa
          sapphire = "#71DCEA", -- brChigusa
          blue = "#37B4FD", -- brRuri
          lavender = "#37B4FD", -- brRuri
          text = "#DBEBF5", -- white
          subtext1 = "#8FA0AC", -- brgrey
          subtext0 = "#8FA0AC", -- brgrey
          overlay2 = "#778998", -- grey
          overlay1 = "#778998", -- grey
          overlay0 = "#5C7186", -- dimgrey
          surface2 = "#5C7186", -- dimgrey
          surface1 = "#1B2F45", -- brblack
          surface0 = "#1B2F45", -- brblack
          base = "#08192D", -- black, Kachi
          mantle = "#08192D", -- black, Kachi
          crust = "#08192D", -- black, Kachi
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
          text = "#1B2F45", -- brblack
          subtext1 = "#5C7186", -- dimgrey
          subtext0 = "#5C7186", -- dimgrey
          overlay2 = "#778998", -- grey
          overlay1 = "#778998", -- grey
          overlay0 = "#8FA0AC", -- brgrey
          surface2 = "#8FA0AC", -- brgrey
          surface1 = "#DBEBF5", -- white
          surface0 = "#DBEBF5", -- white
          base = "#E5F2F9", -- brwhite
          mantle = "#E5F2F9", -- brwhite
          crust = "#E5F2F9", -- brwhite
        },
      },
      highlight_overrides = {
        all = function(p)
          return {
            -- Builtins
            NormalFloat = { fg = p.text, bg = p.surface0 },
            -- If you prefer grey-scale comment, consider p.overlay1 (slate.400)
            Comment = { fg = p.yellow },
            Character = { fg = p.red },
            String = { fg = p.blue },
            Constant = { fg = p.yellow },
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
            CursorLine = { bg = p.surface1 },
            ColorColumn = { link = "CursorLine" },
            FloatBorder = { fg = p.surface1, bg = p.surface0 },
            MsgArea = { bg = p.base },
            StatusLine = { fg = p.text, bg = p.surface1 },
            StatusLineNC = { fg = p.subtext1, bg = p.surface0 },
            CurSearch = { link = "IncSearch" },

            -- Gitsigns
            GitSignsCurrentLineBlame = { fg = p.overlay0 }, -- Same as Ignore

            -- LSP
            LspInlayHint = { fg = p.overlay0 }, -- Same as Ignore

            -- Mini
            MiniHipatternsFixme = { fg = p.red, bg = p.surface1 },
            MiniHipatternsHack = { fg = p.pink, bg = p.surface1 },
            MiniHipatternsTodo = { fg = p.sapphire, bg = p.surface1 },
            MiniHipatternsNote = { fg = p.sapphire, bg = p.surface1 },
            MiniPickPrompt = { fg = p.sapphire, bg = p.surface0 },
            MiniPickBorderText = { fg = p.overlay0, bg = p.surface0 },
            MiniStatuslineInactive = { fg = p.overlay0, bg = p.surface0 },
            MiniTablineCurrent = { fg = p.text, bg = p.base, style = {} },
            MiniTablineFill = { bg = p.surface0 },
            MiniTablineHidden = { fg = p.overlay0, bg = p.surface0 },
            MiniTablineVisible = { fg = p.overlay1, bg = p.base },

            -- Treesitter
            ["@comment.documentation"] = { fg = p.green },
            ["@constant"] = { link = "Constant" },
            ["@constant.builtin"] = { link = "Constant" },
            ["@constructor"] = { link = "Type" },
            ["@field"] = { link = "Normal" },
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
            ["@property"] = { link = "Normal" },
            ["@property.css"] = { link = "Normal" },
            ["@property.class.css"] = { link = "Type" },
            ["@property.id.css"] = { link = "Normal" },
            ["@property.toml"] = { link = "Normal" },
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
            ["@type"] = { link = "Type" },
            ["@type.builtin"] = { link = "Type" },
            ["@type.builtin.c"] = { link = "Type" },
            ["@type.builtin.cpp"] = { link = "Type" },
            ["@type.css"] = { link = "Type" },
            ["@type.qualifier"] = { link = "Type" },
            ["@type.tag.css"] = { link = "Tag" },
            ["@text"] = { link = "Normal" },
            ["@text.emphasis"] = { fg = p.yellow, style = { "italic" } },
            ["@text.literal"] = { fg = p.green },
            ["@text.reference"] = { fg = p.pink },
            ["@text.strong"] = { fg = p.sapphire, style = { "bold" } },
            ["@text.title"] = { fg = p.sapphire },
            ["@text.todo"] = { link = "MiniHipatternsTodo" },
            ["@text.note"] = { link = "MiniHipatternsNote" },
            ["@text.underline"] = { link = "Underlined" },
            ["@text.uri"] = { link = "Underlined" },
            ["@variable"] = { link = "Normal" },
            ["@variable.parameter"] = { link = "Normal" },
            ["@variable.builtin"] = { link = "String" },
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
