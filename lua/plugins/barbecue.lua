return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- prevent barbecue from automatically attaching nvim-navic
      attach_navic = false,
    },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
