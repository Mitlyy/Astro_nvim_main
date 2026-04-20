---@type LazySpec
return {
  "brenoprata10/nvim-highlight-colors",
  config = function(_, opts)
    local highlight_colors = require "nvim-highlight-colors"
    highlight_colors.setup(opts)

    local ok, utils = pcall(require, "nvim-highlight-colors.utils")
    if not ok or utils._safe_document_color_patch then return end

    utils._safe_document_color_patch = true

    local get_lsp_clients = utils.get_lsp_clients
    local document_color_method = "textDocument/documentColor"

    local function supports_document_color(client, bufnr)
      if not client or client.name == "null-ls" then return false end

      local nvim_version = vim.version()
      if nvim_version.major == 0 and nvim_version.minor < 11 then
        local ok_supports, supported = pcall(client.supports_method, document_color_method, { bufnr = bufnr })
        return ok_supports and supported
      end

      local ok_supports, supported = pcall(client.supports_method, client, document_color_method, bufnr)
      return ok_supports and supported
    end

    --- Work around LSP clients whose supports_method implementation is not
    --- compatible with newer Neovim internals.
    utils.highlight_with_lsp = function(active_buffer_id, ns_id, positions, options_)
      local param = { textDocument = vim.lsp.util.make_text_document_params() }
      local clients = get_lsp_clients(active_buffer_id)
      local nvim_version = vim.version()

      for _, client in pairs(clients) do
        if supports_document_color(client, active_buffer_id) then
          if nvim_version.major == 0 and nvim_version.minor < 11 then
            client.request(document_color_method, param, function(_, response)
              utils.highlight_lsp_document_color(response, active_buffer_id, ns_id, positions, options_)
            end, active_buffer_id)
          else
            client:request(document_color_method, param, function(_, response)
              utils.highlight_lsp_document_color(response, active_buffer_id, ns_id, positions, options_)
            end, active_buffer_id)
          end
        end
      end
    end
  end,
}
