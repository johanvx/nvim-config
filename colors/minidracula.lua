local base16 = require("mini.base16")

local dracula = {
  bg = "#282a36",
  fg = "#f8f8f2",
  selection = "#44475a",
  comment = "#6272a4",
  red = "#ff5555",
  orange = "#ffb86c",
  yellow = "#f1fa8c",
  green = "#50fa7b",
  purple = "#bd93f9",
  cyan = "#8be9fd",
  pink = "#ff79c6",
  none = "NONE",
}

vim.opt.background = "dark"
vim.g.colors_name = "minidracula"
base16.setup({
  palette = {
    -- Default Background
    base00 = dracula.bg,
    -- Lighter Background (Used for status bars, line number and folding marks)
    base01 = dracula.bg,
    -- Selection Background
    base02 = dracula.selection,
    -- Comments, Invisibles, Line Highlighting
    base03 = dracula.comment,
    -- Dark Foreground (Used for status bars)
    base04 = dracula.fg,
    -- Default Foreground, Caret, Delimiters, Operators
    base05 = dracula.fg,
    -- Light Foreground (Not often used)
    base06 = dracula.fg,
    -- Light Background (Not often used)
    base07 = dracula.bg,
    -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base08 = dracula.pink,
    -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base09 = dracula.purple,
    -- Classes, Markup Bold, Search Text Background
    base0A = dracula.cyan,
    -- Strings, Inherited Class, Markup Code, Diff Inserted
    base0B = dracula.yellow,
    -- Support, Regular Expressions, Escape Characters, Markup Quotes
    base0C = dracula.orange,
    -- Functions, Methods, Attribute IDs, Headings
    base0D = dracula.green,
    -- Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0E = dracula.purple,
    -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    base0F = dracula.pink,
  },
})
-- Slight modification
vim.api.nvim_set_hl(
  0,
  "MiniStatuslineModeNormal",
  { fg = dracula.bg, bg = dracula.cyan, bold = true }
)
vim.api.nvim_set_hl(0, "ColorColumn", { bg = dracula.selection })

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
