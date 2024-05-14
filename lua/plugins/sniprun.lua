return {
  {
    "michaelb/sniprun",
    build = "sh ./install.sh",
    keys = {
      { "<Leader>r", "<Plug>SnipRunOperator", desc = "SnipRunOperator" },
      { "<Leader>r", ":SnipRun<CR>", mode = "v", desc = "SnipRun" },
    },
    opts = {},
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
