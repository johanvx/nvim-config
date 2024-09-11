-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Helper functions
local function set(modes, lhs, rhs, desc, remap, silent)
  vim.keymap.set(
    modes,
    lhs,
    rhs,
    { desc = desc, remap = not not remap, silent = not not silent }
  )
end

local function set_lead(modes, keys, rhs, desc, remap, silent)
  set(modes, "<Leader>" .. keys, rhs, desc, remap, silent)
end

local function set_locallead(modes, keys, rhs, desc, remap, silent)
  set(modes, "<LocalLeader>" .. keys, rhs, desc, remap, silent)
end

-- Cursor movements
set("", "j", "gj")
set("", "k", "gk")
set("", "H", "^", "", true)
set("", "L", "$", "", true)
-- Some Emacs stuff (or similar)
set("!", "<C-n>", "<Down>")
set("!", "<C-p>", "<Up>")
set("!", "<C-b>", "<Left>")
set("!", "<C-f>", "<Right>")
set("!", "<C-a>", "<Home>")
set("!", "<C-e>", "<End>")
set("!", "<C-h>", "<BS>")
set("!", "<C-d>", "<Del>")
-- Delete shift width at the start of the line (paired with <C-t>)
set("i", "<C-y>", "<C-d>")

-- Increment/decrement
set("n", "+", "<C-a>")
set("n", "-", "<C-x>")

-- Place search results at the center
set("n", "n", "nzz", "", false, true)
set("n", "N", "Nzz", "", false, true)
set("n", "*", "*zz", "", false, true)
set("n", "#", "#zz", "", false, true)
set("n", "g*", "g*zz", "", false, true)

-- Select all
set("n", "<C-a>", "ggVG")

-- Shifts
set("x", "<", "<gv")
set("x", ">", ">gv")

-- Suspend
set({ "i", "n", "v" }, "<C-s>", "<Cmd>suspend<CR>")

-- System clipboard
set_lead({ "n", "x" }, "y", '"+y', "Copy to system clipboard")
set_lead("n", "p", '"+p', "Paste from system clipboard")
set_lead("x", "p", '"+P', "Paste from system clipboard")

-- Toggle
set_locallead("n", "d", "<Cmd>set diff! <Bar> set diff?<CR>", "Diff")
set_locallead(
  "n",
  "s",
  "<Cmd>set scrollbind! <Bar> set scrollbind?<CR>",
  "Scroll binding"
)

-- Type commands quicker
set({ "n", "v" }, ";", ":")

-- Use "very magic" (less escaping needed) regexes by default
set("n", "?", "?\\v")
set("n", "/", "/\\v")

-- Window actions
set({ "", "!" }, "<Up>", "<Cmd>resize +1<CR>", "Increase height")
set({ "", "!" }, "<Down>", "<Cmd>resize -1<CR>", "Decrease height")
set({ "", "!" }, "<Left>", "<Cmd>vertical resize -1<CR>", "Decrease width")
set({ "", "!" }, "<Right>", "<Cmd>vertical resize +1<CR>", "Increase width")

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
