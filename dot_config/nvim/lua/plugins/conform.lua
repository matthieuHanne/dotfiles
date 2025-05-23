return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  dependencies = {
    "williamboman/mason.nvim",
    {
      "zapling/mason-conform.nvim",
      config = function()
        require("mason-conform").setup({
          ensure_installed = {
            "prettierd",
            "stylua",
            "goimports",
            "gofmt",
            "shfmt",
            "markdownlint",
          },
        })
      end,
    },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true  },
        typescript = { "prettierd", "prettier", stop_after_first = true  },
        svelte = { "prettierd", "prettier", stop_after_first = true  },
        json = { "prettierd", "prettier", stop_after_first = true  },
        html = { "prettierd", "prettier", stop_after_first = true  },
        css = { "prettierd", "prettier", stop_after_first = true  },
        markdown = { "markdownlint" },
        sh = { "shfmt" },
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
      },
    })

    -- Run conform format on save automatically
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function()
        require("conform").format({ async = false })
      end,
    })
  end,
}
