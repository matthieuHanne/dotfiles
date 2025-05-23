return {
	"mbbill/undotree",
	cmd = "UndotreeToggle", -- load only when you toggle undo tree
	keys = {
		{ "<leader>u", ":UndotreeToggle<CR>", desc = "Toggle Undo Tree" },
	},
	config = function()
		vim.g.undotree_WindowLayout = 2 -- vertical split on right
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_ShortIndicators = 1
	end,
}
