local os_name = vim.loop.os_uname().sysname

-- Platforms
local is_macos = os_name == "Darwin"
local is_linux = os_name == "Linux"
local is_windows = os_name == "Windows_NT"

-- Basic directories
local home = is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
local cache_dir = vim.fn.stdpath("cache")
local config_dir = vim.fn.stdpath("config")
local data_dir = vim.fn.stdpath("data")

-- Cache directories, required by user.core.options
local backup_dir = User.fn.path_concat(cache_dir, "backup//")
local swap_dir = User.fn.path_concat(cache_dir, "swap//")
local undo_dir = User.fn.path_concat(cache_dir, "undo//")
local view_dir = User.fn.path_concat(cache_dir, "view//")

User.g = {
  backup_dir = backup_dir,
  cache_dir = cache_dir,
  config_dir = config_dir,
  data_dir = data_dir,
  home = home,
  is_linux = is_linux,
  is_macos = is_macos,
  is_windows = is_windows,
  swap_dir = swap_dir,
  undo_dir = undo_dir,
  view_dir = view_dir,
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
