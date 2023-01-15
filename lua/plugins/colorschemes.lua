return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppucin",
    opts = {
      flavour = "mocha",
      integrations = {
        mini = true,
        telescope = true,
        which_key = true,
      },
      color_overrides = {
        mocha = {
          base = "#282a36",
          text = "#f8f8f2",
        },
      },
      styles = {
        comments = {},
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
