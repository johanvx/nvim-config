return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      select = {
        backend = { "telescope", "nui", "builtin" },
      },
    },
    config = function(_, opts)
      require("dressing").setup(opts)
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require("telescope").load_extension("notify")
        end,
      },
    },
    event = "VeryLazy",
    opts = {
      notify = {
        view = "mini",
      },
      messages = {
        view = "mini",
        view_error = "mini",
        view_warn = "mini",
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
