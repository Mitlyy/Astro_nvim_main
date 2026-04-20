-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
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
    },
  },
}
