return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
    keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
    keymap.set("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Git push" })
    keymap.set("n", "<leader>gl", "<cmd>Git pull<cr>", { desc = "Git pull" })
    keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
    keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff split" })
    keymap.set("n", "<leader>gD", "<cmd>Git diff<cr>", { desc = "Git diff" })
    keymap.set("n", "<leader>gL", "<cmd>Git log<cr>", { desc = "Git log" })
    keymap.set("n", "<leader>gB", "<cmd>Git branch<cr>", { desc = "Git branch" })
    keymap.set("n", "<leader>gm", "<cmd>Git merge<cr>", { desc = "Git merge" })
    keymap.set("n", "<leader>gr", "<cmd>Gread<cr>", { desc = "Git read (checkout file)" })
    keymap.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Git write (stage file)" })
    keymap.set("n", "<leader>ge", "<cmd>Gedit<cr>", { desc = "Git edit" })

    keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next git hunk" })
    keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous git hunk" })
  end,
}