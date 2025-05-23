local utils = require("config.utils")
-- custom utils funtions
vim.keymap.set("n", "<leader>cf", utils.create_file, { desc = "Create file" })

-- save, quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>x", ":w<CR>:bd<CR>", { desc = "Save and close buffer" })
vim.keymap.set("n", "<leader>q", ":bd!<CR>", { desc = "Quit buffer without saving" })

-- move between splits
vim.keymap.set("n", "<C-Left>", "<C-w>h", { silent = true, desc = "Move to left split" })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { silent = true, desc = "Move to below split" })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { silent = true, desc = "Move to above split" })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { silent = true, desc = "Move to right split" })
