return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = true,
      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },
      format_on_save = function(bufnr)
        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match '/utils/' then -- validation.spec.ts
          return
        end
        -- ...additional logic...
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        vue = { 'eslint_d', { 'prettierd', 'prettier' } },
        typescript = { { 'eslint_d' }, { 'prettierd', 'prettier' } },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
