return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = false,
        opts = {},
      },
    },
    keys = {
      {
        "<LocalLeader><LocalLeader><LocalLeader>",
        function()
          vim.print(vim.treesitter.get_captures_at_cursor(0))
        end,
        desc = "Inspect captures at cursor",
      },
    },
    opts = {
      auto_install = false,
      sync_install = false,
      ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "comment",
        "cpp",
        "css",
        "dockerfile",
        "fish",
        "gitignore",
        "haskell",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "swift",
        "toml",
        "tsx",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "ss",
          node_incremental = "gn",
          scope_incremental = "ss",
          node_decremental = "gN",
        },
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      -- Prefer Git
      require("nvim-treesitter.install").prefer_git = true

      -- Use SSH
      for _, config in
        pairs(require("nvim-treesitter.parsers").get_parser_configs())
      do
        config.install_info.url =
          config.install_info.url:gsub("https://github.com/", "git@github.com:")
      end

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
