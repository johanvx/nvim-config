return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
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
        "help",
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
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
