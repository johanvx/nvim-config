return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    keys = {
      {
        "<LocalLeader><LocalLeader>",
        function()
          vim.print(vim.treesitter.get_captures_at_cursor(0))
        end,
        desc = "Get captures at cursor",
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
        "vim",
        "vimdoc",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      -- JoosepAlviste/nvim-ts-context-commentstring
      context_commentstring = { enable = true, enable_autocmd = false },
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
