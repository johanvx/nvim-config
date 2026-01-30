return {
  {
    "nvim-mini/mini.ai",
    dependencies = { "nvim-mini/mini.extra" },
    event = "VeryLazy",
    opts = function()
      local gen_ai_spec = require("mini.extra").gen_ai_spec
      return {
        custom_textobjects = {
          B = gen_ai_spec.buffer(),
          D = gen_ai_spec.diagnostic(),
          I = gen_ai_spec.indent(),
          L = gen_ai_spec.line(),
          N = gen_ai_spec.number(),
        },
      }
    end,
  },
  {
    "nvim-mini/mini.align",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.bracketed",
    event = "VeryLazy",
    opts = {
      comment = { suffix = "e" },
    },
  },
  {
    "nvim-mini/mini.clue",
    opts = function()
      local clue = require("mini.clue")

      return {
        clues = {
          {
            { mode = "n", keys = "<Leader><Leader>", desc = "+Toggle" },
            { mode = "n", keys = "<LocalLeader><Leader>", desc = "+Language" },
            { mode = "n", keys = "<LocalLeader>l", desc = "+LSP" },
            { mode = "n", keys = "<LocalLeader>t", desc = "+Toggle" },
          },
          clue.gen_clues.builtin_completion(),
          clue.gen_clues.g(),
          clue.gen_clues.marks(),
          clue.gen_clues.registers(),
          clue.gen_clues.windows({ submode_resize = true }),
          clue.gen_clues.z(),
        },
        triggers = {
          { mode = "c", keys = "<C-r>" },
          { mode = "i", keys = "<C-r>" },
          { mode = "i", keys = "<C-x>" },
          { mode = "n", keys = "'" },
          { mode = "n", keys = "<C-w>" },
          { mode = "n", keys = "<Leader>" },
          { mode = "n", keys = "<LocalLeader>" },
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },
          { mode = "n", keys = "`" },
          { mode = "n", keys = "g" },
          { mode = "n", keys = "s" },
          { mode = "n", keys = "z" },
          { mode = "n", keys = '"' },
          { mode = "o", keys = "[" },
          { mode = "o", keys = "]" },
          { mode = "o", keys = "`" },
          { mode = "o", keys = "a" },
          { mode = "o", keys = "i" },
          { mode = "t", keys = "<C-w>" },
          { mode = "t", keys = "<Space>" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "<Leader>" },
          { mode = "x", keys = "[" },
          { mode = "x", keys = "]" },
          { mode = "x", keys = "`" },
          { mode = "x", keys = "a" },
          { mode = "x", keys = "g" },
          { mode = "x", keys = "i" },
          { mode = "x", keys = "s" },
          { mode = "x", keys = "z" },
          { mode = "x", keys = '"' },
        },
        window = {
          delay = 0,
          config = {
            width = "auto",
          },
        },
      }
    end,
  },
  {
    "nvim-mini/mini.colors",
    lazy = true,
  },
  {
    "nvim-mini/mini.comment",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.cursorword",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.diff",
    event = "VeryLazy",
    opts = {
      view = {
        style = "sign",
      },
    },
  },
  {
    "nvim-mini/mini.doc",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.extra",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.fuzzy",
    lazy = true,
    opts = {},
  },
  {
    "nvim-mini/mini.hipatterns",
    opts = function()
      local hi_words = require("mini.extra").gen_highlighter.words
      local hipatterns = require("mini.hipatterns")

      return {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = hi_words({ "FIXME" }, "MiniHipatternsFixme"),
          hack = hi_words({ "HACK" }, "MiniHipatternsHack"),
          todo = hi_words({ "TODO" }, "MiniHipatternsTodo"),
          note = hi_words({ "NOTE" }, "MiniHipatternsNote"),

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
  },
  {
    "nvim-mini/mini.icons",
    -- lazy = true,
    opts = {},
  },
  {
    "nvim-mini/mini.indentscope",
    event = "VeryLazy",
    opts = function()
      local indentscope = require("mini.indentscope")

      return {
        draw = {
          delay = 0,
          animation = indentscope.gen_animation.none(),
        },
        symbol = "│",
      }
    end,
  },
  {
    "nvim-mini/mini.jump2d",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.misc",
    event = "VeryLazy",
    keys = {
      { "<Leader>z", "<Cmd>lua MiniMisc.zoom()<CR>", desc = "Toggle zoom" },
    },
    opts = {},
    config = function(_, opts)
      require("mini.misc").setup(opts)

      -- Auto cd to the root of current git repo
      MiniMisc.setup_auto_root()

      -- Nest comment better
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          MiniMisc.use_nested_comments()
        end,
      })
    end,
  },
  {
    "nvim-mini/mini.move",
    enabled = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.operators",
    enabled = false,
    event = "VeryLazy",
    opts = {
      evaluate = { prefix = "<LocalLeader>=" },
      exchange = { prefix = "<LocalLeader>x" },
      multiply = { prefix = "<LocalLeader>m" },
      replace = { prefix = "<LocalLeader>r" },
      sort = { prefix = "<LocalLeader>s" },
    },
  },
  {
    "nvim-mini/mini.pairs",
    enabled = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.splitjoin",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.statusline",
    opts = {
      use_icons = false,
      content = {
        active = function()
          local statusline = require("mini.statusline")

          local mode, mode_hl = statusline.section_mode({ trunc_width = 50 })
          local git = statusline.section_git({ trunc_width = 75 })
          local diagnostics =
            statusline.section_diagnostics({ trunc_width = 75 })
          local filename = statusline.section_filename({ trunc_width = 80 })
          local fileinfo = statusline.section_fileinfo({ trunc_width = 50 })
          local searchcount =
            statusline.section_searchcount({ trunc_width = 75 })
          local location = statusline.section_location({ trunc_width = 75 })

          -- Usage of `statusline.combine_groups()` ensures highlighting and
          -- correct padding with spaces between groups (accounts for 'missing'
          -- sections, etc.)
          return statusline.combine_groups({
            { hl = mode_hl, strings = { mode } },
            { hl = "statuslineDevinfo", strings = { git, diagnostics } },
            "%=", -- End left alignment
            "%<", -- Mark general truncate point
            { hl = "statuslineFilename", strings = { filename } },
            "%=", -- End center alignment
            { hl = "statuslineFileinfo", strings = { fileinfo } },
            {
              hl = mode_hl,
              strings = { searchcount, location },
            },
          })
        end,
      },
    },
    config = function(_, opts)
      require("mini.statusline").setup(opts)
      vim.opt.laststatus = 3
    end,
  },
  {
    "nvim-mini/mini.surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.tabline",
    enabled = false,
    opts = { show_icons = false },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
