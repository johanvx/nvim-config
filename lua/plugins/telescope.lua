return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  cmd = { "Telescope" },
  keys = {
    {
      "<Leader>e",
      "<Cmd>Telescope file_browser respect_gitignore=false<CR>",
      desc = "File browser (no ignore)",
    },
    {
      "<Leader><Leader>",
      "<Cmd>Telescope file_browser<CR>",
      desc = "File browser",
    },
    { "<Leader>/", "<Cmd>Telescope live_grep<CR>", desc = "Global search" },
    { "<Leader>f<Leader>", "<Cmd>Telescope builtin<CR>", desc = "Builtins" },
    { "<Leader>f'", "<Cmd>Telescope registers<CR>", desc = "Registers" },
    { "<Leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Buffers" },
    { "<Leader>fc", "<Cmd>Telescope commands<CR>", desc = "Commands" },
    { "<Leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
    { "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Files" },
    { "<Leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Help tags" },
    { "<Leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "Keymaps" },
    { "<Leader>fm", "<Cmd>Telescope marks<CR>", desc = "Marks" },
    { "<Leader>fr", "<Cmd>Telescope oldfiles<CR>", desc = "Recent files" },
    { "<Leader>fs", "<Cmd>Telescope colorscheme<CR>", desc = "Colorschemes" },
    { "<Leader>ft", "<Cmd>Telescope treesitter<CR>", desc = "Treesitter" },
    { "<Leader>fw", "<Cmd>Telescope grep_string<CR>", desc = "Word" },
    -- Git
    { "<Leader>fgb", "<Cmd>Telescope git_branches<CR>", desc = "Branches" },
    { "<Leader>fgc", "<Cmd>Telescope git_bcommits<CR>", desc = "Commits (buffer)" },
    { "<Leader>fgC", "<Cmd>Telescope git_commits<CR>", desc = "Commits (directory)" },
    { "<Leader>fgf", "<Cmd>Telescope git_files<CR>", desc = "Files" },
    { "<Leader>fgs", "<Cmd>Telescope git_status<CR>", desc = "Status"},
    { "<Leader>fgS", "<Cmd>Telescope git_stash<CR>", desc = "Stash"},
  },
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      scroll_strategy = "limit",
      layout_strategy = "flex",
      layout_config = {
        flex = { flip_columns = 100 },
        horizontal = {
          prompt_position = "top",
          preview_cutoff = 100,
          preview_width = 0.6,
          height = function(_, max, _)
            return max
          end,
          width = function(_, max, _)
            return max
          end,
        },
        vertical = {
          preview_cutoff = 10,
          preview_height = 0.6,
          height = function(_, max, _)
            return max
          end,
          width = function(_, max, _)
            return max
          end,
        },
      },
      -- Use the sorter provided by mini.fuzzy
      file_sorter = require("mini.fuzzy").get_telescope_sorter,
      generic_sorter = require("mini.fuzzy").get_telescope_sorter,
    },
    winblend = 10,
    path_display = { shorten = { len = 1, exclude = { 1, -2, -1 } } },
    get_status_text = nil,
    dynamic_preview_title = true,
    mappings = {
      i = {
        ["<C-u>"] = false,
      },
    },
    extensions = {
      file_browser = {
        initial_mode = "normal",
        hijack_netrw = true,
        grouped = true,
        mappings = {
          ["i"] = {
            ["<C-w>"] = function()
              vim.cmd("normal vbd")
            end,
          },
          ["n"] = {
            ["/"] = function()
              vim.cmd("startinsert")
            end,
          },
        },
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("file_browser")
  end,
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
