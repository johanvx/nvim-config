return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      { "-", "<Cmd>Oil<CR>", desc = "Browse (Oil)" },
    },
    opts = {
      columns = { "permissions", "size", "mtime" },
    },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
