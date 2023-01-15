return {
  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        FIX = { icon = " " },
        TODO = { icon = " " },
        HACK = { icon = " " },
        WARN = { icon = " " },
        PERF = { icon = " " },
        NOTE = { icon = " " },
        TEST = { icon = " " },
      },
      highlight = {
        keyword = "bg",
        pattern = ".*<(KEYWORDS)\\s*",
      },
      search = {
        pattern = "\\b(KEYWORDS)\\b",
      },
    },
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
