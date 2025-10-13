local function apply_catppuccin(mode)
  local background = mode == "light" and "light" or "dark"
  local flavour = background == "light" and "latte" or "mocha"
  vim.g.catppuccin_flavour = flavour
  vim.o.background = background
  vim.cmd.colorscheme("catppuccin")
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        default_integrations = false,
        background = { light = "latte", dark = "mocha" },
        integrations = { snacks = true, treesitter = true },
      })
      apply_catppuccin(vim.env.NVIM_BACKGROUND or vim.o.background)
    end,
  },
  {
    "cormacrelf/dark-notify",
    lazy = false,
    priority = 900,
    config = function()
      local ok, dark_notify = pcall(require, "dark_notify")
      if not ok then
        return
      end
      dark_notify.run({
        onchange = function(mode)
          apply_catppuccin(mode)
        end,
      })
    end,
  },
}
