-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = {
      "gd",
      function()
        vim.lsp.buf.definition()
      end,
      desc = "LSP: Go to definition",
    }
    keys[#keys + 1] = {
      "gD",
      function()
        vim.lsp.buf.declaration()
      end,
      desc = "LSP: Go to declaration",
    }
    keys[#keys + 1] = {
      "gi",
      function()
        vim.lsp.buf.implementation()
      end,
      desc = "LSP: Go to implementation",
    }
    keys[#keys + 1] = {
      "<leader>rn",
      function()
        vim.lsp.buf.rename()
      end,
      desc = "LSP: Rename",
    }
    keys[#keys + 1] = {
      "<leader>se",
      function()
        vim.diagnostic.open_float()
      end,
      desc = "[S]how [E]rror Diagnostic",
    }
    -- Disable LayzVim keymap as I now use "gi"
    keys[#keys + 1] = { "gI", false }
  end,
}
