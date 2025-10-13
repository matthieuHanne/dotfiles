local opt = vim.opt
if vim.env.NVIM_BACKGROUND ~= nil and vim.env.NVIM_BACKGROUND ~= '' then
	vim.o.background = vim.env.NVIM_BACKGROUND
end
opt.swapfile = false

-- Basic editing
opt.smartindent = true
opt.autowrite = false

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
opt.mousescroll = "ver:3,hor:0" -- Disable horizontal mouse scrolling

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Performance
opt.updatetime = 250
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

