return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  config = function()
    require("go").setup({
      -- Enable all features
      fillstruct = "gopls",
      dap_debug = false, -- We'll set up dap separately
      goimports = "gopls", -- Use gopls for imports
      lsp_cfg = false, -- We already have LSP configured
      lsp_gofumpt = false, -- Use our formatter setup
      lsp_keymaps = false, -- Define our own keymaps
      test_runner = "go", -- Use go test
      run_in_floaterm = false,
      trouble = true, -- Integration with trouble.nvim
      luasnip = true, -- Enable snippet support
      
      -- UI settings
      icons = { breakpoint = "🔴", currentpos = "→" },
      sign_priority = 12,
    })

    -- Go specific keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        local opts = { buffer = true, silent = true }
        -- Struct tags
        vim.keymap.set("n", "<leader>gsj", ":GoTagAdd json<CR>", vim.tbl_extend("force", opts, { desc = "Add json tags" }))
        vim.keymap.set("n", "<leader>gsy", ":GoTagAdd yaml<CR>", vim.tbl_extend("force", opts, { desc = "Add yaml tags" }))
        vim.keymap.set("n", "<leader>gsr", ":GoTagRm<CR>", vim.tbl_extend("force", opts, { desc = "Remove tags" }))
        
        -- Testing
        vim.keymap.set("n", "<leader>gt", ":GoTest<CR>", vim.tbl_extend("force", opts, { desc = "Run tests" }))
        vim.keymap.set("n", "<leader>gtf", ":GoTestFunc<CR>", vim.tbl_extend("force", opts, { desc = "Test function" }))
        vim.keymap.set("n", "<leader>gta", ":GoAddTest<CR>", vim.tbl_extend("force", opts, { desc = "Add test" }))
        
        -- Code generation
        vim.keymap.set("n", "<leader>gfs", ":GoFillStruct<CR>", vim.tbl_extend("force", opts, { desc = "Fill struct" }))
        vim.keymap.set("n", "<leader>gie", ":GoIfErr<CR>", vim.tbl_extend("force", opts, { desc = "Add if err" }))
        vim.keymap.set("n", "<leader>gim", ":GoImpl<CR>", vim.tbl_extend("force", opts, { desc = "Implement interface" }))
        
        -- Other
        vim.keymap.set("n", "<leader>gcc", ":GoCmt<CR>", vim.tbl_extend("force", opts, { desc = "Add comment" }))
        vim.keymap.set("n", "<leader>gm", ":GoModTidy<CR>", vim.tbl_extend("force", opts, { desc = "Go mod tidy" }))
      end,
    })
  end,
}