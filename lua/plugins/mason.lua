return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "biome",
        "clang-format",
        "codelldb",
        "codespell",
        "gersemi",
        "gopls",
        "neocmakelsp",
        "pylyzer",
        "pyright",
        "ruff",
        "selene",
        "shellcheck",
        "shfmt",
        "stylua",
        "taplo",
        "typos",
        "typstfmt",
        "yamlfmt",
        "yamllint",
      },
    },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
