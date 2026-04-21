-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "bash",
      "c",
      "cmake",
      "cpp",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "vim",
      "yaml",
    })

    opts.highlight = opts.highlight or {}
    opts.highlight.disable = require("astrocore").list_insert_unique(opts.highlight.disable, {
      "markdown",
      "markdown_inline",
    })
  end,
}
