---------------- [[ 配置的入口文件，负责引用其它模块 ]] -----------------------

---------------------------------- 基础配置 -----------------------------------
require("basic")

--------------------------------- 快捷键映射 ----------------------------------
require("keybindings")

-- Packer插件管理
require("plugins")
-- 主题设置 
require("colorscheme")
----------------------------- 插件配置 ----------------------------------------
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")

----------------------------  内置 LSP  ---------------------------------------
require("lsp.setup")
---------------------------  补全引擎
require("lsp.cmp")
---------------------------  界面美化
require("lsp.ui")
---------------------------  代码格式化
require("lsp.null-ls")
