return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      { "]h", "<Cmd>Gitsigns next_hunk<CR>", desc = "Next hunk" },
      { "[h", "<Cmd>Gitsigns prev_hunk<CR>", desc = "Previous hunk" },
      { "<Leader>gb", "<Cmd>Gitsigns blame_line<CR>", desc = "Blame line" },
      { "<Leader>gd", "<Cmd>Gitsigns diffthis<CR>", desc = "Diff buffer" },
      { "<Leader>gr", "<Cmd>Gitsigns reset_buffer<CR>", desc = "Reset buffer" },
      { "<Leader>gs", "<Cmd>Gitsigns stage_buffer<CR>", desc = "Stage buffer" },
      { "<Leader>ghr", "<Cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
      { "<Leader>ghs", "<Cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
      {
        "<Leader>ghu",
        "<Cmd>Gitsigns undo_stage_hunk<CR>",
        desc = "Unstage hunk",
      },
      {
        "<Leader>gtb",
        "<Cmd>Gitsigns toggle_current_line_blame<CR>",
        desc = "Line blame",
      },
      {
        "<Leader>gtd",
        "<Cmd>Gitsigns toggle_deleted<CR>",
        desc = "Deleted hunks",
      },
      {
        "<Leader>gtl",
        "<Cmd>Gitsigns toggle_linehl<CR>",
        desc = "Line highlight",
      },
      {
        "<Leader>gtn",
        "<Cmd>Gitsigns toggle_numhl<CR>",
        desc = "Line number highlight",
      },
      {
        "<Leader>gts",
        "<Cmd>Gitsigns toggle_signs<CR>",
        desc = "Sign column highlight",
      },
      {
        "<Leader>gtw",
        "<Cmd>Gitsigns toggle_word_diff<CR>",
        desc = "Word diff",
      },
    },
    opts = {
      numhl = true,
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
