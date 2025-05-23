-- for chezmoi template
vim.filetype.add({
	extension = {
		["sh.tmpl"] = "sh",
	},
})

-- Override indent for Go: use tabs (not spaces), tab width 8
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.opt_local.expandtab = false -- tabs, no spaces
		vim.opt_local.shiftwidth = 8
		vim.opt_local.tabstop = 8
	end,
})
