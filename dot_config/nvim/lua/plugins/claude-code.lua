return {
  "greggh/claude-code.nvim",
  event = "VeryLazy",
  config = function()
    require("claude-code").setup({
      -- Window settings
      window = {
        split_ratio = 0.4, -- 40% of screen for better readability
        position = "botright",
        enter_insert = true,
      },
      
      -- File refresh for live updates when Claude modifies files
      file_refresh = {
        enable = true,
        show_notifications = true,
      },
      
      -- Keymaps
      keymaps = {
        toggle = {
          normal = "<leader>cc",
          terminal = "<C-\\><C-n><leader>cc",
        },
        -- Navigation keymaps
        window = {
          next = "<C-w>w",
          prev = "<C-w>W",
        },
      },
      
      -- Command variants for quick access
      command_variants = {
        continue = "--continue",
        verbose = "--verbose",
      },
    })
  end,
}