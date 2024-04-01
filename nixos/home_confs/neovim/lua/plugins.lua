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
  -- dashboard https://github.com/nvimdev/dashboard-nvim
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
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
  -- bufferline tab栏 https://github.com/akinsho/bufferline.nvim
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',

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
    }
  },
  -- lualine 状态栏 https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  -- telescope 模糊查找器 https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
}
