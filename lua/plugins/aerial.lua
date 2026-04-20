---@type LazySpec
return {
  "stevearc/aerial.nvim",
  opts = function(_, opts)
    local backends = opts.backends

    if vim.islist(backends) then
      backends = { _ = backends }
    else
      backends = vim.deepcopy(backends or {})
    end

    backends.markdown = { "markdown" }

    opts.backends = backends
    return opts
  end,
}
