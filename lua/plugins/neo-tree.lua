return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<Leader><Leader>",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = vim.loop.cwd(),
          })
        end,
        desc = "File browser (neo-tree)",
      },
    },
    opts = {
      window = {
        mappings = {
          ["<Space>"] = "none",
        },
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
    },
    config = function(_, opts)
      vim.g.neo_tree_remove_legacy_commands = 1
      require("neo-tree").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
