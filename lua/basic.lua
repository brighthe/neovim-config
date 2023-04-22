-------------------------------- 基础配置 -------------------------------------
-- [[ vim.g. 全局变量
--    vim.o. 局部变量
--    vim.wo. 窗口(window)本地选项
--    vim.bo. 缓冲区(buffer)本地选项]] --

-- [[将 Neovim 配置为使用 UTF-8 字符编码
-- 进行内部文本表示以及读取和写入文件。]]--
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- [[ jkhl 移动时光标周围保留 8 行]] --
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- [[ 使用相对行号 ]] --
vim.wo.number = true
vim.wo.relativenumber = true

-- [[ 高亮所在行 ]] --
vim.wo.cursorline = true

-- [[ 显示左侧图标指示列 ]] --
vim.wo.signcolumn = "yes"

-- [[ 右侧参考线，超过表示代码太长了，考虑换行 ]] --
vim.wo.colorcolumn = "80"

-- [[ 缩进 4 个空格等于一个 Tab 
--    按下 Tab 会插入 4 个空格作为缩进
--    使用缩进或取消缩进命令时，会根据 shiftwidth 进行四舍五入]] --
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

----------------------- 设置缩进宽度为 4 个空格
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

---------------------------- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true

--------------------- 自动缩进，新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-------------------- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

---------------------------- 搜索不高亮匹配搜索结果
vim.o.hlsearch = false

---------------------------- 边输入边搜索
vim.o.incsearch = true

-------------------- 命令行高为 2，提供足够的显示空间--------------------------
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false

-------------- 光标在行首尾时 <Left><Right> 可以跳到上一行或下一行
vim.o.whichwrap = '<,>,[,]'

-- 允许隐藏被修改过的buffer
vim.o.hidden = true

----------------------------------- 鼠标支持
vim.o.mouse = "a"

-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300

----- 设置 timeoutlen 为等待键盘快捷键连击时间 600 毫秒，可根据需要设置
vim.o.timeoutlen = 600

-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "light"
vim.o.termguicolors = true
vim.opt.termguicolors = true

---------------- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"

--[[ 在使用 Command-line mode 进行模糊匹配补全时，
--NeoVim 会在命令行下方显示一个菜单，列出所有可能的匹配项 ]]--
vim.o.wildmenu = true

-------------------- 让补全菜单看起来更简洁
vim.o.shortmess = vim.o.shortmess .. 'c'

------------ 设置补全菜单（popup menu）的最大高度为 10 行
vim.o.pumheight = 10

-- 永远显示 tabline
vim.o.showtabline = 2

-------------- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false

------------------ 系统剪贴板开启
vim.opt.clipboard = "unnamedplus"
