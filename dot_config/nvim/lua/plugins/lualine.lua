return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"echasnovski/mini.icons",
	},
	opts = function()
		local icons = {
			diagnostics = {
				Error = " ",
				Warn = " ",
				Info = " ",
				Hint = " ",
			},
			git = {
				added = " ",
				modified = " ",
				removed = " ",
			},
		}

		local function root_dir()
			return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
		end

		local function pretty_path()
			return vim.fn.expand("%:~:.")
		end

		return {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"branch",
						icon = "",
						fmt = function(branch)
							if vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.head then
								if
									vim.b.gitsigns_status_dict.added ~= 0
									or vim.b.gitsigns_status_dict.changed ~= 0
									or vim.b.gitsigns_status_dict.removed ~= 0
								then
									return branch .. " ●"
								end
							end
							return branch
						end,
						color = function()
							local gs = vim.b.gitsigns_status_dict
							if gs and (gs.added ~= 0 or gs.changed ~= 0 or gs.removed ~= 0) then
								return { fg = "#e5c07b" } -- Dirty color (yellow)
							else
								return { fg = "#98c379" } -- Clean color (green)
							end
						end,
					},
				},
				lualine_c = {
					root_dir,
					{
						"diagnostics",
						symbols = icons.diagnostics,
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					pretty_path,
				},
				lualine_x = {
					Snacks.profiler.status(),
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = function()
							return { fg = Snacks.util.color("Special") }
						end,
					},
					{
						"diff",
						source = function()
							local gs = vim.b.gitsigns_status_dict
							if gs then
								return {
									added = gs.added,
									modified = gs.changed,
									removed = gs.removed,
								}
							end
						end,
						symbols = icons.git,
					},
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = { "lazy" },
		}
	end,
}
