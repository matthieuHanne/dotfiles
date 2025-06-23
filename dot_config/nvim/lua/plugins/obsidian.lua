return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	event = "VimEnter",
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
		dir = vim.fn.expand("~/notes"),
		workspaces = {
			{
				name = "notes",
				path = "~/notes",
			},
		},
		completion = {
			nvim_cmp = true,
		},
		templates = {
			folder = "50_templates",
			date_format = "%Y-%m-%d",
		},
		daily_notes = {
			folder = "00__notes",
			date_format = "%Y-%m-%d",
			template = "daily.md",
		},
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<leader>cx"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
	},
}
