return {
  -- dracula 主题 https://github.com/Mofiqul/dracula.nvim/
  { 
    "Mofiqul/dracula.nvim",
    -- 如果它是您的主要配色方案，请确保我们在启动时加载它
    lazy = flase,
    -- 确保在所有其他启动插件之前加载此插件
    priority = 1000,
    config = function()
      -- 执行命令加载
      vim.cmd([[colorscheme dracula]])
    end,
  },
  -- telescope 模糊查找器 https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.telescope')
    end,
  },
  -- dashboard https://github.com/nvimdev/dashboard-nvim
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('config.dashboard')
    end,
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  --[=[
  -- which-key 按键提示 https://github.com/folke/which-key.nvim
  { "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      end,
      -- 配置
      opts = {
      }
  },
  --]=]
  -- wf 按键提示 https://github.com/Cassin01/wf.nvim
  {
    "Cassin01/wf.nvim",
    version = "*",
    config = function()
      require("config.wf")
    end
  },
  -- nvim-cokeline tab栏 https://github.com/willothy/nvim-cokeline
  {
    "willothy/nvim-cokeline",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require('config.cokeline')
    end,
  },
  -- neo-tree 文件树 https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('config.neotree')
    end,
  },
  -- lualine 状态栏 https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons',opt = true },
    config = function()
      require('config.lualine')
    end,
  },
  -- ccc 颜色生成和渲染器 https://github.com/uga-rosa/ccc.nvim
  { "uga-rosa/ccc.nvim", lazy = true },
  -- Undotree https://github.com/mbbill/undotree
  { "mbbill/undotree" },
  -- gitsigns Git 集成：符号、hunk 动作、blame等 https://github.com/lewis6991/gitsigns.nvim
  { "lewis6991/gitsigns.nvim" },
  -- neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = true
  },
  -- codewindow minimap https://github.com/gorbit99/codewindow.nvim
  {
    "gorbit99/codewindow.nvim"
  },
  -- nvim-treesitte 代码高亮 https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-treesitter.configs').setup{
        -- 解析器名称列表或“全部”（应始终安装{ "c", "lua", "vim", "vimdoc", "query" }五个解析器）
        ensure_installed = "all",
        -- 同步安装解析器（仅适用于`ensure_installed`）
        sync_install = false,
        -- 进入缓冲区时自动安装缺少的解析器
        -- 建议：如果您本地没有安装 `tree-sitter` CLI，则设置为 false
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  -- indent-blankline 缩进显示 https://github.com/lukas-reineke/indent-blankline.nvim
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require('config.blankline')
    end,
  },
}
