-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Buffer actions
vim.keymap.set("n", "<Leader>bs", "<Cmd>update<CR>", { desc = "Save" })
vim.keymap.set("n", "<Leader>bn", "<Cmd>enew<CR>", { desc = "New" })

-- Clear search highlight with <Esc>
vim.keymap.set({ "i", "n" }, "<Esc>", "<Cmd>nohlsearch<CR><Esc>")

-- Cursor movements
vim.keymap.set("", "j", "gj")
vim.keymap.set("", "k", "gk")
vim.keymap.set("!", "<C-j>", "<Down>")
vim.keymap.set("!", "<C-k>", "<Up>")
vim.keymap.set("!", "<C-h>", "<Left>")
vim.keymap.set("!", "<C-l>", "<Right>")

-- Increment / decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Select All
vim.keymap.set("n", "<C-a>", "ggVG")

-- Shifts
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Toggle options
vim.keymap.set(
  "n",
  "<LocalLeader>s",
  "<Cmd>lua User.opt.toggle('spell')<CR>",
  { desc = "Toggle spell" }
)
vim.keymap.set(
  "n",
  "<LocalLeader>w",
  "<Cmd>lua User.opt.toggle('wrap')<CR>",
  { desc = "Toggle wrap" }
)
vim.keymap.set(
  "n",
  "<LocalLeader>r",
  "<Cmd>lua User.opt.toggle('relativenumber')<CR>",
  { desc = "Toggle relativenumber" }
)

-- Window actions
vim.keymap.set("n", "<Leader>w", "<C-w>")
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
vim.keymap.set(
  { "", "!" },
  "<Up>",
  "<Cmd>resize +1<CR>",
  { desc = "Increase window height" }
)
vim.keymap.set(
  { "", "!" },
  "<Down>",
  "<Cmd>resize -1<CR>",
  { desc = "Decrease window height" }
)
vim.keymap.set(
  { "", "!" },
  "<Left>",
  "<Cmd>vertical resize -1<CR>",
  { desc = "Decrease window width" }
)
vim.keymap.set(
  { "", "!" },
  "<Right>",
  "<Cmd>vertical resize +1<CR>",
  { desc = "Increase window width" }
)

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
