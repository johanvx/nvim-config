-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Buffer actions
vim.keymap.set("n", "<Tab>", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<Cmd>bprevious<CR>")
vim.keymap.set("n", "<Leader>bs", "<Cmd>update<CR>", { desc = "Save" })

-- Clear search highlight with <Esc>
vim.keymap.set({ "i", "n" }, "<Esc>", "<Cmd>nohlsearch<CR><Esc>")

-- Cursor movements
vim.keymap.set("", "j", "gj")
vim.keymap.set("", "k", "gk")
vim.keymap.set("", "H", "<Home>")
vim.keymap.set("", "L", "<End>")
vim.keymap.set("!", "<C-j>", "<Down>")
vim.keymap.set("!", "<C-k>", "<Up>")
vim.keymap.set("!", "<C-h>", "<Left>")
vim.keymap.set("!", "<C-l>", "<Right>")

-- Increment / decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Move lines
vim.keymap.set("n", "<M-j>", "<Cmd>move .+1<CR>==")
vim.keymap.set("v", "<M-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("i", "<M-j>", "<Esc>:move .+1<CR>==gi")
vim.keymap.set("n", "<M-k>", "<Cmd>move .-2<CR>==")
vim.keymap.set("v", "<M-k>", ":move '<-2<CR>gv=gv")
vim.keymap.set("i", "<M-k>", "<Esc>:move .-2<CR>==gi")

-- Select All
vim.keymap.set("n", "<C-a>", "ggVG")

-- Shifts
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Quit
vim.keymap.set(
  "n",
  "<Leader>wq",
  "<Cmd>confirm quit<CR>",
  { desc = "Quit current window" }
)
vim.keymap.set(
  "n",
  "<Leader>wa",
  "<Cmd>confirm quitall<CR>",
  { desc = "Quit all windows" }
)

-- Window actions
vim.keymap.set("n", "<Leader>w", "<C-w>")

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
