return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			config = function()
				require("mason").setup()
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = {
						"ts_ls",
						"lua_ls",
						"svelte",
						"gopls",
						"marksman",
					},
				})

				vim.diagnostic.config({
					virtual_text = false,
					signs = true,
					update_in_insert = false,
					underline = true,
					severity_sort = true,
				})
			end,
		},
		{ "hrsh7th/cmp-nvim-lsp" }, -- for completion capabilities
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = {
			ts_ls = {},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						runtime = { version = "LuaJIT" },
						workspace = { checkThirdParty = false },
					},
				},
			},
			svelte = {},
			gopls = {},
			marksman = {},
		}

		for server, config in pairs(servers) do
			config.capabilities = capabilities
			lspconfig[server].setup(config)
		end
	end,
}
