return {
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<Leader>r",
        function()
          require("ssr").open()
        end,
        desc = "Structural search and replace (ssr)",
      },
    },
    opts = { border = "none" },
    config = function(_, opts)
      require("ssr").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
