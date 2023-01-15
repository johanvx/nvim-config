return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      { "]h", "<Cmd>Gitsigns next_hunk<CR>", desc = "Next hunk" },
      { "[h", "<Cmd>Gitsigns prev_hunk<CR>", desc = "Previous hunk" },
    },
    opts = {
      preview_config = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
