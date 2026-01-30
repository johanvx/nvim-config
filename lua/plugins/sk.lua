return {
  {
    "skim-rs/skim",
    init = function()
      vim.env.SKIM_DEFAULT_COMMAND = table.concat({
        "fd --type f --type l --color=never --hidden --exclude .git",
        "git ls-tree -r --name-only HEAD",
        "rg --files --hidden --glob '!.git/*'",
        "find . -path ./.git -prune -o \\( -type f -o -type l \\) -print",
      }, " || ")
    end,
    dependencies = {
      {
        "ibhagwan/fzf-lua",
        keys = {
          {
            "<Leader>f",
            "<Cmd>FzfLua files<CR>",
            desc = "Pick Files (fzf sk)",
          },
          {
            "<Leader>b",
            "<Cmd>FzfLua buffers<CR>",
            desc = "Pick Buffers (fzf sk)",
          },
          {
            "<Leader>o",
            "<Cmd>FzfLua oldfiles<CR>",
            desc = "Pick Oldfiles (fzf sk)",
          },
          {
            "<Leader>/",
            "<Cmd>FzfLua live_grep<CR>",
            desc = "Live grep (fzf sk)",
          },
          {
            "g/",
            "<Cmd>FzfLua grep<CR>",
            desc = "Global grep (fzf sk)",
          },
        },
        -- enable `sk` support instead of the default `fzf`
        opts = {
          { "skim" },
          winopts = {
            split = "belowright 10new",
            preview = {
              hidden = true,
            },
          },
        },
      },
    },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
