return {
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<Leader>t",
        "<Cmd>TroubleToggle<CR>",
        desc = "Trouble",
      },
    },
    config = function(_, opts)
      require("trouble").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
