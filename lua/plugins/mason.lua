-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      run_on_start = false,
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "clangd",
        "cmake-language-server",
        "lua-language-server",
        "pyright",

        -- install formatters
        "black",
        "clang-format",
        "isort",
        "stylua",

        -- install linters
        "ruff",

        -- install debuggers
        "codelldb",
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
