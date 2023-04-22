---------------------- :h mason-default-settings ------------------------------
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "sumneko_lua",
    "pyright",
  },
})

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
}

local lspconfig = require("lspconfig")
--
local opts = {
--  on_attach = require("user.lsp.handlers").on_attach,
--  capabilities = require("user.lsp.handlers").capabilities
}

require("mason-lspconfig").setup_handlers {

  function(server_name)
    require("lspconfig")[server_name].setup(opts)
  end,


}
