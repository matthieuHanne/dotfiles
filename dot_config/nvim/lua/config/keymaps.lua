local utils = require("config.utils")
-- custom utils funtions
vim.keymap.set("n", "<leader>cf", utils.create_file, { desc = "Create file" })

-- save, quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>x", ":w<CR>:bd<CR>", { desc = "Save and close buffer" })
vim.keymap.set("n", "<leader>q", ":bd!<CR>", { desc = "Quit buffer without saving" })
