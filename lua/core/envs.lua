-- Python
-- Use an independent conda environment `pynvim` for Neovim
local conda_prefix = vim.env["CONDA_PREFIX"]
if conda_prefix then
  -- Use `conda_prefix` as fallback for micromamba
  local base_prefix = conda_prefix:match("^.-base") or conda_prefix
  local pynvim_python =
    User.fn.path_concat(base_prefix, "envs", "pynvim", "bin", "python")
  vim.g.python3_host_prog = pynvim_python
end

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
