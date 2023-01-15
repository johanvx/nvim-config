return {
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
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
        desc = "Wipe out",
      },
    },
    config = function(_, opts)
      require("mini.bufremove").setup(opts)
    end,
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          -- JoosepAlviste/nvim-ts-context-commentstring
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
  {
    "echasnovski/mini.completion",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      lsp_completion = {
        source_func = "omnifunc",
        auto_setup = false,
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
    "echasnovski/mini.fuzzy",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.fuzzy").setup(opts)
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = "VeryLazy",
    opts = function()
      require("mini.indentscope").setup()

      return {
        draw = {
          delay = 0,
          animation = MiniIndentscope.gen_animation.none(),
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
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
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

      return {
        header = table.concat({
          "  █         █                                                    ",
          " ███        ██                                                   ",
          "█████       ███                                     ██           ",
          "███ ██      ███                                                  ",
          "███  ██     ███   ███████ ███████  ██████  ██    ██ ██ ██████████",
          "███   ██    ███   ██   ██ ██   ██ ██    ██ ██    ██ ██ ██  ██  ██",
          "███    ██   ███   ██   ██ ███████ ██    ██  ██  ██  ██ ██  ██  ██",
          "███     ██  ███   ██   ██ ██      ██    ██   ████   ██ ██  ██  ██",
          "███      ██ ███   ██   ██ ███████  ██████     ██    ██ ██      ██",
          "███       █████                                                  ",
          " ██        ███                                                   ",
          "  █         █                                                    ",
        }, "\n"),
        items = {
          -- Built-in
          item("i", " New file", "enew | startinsert", "Built-in"),
          item("q", " Quit", "confirm quitall", "Built-in"),
          -- Telescope
          item("r", " Recent files", "Telescope oldfiles", "Telescope"),
          item("f", " Find files", "Telescope find_files", "Telescope"),
          item("e", " File Browser", "Telescope file_browser", "Telescope"),
          -- Config-related
          item("l", " Lazy panel", "Lazy", "Config"),
          item("c", " Edit configuration", "edit $MYVIMRC", "Config"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(" ", true),
          starter.gen_hook.aligning("center", "center"),
        },
      }
    end,
    config = function(_, opts)
      local starter = require("mini.starter")
      starter.setup(opts)

      -- footer
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          -- Load `count` plugins in `time` ms
          local stats = require("lazy").stats()
          local count = (" %d plugin(s)"):format(stats.count)
          local time = (" %.2f ms"):format(stats.startuptime)
          -- Neovim version
          local v = vim.version()
          local version = (" v%d.%d.%d"):format(v.major, v.minor, v.patch)
          -- Current date and time
          local datetime = os.date(" %Y-%m-%d %H:%M:%S")
          -- Padding
          local padding = string.rep(" ", 4)
          -- Set MiniStarterFooter
          starter.config.footer =
            table.concat({ time, count, version, datetime }, padding)
          pcall(starter.refresh)
        end,
      })
    end,
  },
  {
    "echasnovski/mini.statusline",
    config = function(_, opts)
      require("mini.statusline").setup(opts)
    end,
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      search_method = "cover_or_next",
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
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
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
