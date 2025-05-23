return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  event = {
    "BufNewFile " .. vim.fn.expand("~") .. "/obsidian/*.md",
    "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "epwalsh/pomo.nvim",
      version = "*",
      lazy = true,
      cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
    },
  },
  opts = {
    workspaces = {
      {
        name = "obsidian",
        path = "~/obsidian",
      },
      completion = {
        nvim_cmp = true,
      },
      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
      },
    },
  },
}
