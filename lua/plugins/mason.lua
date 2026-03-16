return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "o",
          package_pending = "~",
          package_uninstalled = "x",
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {},
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
