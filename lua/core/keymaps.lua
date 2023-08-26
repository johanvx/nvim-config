-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Helper functions
local function set(modes, lhs, rhs, desc)
  vim.keymap.set(modes, lhs, rhs, { desc = desc })
end

local function set_lead(modes, keys, rhs, desc)
  set(modes, "<Leader>" .. keys, rhs, desc)
end

local function set_locallead(modes, keys, rhs, desc)
  set(modes, "<LocalLeader>" .. keys, rhs, desc)
end

local function set_toggle(key, opt, tf)
  tf = vim.inspect(tf)
  local rhs = ("<Cmd>lua User.opt.toggle(%q, %s)<CR>"):format(opt, tf)
  set_locallead("n", key, rhs, ("Toggle %s"):format(opt))
end

-- Buffer actions
set_lead("n", "bs", "<Cmd>update<CR>", "Save")
set_lead("n", "bn", "<Cmd>enew<CR>", "New")

-- Cursor movements
set("", "j", "gj")
set("", "k", "gk")
set("!", "<C-j>", "<Down>")
set("!", "<C-k>", "<Up>")
set("!", "<C-h>", "<Left>")
set("!", "<C-l>", "<Right>")

-- Increment/decrement
set("n", "+", "<C-a>")
set("n", "-", "<C-x>")

-- Select all
set("n", "<C-a>", "ggVG")

-- Shifts
set("x", "<", "<gv")
set("x", ">", ">gv")

-- Suspend
set({ "i", "n", "v" }, "<C-s>", "<Cmd>suspend<CR>")

-- System clipboard
set({ "n", "x" }, "<Leader>c", '"+y', "Copy to system clipboard")
set("n", "<Leader>p", '"+p', "Paste from system clipboard")
set("x", "<Leader>p", '"+P', "Paste from system clipboard")

-- Toggle options
set_toggle("b", "background", { "dark", "light" })
set_toggle("C", "cursorcolumn")
set_toggle("c", "cursorline")
set_toggle("h", "hlsearch")
set_toggle("i", "ignorecase")
set_toggle("l", "list")
set_toggle("n", "number")
set_toggle("r", "relativenumber")
set_toggle("s", "spell")
set_toggle("w", "wrap")

-- Type commands quicker
set({ "n", "v" }, ";", ":")

-- Window actions
set({ "", "!" }, "<Up>", "<Cmd>resize +1<CR>", "Increase height")
set({ "", "!" }, "<Down>", "<Cmd>resize -1<CR>", "Decrease height")
set({ "", "!" }, "<Left>", "<Cmd>vertical resize -1<CR>", "Decrease width")
set({ "", "!" }, "<Right>", "<Cmd>vertical resize +1<CR>", "Increase width")
set_lead("n", "wb", "<C-w>b", "Focus bottom")
set_lead("n", "wc", "<C-w>c", "Close")
set_lead("n", "wd", "<C-w>d", "Split + jump to definition")
set_lead("n", "wF", "<C-w>F", "Split + edit file name + jump")
set_lead("n", "wf", "<C-w>f", "Split + edit file name")
set_lead("n", "wH", "<C-w>H", "Move to very left")
set_lead("n", "wh", "<C-w>h", "Focus left")
set_lead("n", "wi", "<C-w>i", "Split + jump to declaration")
set_lead("n", "wJ", "<C-w>J", "Move to very bottom")
set_lead("n", "wj", "<C-w>j", "Focus down")
set_lead("n", "wK", "<C-w>K", "Move to very top")
set_lead("n", "wk", "<C-w>k", "Focus up")
set_lead("n", "wL", "<C-w>L", "Move to very right")
set_lead("n", "wl", "<C-w>l", "Focus right")
set_lead("n", "wn", "<C-w>n", "Open new")
set_lead("n", "wo", "<C-w>o", "Close all but current")
set_lead("n", "wP", "<C-w>P", "Focus preview")
set_lead("n", "wp", "<C-w>p", "Focus last accessed")
set_lead("n", "wq", "<C-w>q", "Quit current")
set_lead("n", "wR", "<C-w>R", "Rotate up/left")
set_lead("n", "wr", "<C-w>r", "Rotate down/right")
set_lead("n", "ws", "<C-w>s", "Split horizontally")
set_lead("n", "wv", "<C-w>v", "Split vertically")
set_lead("n", "wW", "<C-w>W", "Focus previous")
set_lead("n", "ww", "<C-w>w", "Focus next")
set_lead("n", "wx", "<C-w>x", "Exchange windows")
set_lead("n", "wz", "<C-w>z", "Close preview")
set_lead("n", "w=", "<C-w>=", "Make windows same dimensions")

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
