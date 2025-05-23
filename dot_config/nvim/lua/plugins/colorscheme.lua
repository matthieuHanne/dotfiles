return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			default_integrations = false,
			integrations = { snacks = true, treesitter = true },
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
