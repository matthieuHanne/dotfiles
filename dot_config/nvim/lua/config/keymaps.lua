local utils = require("config.utils")
-- custom utils funtions
vim.keymap.set("n", "<leader>cf", utils.create_file, { desc = "Create file" })

-- save, quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>x", ":w<CR>:bd<CR>", { desc = "Save and close buffer" })
vim.keymap.set("n", "<leader>q", ":bd!<CR>", { desc = "Quit buffer without saving" })
vim.keymap.set("n", "<leader>wa", ":wa<CR>", { desc = "Write all buffers" })
vim.keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "Quit all" })

-- Claude Code keymaps
vim.keymap.set("n", "<leader>cc", function() require("claude-code").toggle() end, { desc = "Claude Code toggle" })
vim.keymap.set("n", "<leader>cr", function() require("claude-code").continue() end, { desc = "Claude Code continue" })
vim.keymap.set("n", "<leader>cv", function() require("claude-code").verbose() end, { desc = "Claude Code verbose" })
