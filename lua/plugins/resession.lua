return {
  {
    "stevearc/resession.nvim",
    specs = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          opts.autocmds = opts.autocmds or {}
          opts.autocmds.resession_auto_save = {
            {
              event = "VimLeavePre",
              desc = "Save session on close",
              callback = function()
                local astrocore = require "astrocore"
                local buf_utils = require "astrocore.buffer"
                local autosave = vim.tbl_get(astrocore.config, "sessions", "autosave")
                if autosave and buf_utils.is_valid_session() then
                  local save = require("resession").save
                  if autosave.last then pcall(save, "Last Session", { notify = false }) end
                  if autosave.cwd then pcall(save, vim.fn.getcwd(), { dir = "dirsession", notify = false }) end
                end
              end,
            },
          }
        end,
      },
    },
  },
}
