return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      -- Snippet source, but I DON'T USE ANY SNIPPETS FOR NOW
      -- "rafamadriz/friendly-snippets",
      -- Copilot
      "fang2hou/blink-copilot",
    },
    opts = {
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = { auto_show = true },
        menu = {
          draw = {
            columns = { { "label", "label_description" }, { "kind" } },
          },
        },
      },
      cmdline = { completion = { menu = { auto_show = true } } },
      signature = { enabled = true },
      sources = {
        default = {
          "copilot",
          "lsp",
          "path",
          "snippets",
          "buffer",
          "markdown",
        },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          },
        },
      },
    },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
