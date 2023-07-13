return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = {
          enabled = true,
        },
        presets = {
          operators = true,
        },
      },
      window = {
        border = "none",
        padding = { 1, 1, 1, 1 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        align = "center",
      },
    },
    config = function(_, opts)
      local whichkey = require("which-key")

      whichkey.setup(opts)
      whichkey.register({
        ["<Leader>"] = {
          b = { name = "+Buffer" },
          f = {
            name = "+Telescope",
            g = { name = "+Git" },
            l = { name = "+LSP" },
          },
          g = {
            name = "+Gitsigns",
            h = { name = "+Hunk" },
            t = { name = "+Toggle" },
          },
          l = { name = "+LSP" },
          w = { name = "+Window" },
        },
      })
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
