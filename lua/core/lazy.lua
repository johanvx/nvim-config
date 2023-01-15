local lazypath = User.fn.path_concat(User.g.data_dir, "lazy", "lazy.nvim")
if not User.fn.dir_exists(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    -- "https://github.com/folke/lazy.nvim.git", -- Use HTTPS
    "git@github.com:folke/lazy.nvim.git", -- Use SSH
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" },
}, {
  git = { url_format = "git@github.com:%s.git" }, -- Use SSH
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "bugreport",
        "compiler",
        "ftplugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "optwin",
        "rplugin",
        "rrhelper",
        "spellfile_plugin",
        "synmenu",
        "syntax",
        "tar",
        "tarPlugin",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
