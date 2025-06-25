local function parse_args(input)
  local args = {}
  local current_arg = ""
  local in_single_quotes = false
  local in_double_quotes = false

  for char in input:gmatch(".") do
    if char == "'" and not in_double_quotes then
      in_single_quotes = not in_single_quotes
      current_arg = current_arg .. char
    elseif char == '"' and not in_single_quotes then
      in_double_quotes = not in_double_quotes
      current_arg = current_arg .. char
    elseif char:match("%s") and not (in_single_quotes or in_double_quotes) then
      if current_arg ~= "" then
        table.insert(args, current_arg)
        current_arg = ""
      end
    else
      current_arg = current_arg .. char
    end
  end

  if current_arg ~= "" then
    table.insert(args, current_arg)
  end

  for i, arg in ipairs(args) do
    arg = arg:gsub("(['\"])(.-)%1", "%2")
    arg = arg:gsub("\\n", "\n"):gsub("\\t", "\t")
    args[i] = arg
  end

  return args
end

function User.p.pick_cli()
  vim.ui.input({ prompt = "Pick CLI: " }, function(input)
    if input ~= nil then
      local args = parse_args(input)
      MiniPick.builtin.cli({ command = args })
    end
  end)
end

return {
  {
    "echasnovski/mini.ai",
    dependencies = { "echasnovski/mini.extra" },
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
    "echasnovski/mini.align",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.base16",
    lazy = true,
  },
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    opts = {
      comment = { suffix = "e" },
    },
  },
  {
    "echasnovski/mini.bufremove",
    enabled = false,
    keys = {
      {
        "<Leader>bd",
        "<Cmd>lua MiniBufremove.delete()<CR>",
        desc = "Delete",
      },
      {
        "<Leader>bD",
        "<Cmd>lua MiniBufremove.delete(0, true)<CR>",
        desc = "Delete (forced)",
      },
      {
        "<Leader>bw",
        "<Cmd>lua MiniBufremove.wipeout()<CR>",
        desc = "Wipe out",
      },
      {
        "<Leader>bW",
        "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>",
        desc = "Wipe out (forced)",
      },
    },
    opts = {},
  },
  {
    "echasnovski/mini.clue",
    opts = function()
      local clue = require("mini.clue")

      return {
        clues = {
          {
            { mode = "n", keys = "<Leader>G", desc = "+DAP" },
            { mode = "n", keys = "<Leader>g", desc = "+Pick Git" },
            { mode = "n", keys = "<Leader>t", desc = "+Toggle" },
            { mode = "n", keys = "<Leader>l", desc = "+Pick LSP" },
            { mode = "n", keys = "<LocalLeader><Leader>", desc = "+LSP" },
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
    "echasnovski/mini.colors",
    lazy = true,
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.cursorword",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.doc",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.extra",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.files",
    event = "VeryLazy",
    keys = {
      {
        "<Leader><Leader>",
        "<Cmd>lua MiniFiles.open(nil, false)<CR>",
        desc = "File browser (mini.files)",
      },
    },
    opts = {
      mappings = {
        go_in = "<CR>",
        go_in_plus = "",
        go_out = "<Space>",
        go_out_plus = "",
        mark_goto = "'",
        mark_set = "m",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
      },
    },
  },
  {
    "echasnovski/mini.fuzzy",
    lazy = true,
    opts = {},
  },
  {
    "echasnovski/mini-git",
    event = "VeryLazy",
    opts = {},
    config = function(_, _)
      require("mini.git").setup()
    end,
  },
  {
    "echasnovski/mini.hipatterns",
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
    "echasnovski/mini.hues",
    opts = {
      background = "#08192D",
      foreground = "#BDC0BA",
      saturation = "high",
    },
  },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {},
  },
  {
    "echasnovski/mini.indentscope",
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
    "echasnovski/mini.jump",
    enabled = false,
    event = "VeryLazy",
    opts = {
      mappings = {
        repeat_jump = "",
      },
    },
  },
  {
    "echasnovski/mini.jump2d",
    enabled = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.map",
    enabled = false,
    event = "VeryLazy",
    keys = {
      {
        "<LocalLeader>mc",
        "<Cmd>lua MiniMap.close()<CR>",
        desc = "Close",
      },
      {
        "<LocalLeader>mf",
        "<Cmd>lua MiniMap.toggle_focus()<CR>",
        desc = "Toggle focus",
      },
      {
        "<LocalLeader>mo",
        "<Cmd>lua MiniMap.open()<CR>",
        desc = "Open",
      },
      {
        "<LocalLeader>mr",
        "<Cmd>lua MiniMap.refresh()<CR>",
        desc = "Refresh",
      },
      {
        "<LocalLeader>ms",
        "<Cmd>lua MiniMap.toggle_side()<CR>",
        desc = "Toggle side",
      },
      {
        "<LocalLeader>mt",
        "<Cmd>lua MiniMap.toggle()<CR>",
        desc = "Toggle",
      },
    },
    opts = {},
  },
  {
    "echasnovski/mini.misc",
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
    "echasnovski/mini.move",
    enabled = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.operators",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.pick",
    cmd = { "Pick" },
    keys = {
      { "<Leader>!", "<Cmd>lua User.p.pick_cli()<CR>", desc = "Pick CLI" },
      { "<Leader>'", "<Cmd>Pick registers<CR>", desc = "Pick registers" },
      { "<Leader>/", "<Cmd>Pick grep_live<CR>", desc = "Live grep" },
      { "<Leader>:", "<Cmd>Pick history<CR>", desc = "Pick history" },
      { "<Leader>;", "<Cmd>Pick commands<CR>", desc = "Pick commands" },
      { "<Leader><LocalLeader>", "<Cmd>Pick resume<CR>", desc = "Pick resume" },
      { "<Leader>=", "<Cmd>Pick spellsuggest<CR>", desc = "Pick spell" },
      { "<Leader>?", "<Cmd>Pick grep<CR>", desc = "Grep" },
      { "<Leader>B", "<Cmd>Pick buf_lines<CR>", desc = "Pick line in buffers" },
      { "<Leader>H", "<Cmd>Pick hl_groups<CR>", desc = "Pick highlight" },
      { "<Leader>O", "<Cmd>Pick options<CR>", desc = "Pick options" },
      { "<Leader>V", "<Cmd>Pick visit_labels<CR>", desc = "Pick visit labels" },
      { "<Leader>b", "<Cmd>Pick buffers<CR>", desc = "Buffers" },
      { "<Leader>d", "<Cmd>Pick diagnostic<CR>", desc = "Pick diagnostic" },
      { "<Leader>e", "<Cmd>Pick explorer<CR>", desc = "Pick file explorer" },
      { "<Leader>f", "<Cmd>Pick files<CR>", desc = "Pick files" },
      { "<Leader>h", "<Cmd>Pick help<CR>", desc = "Pick help tags" },
      { "<Leader>j", "<Cmd>Pick list scope='jump'<CR>", desc = "Pick jump" },
      { "<Leader>k", "<Cmd>Pick keymaps<CR>", desc = "Pick keymaps" },
      { "<Leader>m", "<Cmd>Pick marks<CR>", desc = "Pick marks" },
      { "<Leader>o", "<Cmd>Pick oldfiles<CR>", desc = "Pick old files" },
      { "<Leader>T", "<Cmd>Pick treesitter<CR>", desc = "Pick treesitter" },
      { "<Leader>v", "<Cmd>Pick visit_paths<CR>", desc = "Pick visit paths" },
      { "<Leader>q", "<Cmd>Pick list scope='quickfix'<CR>", desc = "Quickfix" },
      -- Git
      { "<Leader>gb", "<Cmd>Pick git_branches<CR>", desc = "Branches" },
      { "<Leader>gc", "<Cmd>Pick git_commits<CR>", desc = "Commits" },
      { "<Leader>gf", "<Cmd>Pick git_files<CR>", desc = "Files" },
      { "<Leader>gh", "<Cmd>Pick git_hunks<CR>", desc = "Hunks" },
      -- LSP
      {
        "<Leader>lD",
        "<Cmd>Pick lsp scope='definition'<CR>",
        desc = "Definition",
      },
      {
        "<Leader>lS",
        "<Cmd>Pick lsp scope='workspace_symbol'<CR>",
        desc = "Workspace symbol",
      },
      {
        "<Leader>ld",
        "<Cmd>Pick lsp scope='declaration'<CR>",
        desc = "Declaration",
      },
      {
        "<Leader>li",
        "<Cmd>Pick lsp scope='implementation'<CR>",
        desc = "Implementation",
      },
      {
        "<Leader>lr",
        "<Cmd>Pick lsp scope='references'<CR>",
        desc = "References",
      },
      {
        "<Leader>ls",
        "<Cmd>Pick lsp scope='document_symbol'<CR>",
        desc = "Document symbol",
      },
      {
        "<Leader>lt",
        "<Cmd>Pick lsp scope='type_definition'<CR>",
        desc = "Type definition",
      },
    },
    opts = {
      window = {
        config = {
          anchor = "NW",
          height = vim.o.lines,
          width = vim.o.columns,
          row = 0,
          col = 0,
        },
      },
    },
  },
  {
    "echasnovski/mini.splitjoin",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.starter",
    event = "VimEnter",
    opts = function()
      local starter = require("mini.starter")

      local item = function(query, name, action, section)
        name = table.concat({ query, name }, string.rep(" ", 64 - #name))
        return { name = name, action = action, section = section }
      end

      -- Neovim version
      local v = vim.version()
      local version = (" v%d.%d.%d"):format(v.major, v.minor, v.patch)
      -- Current date and time
      local datetime = os.date(" %Y-%m-%d %H:%M:%S")
      -- Padding
      local padding = string.rep(" ", 13)

      return {
        -- header = table.concat({
        --   "                                  ██           ",
        --   "                                               ",
        --   "███████ ███████  ██████  ██    ██ ██ ██████████",
        --   "██   ██ ██   ██ ██    ██ ██    ██ ██ ██  ██  ██",
        --   "██   ██ ███████ ██    ██  ██  ██  ██ ██  ██  ██",
        --   "██   ██ ██      ██    ██   ████   ██ ██  ██  ██",
        --   "██   ██ ███████  ██████     ██    ██ ██      ██",
        -- }, "\n"),
        evaluate_single = true,
        items = {
          -- Built-in
          item("i", " New file", "ene | startinsert", "Built-in"),
          item("q", " Quit", "confirm quitall", "Built-in"),
          -- Pick
          item("e", " Explore files", "Pick explorer", "Pick"),
          item("f", " Find files", "Pick files", "Pick"),
          item("g", " Live grep", "Pick grep_live", "Pick"),
          item("h", " Help tags", "Pick help", "Pick"),
          item("o", " Old files", "Pick oldfiles", "Pick"),
          -- Config-related
          item("c", " Edit configuration", "edit $MYVIMRC", "Config"),
          item("l", " Lazy panel", "Lazy", "Config"),
          item("m", " Mason panel", "Mason", "Config"),
        },
        footer = table.concat({ "", version, datetime, "" }, padding),
        content_hooks = {
          starter.gen_hook.adding_bullet(" ", true),
          starter.gen_hook.aligning("center", "center"),
        },
      }
    end,
  },
  {
    "echasnovski/mini.statusline",
    opts = {
      content = {
        active = function()
          local statusline = require("mini.statusline")

          local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
          local git = statusline.section_git({ trunc_width = 75 })
          local diagnostics =
            statusline.section_diagnostics({ trunc_width = 75 })
          local filename = statusline.section_filename({ trunc_width = 140 })
          local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
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
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.tabline",
    enabled = false,
    opts = {},
  },
  {
    "echasnovski/mini.trailspace",
    keys = {
      {
        "<LocalLeader>w",
        "<Cmd>lua MiniTrailspace.trim()<CR>",
        desc = "Trim trailing whitespace",
      },
      {
        "<LocalLeader>e",
        "<Cmd>lua MiniTrailspace.trim_last_lines()<CR>",
        desc = "Trim trailing empty lines",
      },
    },
    opts = {},
  },
  {
    "echasnovski/mini.visits",
    event = "VeryLazy",
    keys = {
      {
        "<LocalLeader>v",
        "<Cmd>lua MiniVisits.add_label()<CR>",
        desc = "Add visit label",
      },
      {
        "<LocalLeader>V",
        "<Cmd>lua MiniVisits.remove_label()<CR>",
        desc = "Remove visit label",
      },
    },
    opts = {},
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
