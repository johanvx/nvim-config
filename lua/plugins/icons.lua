return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
