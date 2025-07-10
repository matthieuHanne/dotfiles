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
      format_on_save = false,
      format_after_save = false,
    })

    -- Manual format commands with more control
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    vim.api.nvim_create_user_command("FormatWrite", function()
      require("conform").format({ async = false, lsp_fallback = true })
      vim.cmd("write")
    end, {})

    -- Keymaps for formatting
    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format buffer" })


  end,
}
