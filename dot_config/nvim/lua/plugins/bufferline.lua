return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "echasnovski/mini.icons" },
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
			{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
		},
		opts = function()
			local mini_icons = require("mini.icons")

			local icons = {
				diagnostics = {
					Error = " ",
					Warn = " ",
					Info = " ",
					Hint = " ",
				},
			}

			return {
				options = {
					close_command = function(n)
						Snacks.bufdelete(n)
					end,
					right_mouse_command = function(n)
						Snacks.bufdelete(n)
					end,
					diagnostics = "nvim_lsp",
					always_show_bufferline = false,
					diagnostics_indicator = function(_, _, diag)
						local ret = (diag.error and icons.diagnostics.Error .. diag.error .. " " or "")
							.. (diag.warning and icons.diagnostics.Warn .. diag.warning .. " " or "")
							.. (diag.info and icons.diagnostics.Info .. diag.info .. " " or "")
							.. (diag.hint and icons.diagnostics.Hint .. diag.hint or "")
						return vim.trim(ret)
					end,
					offsets = {
						{
							filetype = "snacks_layout_box",
						},
					},
					get_element_icon = function(opts)
						return "" --TODO mini_icons.get_icon(opts.filetype) or ""
					end,
				},
			}
		end,
		config = function(_, opts)
			require("bufferline").setup(opts)

			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(vim.cmd, "BufferLineRefresh")
					end)
				end,
			})
		end,
	},
}
