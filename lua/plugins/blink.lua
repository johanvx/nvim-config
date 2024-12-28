return {
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    dependencies = {
      -- Snippet source, but I DON'T USE ANY SNIPPETS FOR NOW
      -- "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
    },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
