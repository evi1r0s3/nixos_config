local which_key = require("wf.builtin.which_key")
local register = require("wf.builtin.register")
local bookmark = require("wf.builtin.bookmark")
local buffer = require("wf.builtin.buffer")
local mark = require("wf.builtin.mark")

-- Register
vim.keymap.set(
  "n",
  "<Space>v",
  -- register(opts?: table) -> function
  -- opts?: option
  register(),
  { noremap = true, silent = true, desc = "[wf] 智能寄存" }
)

-- Bookmark
vim.keymap.set(
  "n",
  "<Space>m",
  -- bookmark(bookmark_dirs: table, opts?: table) -> function
  -- bookmark_dirs: directory or file paths
  -- opts?: option
  bookmark({
    flake = "~/git/nixos_config/nixos/flake.nix",
  }),
  { noremap = true, silent = true, desc = "[wf] 选择书签" }
)

-- Buffer
vim.keymap.set(
  "n",
  "<Space>b",
  -- buffer(opts?: table) -> function
  -- opts?: option
  buffer(),
  { noremap = true, silent = true, desc = "[wf] 选择buffer" }
)

-- Mark
vim.keymap.set(
  "n",
  "'",
  -- mark(opts?: table) -> function
  -- opts?: option
  mark(),
  { nowait = true, noremap = true, silent = true, desc = "[wf] 增加书签" }
)
-- 文件管理
vim.keymap.set(
  "n",
  "<Space>n",
  "<CMD>Neotree toggle reveal position=left<CR>",
  { nowait = true, noremap = true, silent = true, desc = "[neotree] 左侧打开文件树" }
)
vim.keymap.set(
  "n",
  "<Space>N",
  "<CMD>Neotree toggle reveal position=current<CR>",
  { nowait = true, noremap = true, silent = true, desc = "[neotree] 打开文件浏览器" }
)

-- 文件搜索
vim.keymap.set(
  "n",
  "<Space>h",
  "<CMD>Telescope oldfiles<CR>",
  { nowait = true, noremap = true, silent = true, desc = "[TeleScope] 历史文件" }
)
vim.keymap.set(
  "n",
  "<Space>f",
  "<CMD>Telescope find_files cwd=/<CR>",
  { nowait = true, noremap = true, silent = true, desc = "[TeleScope] 全局查找文件" }
)

-- tab
vim.keymap.set(
  "n",
  "<C-t>",
  "<Plug>(cokeline-focus-next)",
  { nowait = true, noremap = true, silent = true, desc = "[cokeline] 切换标签" }
)
for i = 1, 9 do
  vim.keymap.set(
    "n",
    ("<Space>t%s"):format(i),
    ("<Plug>(cokeline-focus-%s)"):format(i),
    { silent = true, desc= ("[cokeline] 切换到tab-%s"):format(i) }
  )
  vim.keymap.set(
    "n",
    ("<Space>T%s"):format(i),
    ("<Plug>(cokeline-switch-%s)"):format(i),
    { silent = true, desc= ("[cokeline] 将tab移动到tab-%s"):format(i) }
  )
end

-- Which Key
vim.keymap.set(
  "n",
  "<Space>",
  -- mark(opts?: table) -> function
  -- opts?: option
  which_key({ text_insert_in_advance = "<Space>" }),
  { noremap = true, silent = true, desc = "[wf] which key" }
)

require("wf").setup({ theme = "default" })
