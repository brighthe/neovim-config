------------------ 常用的前缀，设置为 空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- [ 设置全局快捷键,全局快捷键在整个 NeoVim 编辑器中都有效,不受具体的 buffer 影响 ]]
local map = vim.api.nvim_set_keymap

-- [[ 复用 opt 参数,之后就可以这样映射按键了 map('模式', '按键', '映射为', 'options') ]]
local opt = {noremap = true, silent = true }

---------------------- [[ 窗口管理快捷键映射 ]] -------------------------------
---- 取消 s 默认功能,在普通模式下，s 键的默认功能是删除光标所在位置的字符 -----
map("n", "s", "", opt)
------------------------- sv 垂直分屏(<CR>:回车)-------------------------------
map("n", "sv", ":vsp<CR>", opt)
------------------------- sh 水平分屏 -----------------------------------------
map("n", "sh", ":sp<CR>", opt)
------------------------- sc 关闭当前窗口(<C-w>:Ctrl+w) -----------------------
map("n", "sc", "<C-w>c", opt)
------------------------  so 关闭其他窗口 -------------------------------------
map("n", "so", "<C-w>o", opt)

----------------------[[ Alt + hjkl  窗口之间跳转 ]]---------------------------
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

------------------------- [[ 左右比例控制 ]] ----------------------------------
---------- Ctrl + ← 将当前窗口的宽度减少 2 个字符，实现窗口左移 ---------------
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
---------- Ctrl + → 将当前窗口的宽度增加 2 个字符，实现窗口右移 ---------------
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
---------- s + , 将当前窗口的宽度减少 20 个字符，实现快速缩小窗口宽度 ---------
map("n", "s,", ":vertical resize -20<CR>", opt)
---------- s + . 将当前窗口的宽度增加 20 个字符，实现快速增加窗口宽度 ---------
map("n", "s.", ":vertical resize +20<CR>", opt)

------------------------- [[ 上下比例控制 ]] ----------------------------------
--------- Ctrl + ↓ 将当前窗口的高度增加 2 行，实现窗口下移 --------------------
map("n", "<C-Down>", ":resize +2<CR>", opt)
--------- Ctrl + ↑ 将当前窗口的高度减少 2 行，实现窗口上移 --------------------
map("n", "<C-Up>", ":resize -2<CR>", opt)
------------ s + j 将当前窗口的高度增加 10 行，实现窗口向下移动 ---------------
map("n", "sj", ":resize +10<CR>", opt)
-----------  s + k 将当前窗口的高度减少 10 行，实现窗口向上移动 ---------------
map("n", "sk", ":resize -10<CR>", opt)

------------ s + = 将所有窗口大小调整为相等的尺寸 -----------------------------
map("n", "s=", "<C-w>=", opt)

--------------------------- [[ Terminal 相关 ]]--------------------------------
--------- 空格 + h 水平分割当前窗口，并在新的窗口中打开一个终端 ---------------
map("n", "<leader>h", ":sp | terminal<CR>", opt)
--------- 空格 + v 垂直分割当前窗口，并在新的窗口中打开一个终端 ---------------
map("n", "<leader>v", ":vsp | terminal<CR>", opt)
---------------- exc 从终端模式退出到普通模式 ---------------------------------
map("t", "<Esc>", "<C-\\><C-n>", opt)

---------------------------[[ 上下滚动浏览 ]]----------------------------------
--------------------- ctrl + j 向下移动 4 行 ----------------------------------
map("n", "<C-j>", "4j", opt)
------------------- - ctrl + k 向上移动 4 行 ----------------------------------
map("n", "<C-k>", "4k", opt)


------------------------ [[ visual 模式 ]]-------------------------------------
------------------------ < 向右缩进代码 ---------------------------------------
map("v", "<", "<gv", opt)
------------------------ > 向左缩进代码 ---------------------------------------
map("v", ">", ">gv", opt)
------------------------J -向上移动选中的文本 ---------------------------------
map("v", "J", ":move '>+1<CR>gv-gv", opt)
------------------------K -向上移动选中的文本 ---------------------------------
map("v", "K", ":move '<-2<CR>gv-gv", opt)


-----------------------[[ insert 模式 ]] --------------------------------------


-- bufferline
-- ctrl+h 向左切换标签页
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
-- ctrl+l 向右切换标签页
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>br", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)


------------------------------- Telescope -------------------------------------
-- ctrl+p 查找文件 --
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- ctrl+f 全局搜索 --
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)


-- 插件快捷键
local pluginKeys = {}

-- nvim-tree --
-- alt + m 键打开关闭 tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- o 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件 --
  -- v 垂直分屏打开文件
  { key = "v", action = "vsplit" },
  -- h 水平分屏打开文件
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作 -- 
  { key = "<F5>", action = "refresh" },
  -- a 添加一个文件
  { key = "a", action = "create" },
  -- d 删除一个文件
  { key = "d", action = "remove" },
  -- r 重命名一个文件
  { key = "r", action = "rename" },
  -- x 剪切一个文件
  { key = "x", action = "cut" },
  -- c 复制一个文件
  { key = "c", action = "copy" },
  -- p 粘贴一个文件
  { key = "p", action = "paste" },
  -- s 系统开一个文件
  { key = "s", action = "system_open" },
}


--------------------- Telescope 列表中 插入模式快捷键--------------------------
pluginKeys.telescopeList = {
  i = {
    -------- 上下移动 --------
    -- ctrl+j 选择的项目向下移动
    ["<C-j>"] = "move_selection_next",
    -- ctrl+j 选择的项目向下移动
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -------- 历史记录 --------
    -- ctrl+n 历史记录中向后移动
    ["<C-n>"] = "cycle_history_next",
    -- ctrl+p 历史记录中向后移动
    ["<C-p>"] = "cycle_history_prev",
    -- ctrl+c 关闭窗口
    ["<C-c>"] = "close",
    -------- 预览窗口上下滚动 --------
    -- ctrl+u 向上滚动预览窗口
    ["<C-u>"] = "preview_scrolling_up",
    -- ctrl+d 向上滚动预览窗口
    ["<C-d>"] = "preview_scrolling_down",
  },
}


----------------------- lsp 回调函数快捷键设置---------------------------------
---------- 使用 mapbuf 函数为各种 LSP 功能绑定了一系列快捷键
pluginKeys.mapLSP = function(mapbuf)

--------------------------- 重命名变量名 空格+rn
 --[[ Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --]]
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)

---------------------------- 代码操作 空格+ca
 --[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  --]]
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)

-------------------------- gd 转到函数定义
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)

------------------------- gh 显示悬停信息功能
 --[[
  Lspsaga 替换 gh
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --]]
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)

  -- gD 转到声明功能
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- gi 转到实现功能
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)

---------------------------- gr 转到引用功能
--[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)

------------------------------- diagnostic ------------------------------------
---------- gp 打开诊断信息功能(以弹窗的方式显示改行提示)
--[[
  Lspsaga 替换 gp
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  --]]
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  
 ---------------------- gk 跳转到上一个诊断功能
--[[
  Lspsaga 替换 gk
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)

---------------------- gj 跳转到下一个诊断功能
--[[
  Lspsaga 替换 gj 
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  --]]
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)

  ---------------------- 空格+f 格式化代码功能
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
end


-------------------------- nvim-cmp 自动补全 ----------------------------------
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end

return pluginKeys
