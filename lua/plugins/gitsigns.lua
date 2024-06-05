return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = false,
    event = "VeryLazy",
    keys = {
      { "]h", "<Cmd>Gitsigns next_hunk<CR>", desc = "Next hunk" },
      { "[h", "<Cmd>Gitsigns prev_hunk<CR>", desc = "Previous hunk" },
      { "<Leader>gb", "<Cmd>Gitsigns blame_line<CR>", desc = "Blame line" },
      { "<Leader>gd", "<Cmd>Gitsigns diffthis<CR>", desc = "Diff buffer" },
      {
        "<Leader>ghp",
        "<Cmd>Gitsigns preview_hunk_inline<CR>",
        desc = "Preview hunk inline",
      },
      { "<Leader>ghr", "<Cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
      { "<Leader>ghs", "<Cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
      {
        "<Leader>ghu",
        "<Cmd>Gitsigns undo_stage_hunk<CR>",
        desc = "Unstage hunk",
      },
      { "<Leader>gr", "<Cmd>Gitsigns reset_buffer<CR>", desc = "Reset buffer" },
      { "<Leader>gs", "<Cmd>Gitsigns stage_buffer<CR>", desc = "Stage buffer" },
      {
        "<Leader>tgb",
        "<Cmd>Gitsigns toggle_current_line_blame<CR>",
        desc = "Line blame",
      },
      {
        "<Leader>tgd",
        "<Cmd>Gitsigns toggle_deleted<CR>",
        desc = "Deleted hunks",
      },
      {
        "<Leader>tgl",
        "<Cmd>Gitsigns toggle_linehl<CR>",
        desc = "Line highlight",
      },
      {
        "<Leader>tgn",
        "<Cmd>Gitsigns toggle_numhl<CR>",
        desc = "Line number highlight",
      },
      {
        "<Leader>tgs",
        "<Cmd>Gitsigns toggle_signs<CR>",
        desc = "Sign column highlight",
      },
      {
        "<Leader>tgw",
        "<Cmd>Gitsigns toggle_word_diff<CR>",
        desc = "Word diff",
      },
      {
        "ih",
        ":<C-U>Gitsigns select_hunk<CR>",
        mode = { "o", "x" },
        desc = "Select hunk",
      },
    },
    opts = {
      current_line_blame = true,
      numhl = true,
      preview_config = {
        border = "none",
      },
    },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
