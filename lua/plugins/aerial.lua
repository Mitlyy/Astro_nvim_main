---@type LazySpec
return {
  "stevearc/aerial.nvim",
  opts = function(_, opts)
    local backends = opts.backends

    if vim.islist(backends) then
      backends = vim.tbl_filter(function(backend) return backend ~= "treesitter" end, backends)
      backends = { _ = backends }
    else
      backends = vim.deepcopy(backends or {})
    end

    backends.markdown = { "markdown" }

    opts.backends = backends
    return opts
  end,
}
