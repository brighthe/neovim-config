local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("没有找到 nvim-treesitter")
  return
end

treesitter.setup({
  ----------------------- 安装 language parser --------------------------------
  --------- :TSInstallInfo 命令查看支持的语言
  ensure_installed = { "vim", "lua", "python" },
  --------- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -------- 启用增量选择模块
  incremental_selection = {
    enable = true, -- 启用增量选择模块
    keymaps = {-- keymaps 字段定义了增量选择功能的快捷键映射：
      init_selection = "<CR>", -- 回车键(<CR>)初始化选中范围
      node_incremental = "<CR>", -- 回车键(<CR>)逐步扩大选中范围
      node_decremental = "<BS>", -- 退格键(<BS>)逐步缩小选中范围
      scope_incremental = "<TAB>", -- 制表符键(<TAB>)在当前范围内切换选中的范围
    },
  },
  ------- 启用代码缩进模块 ( = 键)
  indent = {
    enable = true,
  },
})

-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
