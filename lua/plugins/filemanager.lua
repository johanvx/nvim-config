return {
  {
    "is0n/fm-nvim",
    keys = {
      {
        "<Leader><Leader>",
        "<Cmd>Xplr<CR>",
        desc = "File manager (xplr)",
      },
    },
    opts = {
      float = {
        blend = 20,
        height = 1,
        width = 1,
      },
    },
    config = function(_, opts)
      require("fm-nvim").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
