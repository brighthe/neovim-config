------------------ 之前需要安装 packer.nvim 插件管理器 ------------------------
local packer = require("packer")
packer.startup(
  function(use)
------------------ Packer 作为插件管理器，可以管理它自己的更新 ----------------
    use 'wbthomason/packer.nvim'
    ------------------------------ 插件列表 -----------------------------------
    use("folke/tokyonight.nvim")
---------------------------------- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"}) 
   -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    ------------------------------- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    ------------ telescope extensions
    use "LinArcX/telescope-env.nvim"
     ------------------------------ treesitter 
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    
    ---------------------------- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")

     ------------------------------ LSP ---------------------------------------
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })  
     ------------------------------ Lspconfig
    use({ "neovim/nvim-lspconfig" })
     ----------------------------- 补全引擎
    use("hrsh7th/nvim-cmp")
     ----------------------------- snippet 引擎
    use("hrsh7th/vim-vsnip")
     ---------------------------- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

----------------------------- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

---------------------------------- ui -----------------------------------------
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim" )

---------------------------------- 代码格式化
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
end)

config = {
    ------------------------ 以浮动窗口打开安装列表 ----------------------   
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
}

-------------------- 每次保存 plugins.lua 自动安装插件 ------------------------
--[[ [] 中间的部分是 VIM 脚本，Neovim 还没有实现自动命令的 API，需要
--使用 vim.cmd 命令来执行这段脚本。这段脚本的意思是 BufWritePost 事件时，
--如果改的是 lua/plugins.lua 文件，就自动重新加载并调用 :PackerSync 命令，
--这样就不用手动重启，可以自动安装插件了。pcall 命令是一个 Lua 函数，
--它的作用是检查一个函数是否执行成功，如果执行成功，则返回 true，
--否则返回 false ，防止报错]] --
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

