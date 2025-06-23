local opt = vim.opt
opt.swapfile = false

-- Basic editing
opt.smartindent = true
opt.autowrite = true -- Save before commands like :next

-- Default indent
opt.expandtab = true -- use spaces, not tabs
opt.shiftwidth = 2 -- indent size 2 spaces
opt.tabstop = 2

-- -- -- UI
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative numbers
opt.cursorline = true -- Highlight current line
opt.signcolumn = "yes" -- Always show sign column
opt.termguicolors = true -- True color support
opt.scrolloff = 8 -- Lines of context when scrolling
opt.wrap = false -- No line wrap

-- Completion & searching
opt.completeopt = "menu,menuone,noselect"
opt.ignorecase = true
opt.smartcase = true

-- Clipboard & mouse
opt.clipboard = "unnamedplus" -- System clipboard
opt.mouse = "a" -- Enable mouse support

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Performance
opt.updatetime = 200
opt.timeoutlen = 300

-- Folding (basic)
opt.foldmethod = "indent"
opt.foldlevel = 99

-- -- -- Misc
opt.confirm = true -- Confirm before closing unsaved files
opt.showmode = false -- Don't show mode (assuming statusline)
opt.conceallevel = 1 -- Markdown (or other syntax) is visually simplified

-- undo management
local undodir = vim.fn.stdpath("cache") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

opt.undofile = true
opt.undodir = undodir

-- Auto-reload files changed outside of Neovim
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
	command = "checktime",
})

-- Auto-save all buffers when Neovim loses focus
vim.api.nvim_create_autocmd("FocusLost", {
	callback = function()
		-- Save only modifiable, listed buffers that have changes
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			local ok, result = pcall(function()
				return vim.api.nvim_buf_is_loaded(buf)
					and vim.bo[buf].modifiable
					and vim.bo[buf].buftype == ""
					and vim.bo[buf].buflisted
					and vim.bo[buf].modified
			end)
			if ok and result then
				vim.api.nvim_buf_call(buf, function()
					vim.cmd("silent! write")
				end)
			end
		end
	end,
})
