-- Python
if vim.env["CONDA_PREFIX"] then
  -- Use an independent environment `pynvim` for Neovim
  local base_prefix = (vim.env["CONDA_PREFIX"]):match("^.-base")
  local pynvim_python =
    User.fn.path_concat(base_prefix, "envs", "pynvim", "bin", "python")
  vim.g.python3_host_prog = pynvim_python
end

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
