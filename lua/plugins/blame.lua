return {
  {
    "FabijanZulj/blame.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<LocalLeader>-",
        "<Cmd>BlameToggle virtual<CR>",
        desc = "Toggle blame virtual",
      },
      {
        "<LocalLeader>=",
        "<Cmd>BlameToggle window<CR>",
        desc = "Toggle blame window",
      },
    },
    opts = {},
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
