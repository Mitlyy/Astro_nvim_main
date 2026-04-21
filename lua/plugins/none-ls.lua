-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- none-ls still probes the pre-0.12 capability map name.
    if vim.lsp.protocol._request_name_to_capability == nil then
      vim.lsp.protocol._request_name_to_capability = vim.lsp.protocol._request_name_to_server_capability
    end

    local null_ls = require "null-ls"

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.clang_format,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.diagnostics.ruff,
    })
  end,
}
