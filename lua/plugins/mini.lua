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
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },
  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.align").setup(opts)
    end,
  },
  {
    "echasnovski/mini.base16",
    lazy = true,
  },
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.bracketed").setup(opts)
    end,
  },
  {
    "echasnovski/mini.bufremove",
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
    config = function(_, opts)
      require("mini.bufremove").setup(opts)
    end,
  },
  {
    "echasnovski/mini.clue",
    opts = function()
      local clue = require("mini.clue")

      return {
        clues = {
          {
            { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
            { mode = "n", keys = "<Leader>f", desc = "+Pick" },
            { mode = "n", keys = "<Leader>fg", desc = "+Git" },
            { mode = "n", keys = "<Leader>fl", desc = "+LSP" },
            { mode = "n", keys = "<Leader>g", desc = "+Gitsigns" },
            { mode = "n", keys = "<Leader>gh", desc = "+Hunk" },
            { mode = "n", keys = "<Leader>gt", desc = "+Toggle" },
            { mode = "n", keys = "<Leader>l", desc = "+LSP" },
            { mode = "n", keys = "<Leader>m", desc = "+MiniMap" },
            { mode = "n", keys = "<Leader>v", desc = "+MiniVisits" },
            { mode = "n", keys = "<Leader>w", desc = "+Window" },
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
    config = function(_, opts)
      require("mini.clue").setup(opts)
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
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
  {
    "echasnovski/mini.completion",
    enabled = false,
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      lsp_completion = {
        source_func = "omnifunc",
        process_items = function(items, base)
          -- Don't show 'Text' and 'Snippet' suggestions
          items = vim.tbl_filter(function(x)
            return x.kind ~= 1 and x.kind ~= 15
          end, items)
          return MiniCompletion.default_process_items(items, base)
        end,
      },
    },
    config = function(_, opts)
      require("mini.completion").setup(opts)
    end,
  },
  {
    "echasnovski/mini.cursorword",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.cursorword").setup(opts)
    end,
  },
  {
    "echasnovski/mini.doc",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.doc").setup(opts)
    end,
  },
  {
    "echasnovski/mini.extra",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("mini.extra").setup(opts)
    end,
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
    config = function(_, opts)
      require("mini.files").setup(opts)
    end,
  },
  {
    "echasnovski/mini.fuzzy",
    lazy = true,
    config = function(_, opts)
      require("mini.fuzzy").setup(opts)
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
          fixme = hi_words(
            { "FIXME", "Fixme", "fixme" },
            "MiniHipatternsFixme"
          ),
          hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
          todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
          note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
    config = function(_, opts)
      require("mini.hipatterns").setup(opts)
    end,
  },
  {
    "echasnovski/mini.hues",
    enabled = true,
    opts = {
      background = "#0f172a",
      foreground = "#f8fafc",
      saturation = "high",
    },
    config = function(_, opts)
      require("mini.hues").setup(opts)
    end,
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
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
  {
    "echasnovski/mini.jump",
    event = "VeryLazy",
    opts = {
      mappings = {
        repeat_jump = "",
      },
    },
    config = function(_, opts)
      require("mini.jump").setup(opts)
    end,
  },
  {
    "echasnovski/mini.jump2d",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.jump2d").setup(opts)
    end,
  },
  {
    "echasnovski/mini.map",
    event = "VeryLazy",
    keys = {
      {
        "<Leader>mc",
        "<Cmd>lua MiniMap.close()<CR>",
        desc = "Close",
      },
      {
        "<Leader>mf",
        "<Cmd>lua MiniMap.toggle_focus()<CR>",
        desc = "Toggle focus",
      },
      {
        "<Leader>mo",
        "<Cmd>lua MiniMap.open()<CR>",
        desc = "Open",
      },
      {
        "<Leader>mr",
        "<Cmd>lua MiniMap.refresh()<CR>",
        desc = "Refresh",
      },
      {
        "<Leader>ms",
        "<Cmd>lua MiniMap.toggle_side()<CR>",
        desc = "Toggle side",
      },
      {
        "<Leader>mt",
        "<Cmd>lua MiniMap.toggle()<CR>",
        desc = "Toggle",
      },
    },
    config = function(_, opts)
      require("mini.map").setup(opts)
    end,
  },
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.move").setup(opts)
    end,
  },
  {
    "echasnovski/mini.operators",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("mini.operators").setup(opts)
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  {
    "echasnovski/mini.pick",
    cmd = { "Pick" },
    keys = {
      { "<Leader>/", "<Cmd>Pick grep_live<CR>", desc = "Live grep" },
      { "<Leader>f'", "<Cmd>Pick registers<CR>", desc = "Registers" },
      { "<Leader>f=", "<Cmd>Pick spellsuggest<CR>", desc = "Spell" },
      { "<Leader>fb", "<Cmd>Pick buffers<CR>", desc = "Buffers" },
      { "<Leader>fB", "<Cmd>Pick buf_lines<CR>", desc = "Line in buffers" },
      { "<Leader>fc", "<Cmd>lua User.p.pick_cli()<CR>", desc = "CLI" },
      { "<Leader>fC", "<Cmd>Pick commands<CR>", desc = "Commands" },
      { "<Leader>fd", "<Cmd>Pick diagnostic<CR>", desc = "Diagnostic" },
      { "<Leader>fe", "<Cmd>Pick explorer<CR>", desc = "Explorer" },
      { "<Leader>ff", "<Cmd>Pick files<CR>", desc = "Files" },
      { "<Leader>fh", "<Cmd>Pick help<CR>", desc = "Help tags" },
      { "<Leader>fH", "<Cmd>Pick hl_groups<CR>", desc = "Highlight" },
      { "<Leader>fj", "<Cmd>Pick list scope='jump'<CR>", desc = "Jump" },
      { "<Leader>fk", "<Cmd>Pick keymaps<CR>", desc = "Keymaps" },
      { "<Leader>fm", "<Cmd>Pick marks<CR>", desc = "Marks" },
      { "<Leader>fo", "<Cmd>Pick oldfiles<CR>", desc = "Old files" },
      { "<Leader>fO", "<Cmd>Pick options<CR>", desc = "Options" },
      {
        "<Leader>fq",
        "<Cmd>Pick list scope='quickfix'<CR>",
        desc = "Quickfix",
      },
      { "<Leader>fr", "<Cmd>Pick resume<CR>", desc = "Resume" },
      { "<Leader>fR", "<Cmd>Pick history<CR>", desc = "History" },
      { "<Leader>ft", "<Cmd>Pick treesitter<CR>", desc = "Treesitter" },
      { "<Leader>fv", "<Cmd>Pick visit_paths<CR>", desc = "Visit paths" },
      { "<Leader>fV", "<Cmd>Pick visit_labels<CR>", desc = "Visit labels" },
      { "<Leader>fw", "<Cmd>Pick grep<CR>", desc = "Grep" },
      -- Git
      { "<Leader>fgb", "<Cmd>Pick git_branches<CR>", desc = "Branches" },
      { "<Leader>fgc", "<Cmd>Pick git_commits<CR>", desc = "Commits" },
      { "<Leader>fgf", "<Cmd>Pick git_files<CR>", desc = "Files" },
      { "<Leader>fgh", "<Cmd>Pick git_hunks<CR>", desc = "Hunks" },
      -- LSP
      {
        "<Leader>flD",
        "<Cmd>Pick lsp scope='definition'",
        desc = "Definition",
      },
      {
        "<Leader>flS",
        "<Cmd>Pick lsp scope='workspace_symbol'",
        desc = "Workspace symbol",
      },
      {
        "<Leader>fld",
        "<Cmd>Pick lsp scope='declaration'",
        desc = "Declaration",
      },
      {
        "<Leader>fli",
        "<Cmd>Pick lsp scope='implementation'",
        desc = "Implementation",
      },
      {
        "<Leader>flr",
        "<Cmd>Pick lsp scope='references'",
        desc = "References",
      },
      {
        "<Leader>fls",
        "<Cmd>Pick lsp scope='document_symbol'",
        desc = "Document symbol",
      },
      {
        "<Leader>flt",
        "<Cmd>Pick lsp scope='type_definition'",
        desc = "Type definition",
      },
    },
    opts = {},
    config = function(_, opts)
      require("mini.pick").setup(opts)
    end,
  },
  {
    "echasnovski/mini.splitjoin",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("mini.splitjoin").setup(opts)
    end,
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
      local version = (" v%d.%d.%d"):format(v.major, v.minor, v.patch)
      -- Current date and time
      local datetime = os.date(" %Y-%m-%d %H:%M:%S")
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
          item("i", " New file", "enew | startinsert", "Built-in"),
          item("q", " Quit", "confirm quitall", "Built-in"),
          -- Pick
          item("f", " Find files", "Pick files", "Pick"),
          item("g", " Live grep", "Pick grep_live", "Pick"),
          item("h", " Help tags", "Pick help", "Pick"),
          -- item("r", " Recent files", "Telescope oldfiles", "Pick"),
          -- Config-related
          item("c", " Edit configuration", "edit $MYVIMRC", "Config"),
          item("l", " Lazy panel", "Lazy", "Config"),
        },
        footer = table.concat({ "", version, datetime, "" }, padding),
        content_hooks = {
          starter.gen_hook.adding_bullet(" ", true),
          starter.gen_hook.aligning("center", "center"),
        },
      }
    end,
    config = function(_, opts)
      require("mini.starter").setup(opts)
    end,
  },
  {
    "echasnovski/mini.statusline",
    opts = {
      content = {
        active = function()
          local statusline = require("mini.statusline")

          local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
          local spell = vim.wo.spell and "" or ""
          local wrap = vim.wo.wrap and "" or ""
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
            { hl = mode_hl, strings = { mode, spell, wrap } },
            { hl = "statuslineDevinfo", strings = { git, diagnostics } },
            "%<", -- Mark general truncate point
            { hl = "statuslineFilename", strings = { filename } },
            "%=", -- End left alignment
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
    end,
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
  },
  {
    "echasnovski/mini.tabline",
    config = function(_, opts)
      require("mini.tabline").setup(opts)
    end,
  },
  {
    "echasnovski/mini.trailspace",
    keys = {
      {
        "<Leader>bt",
        "<Cmd>lua MiniTrailspace.trim()<CR>",
        desc = "Trim trailing whitespace",
      },
      {
        "<Leader>be",
        "<Cmd>lua MiniTrailspace.trim_last_lines()<CR>",
        desc = "Trim trailing empty lines",
      },
    },
    config = function(_, opts)
      require("mini.trailspace").setup(opts)
    end,
  },
  {
    "echasnovski/mini.visits",
    event = "VeryLazy",
    keys = {
      { "<Leader>vv", "<Cmd>lua MiniVisits.add_label()<CR>", desc = "Add" },
      {
        "<Leader>vV",
        "<Cmd>lua MiniVisits.remove_label()<CR>",
        desc = "Remove",
      },
    },
    opts = {},
    config = function(_, opts)
      require("mini.visits").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
