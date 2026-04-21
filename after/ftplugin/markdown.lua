pcall(vim.treesitter.stop)

pcall(vim.keymap.del, "n", "gO", { buffer = 0 })
pcall(vim.keymap.del, "n", "]]", { buffer = 0 })
pcall(vim.keymap.del, "n", "[[", { buffer = 0 })
