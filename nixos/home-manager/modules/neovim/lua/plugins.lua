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
  -- barbecue winbar https://github.com/utilyre/barbecue.nvim
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require('config.barbecue')
    end,
  },
  -- telescope 模糊查找器 https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.telescope')
    end,
  },
  -- dashboard https://github.com/nvimdev/dashboard-nvim
  {
    "nvimdev/dashboard-nvim",
    event = 'VimEnter',
    config = function()
      require('config.dashboard')
    end,
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
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
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons',opt = true },
    config = function()
      require('config.lualine')
    end,
  },
  -- colorizer 着色器 https://github.com/NvChad/nvim-colorizer.lua
  { 
    "NvChad/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end,
  },
  -- Undotree https://github.com/mbbill/undotree
  { "mbbill/undotree" },
  -- gitsigns Git 集成：符号、hunk 动作、blame等 https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('config.gitsigns')
    end,
  },
  -- neogit Git状态 https://github.com/NeogitOrg/neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require('config.neogit')
    end,
  },
  -- nvim-treesitte 代码高亮 https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require('config.treesitter')
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
  -- direnv https://github.com/direnv/direnv.vim
  { "direnv/direnv.vim", },
 }
