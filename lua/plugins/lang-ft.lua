-- This is for specific languages and filetypes.

return {
  -- Markdown
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    ft = "markdown",
    keys = {
      {
        "<LocalLeader>p",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Toggle markdown preview (peek.nvim)",
      },
    },
    opts = {
      theme = "light",
    },
    config = function(_, opts)
      require("peek").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
