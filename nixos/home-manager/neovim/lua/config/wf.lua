local which_key = require("wf.builtin.which_key")
local register = require("wf.builtin.register")
local bookmark = require("wf.builtin.bookmark")
local buffer = require("wf.builtin.buffer")
local mark = require("wf.builtin.mark")

-- V --
-- Register
vim.keymap.set(
  "n",
  "<Space>v",
  -- register(opts?: table) -> function
  -- opts?: option
  register(),
  { noremap = true, silent = true, desc = "[V] 智能寄存" }
)
-- M --
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
  { noremap = true, silent = true, desc = "[Mark] 选择书签" }
)
-- Mark
vim.keymap.set(
  "n",
  "<Space>M",
  -- mark(opts?: table) -> function
  -- opts?: option
  mark(),
  { noremap = true, silent = true, desc = "[Mark] 增加书签" }
)
-- B --
-- Buffer
vim.keymap.set(
  "n",
  "<Space>b",
  -- buffer(opts?: table) -> function
  -- opts?: option
  buffer(),
  { noremap = true, silent = true, desc = "[Buffer] 选择buffer" }
)

-- N --
-- 导航 文件管理
vim.keymap.set(
  "n",
  "<Space>n",
  "<CMD>Neotree toggle dir=/ position=current<CR>",
  { noremap = true, silent = true, desc = "[Navigation] 打开文件浏览器" }
)
-- F --
-- 文件搜索
vim.keymap.set(
  "n",
  "<Space>fh",
  "<CMD>Telescope oldfiles<CR>",
  { noremap = true, silent = true, desc = "[File] 历史文件" }
)
vim.keymap.set(
  "n",
  "<Space>fs",
  "<CMD>Telescope find_files cwd=/<CR>",
  { noremap = true, silent = true, desc = "[File] 全局查找文件" }
)
-- G --
-- git
vim.keymap.set(
  "n",
  "<Space>g",
  "<CMD>Neogit cwd=%:p:h<CR>",
  { noremap = true, silent = true, desc = "[Git] 当前文件所属项目git" }
)
-- U --
-- undo
vim.keymap.set(
  "n",
  "<Space>u",
  "<CMD>UndotreeToggle<CR>",
  { noremap = true, silent = true, desc = "[Undo] undo 历史" }
)
-- P --
-- format
vim.keymap.set(
  "n",
  "<Space>p",
  "gg=G",
  { noremap = true, silent = true, desc = "[Prettify] 格式化" }
)
-- T --
-- tab
vim.keymap.set(
  "n",
  "<C-t>",
  "<Plug>(cokeline-focus-next)",
  { noremap = true, silent = true, desc = "[Tab] 切换标签" }
)
-- tab
vim.keymap.set(
  "n",
  "<Space>tx",
  "<CMD>bdelete<CR>",
  { noremap = true, silent = true, desc = "[Tab] 关闭标签" }
)

for i = 1, 9 do
  vim.keymap.set(
    "n",
    ("<Space>t%s"):format(i),
    ("<Plug>(cokeline-focus-%s)"):format(i),
    { noremap = true, silent = true, desc= ("[Tab] 切换到tab-%s"):format(i) }
  )
  vim.keymap.set(
    "n",
    ("<Space>T%s"):format(i),
    ("<Plug>(cokeline-switch-%s)"):format(i),
    { noremap = true, silent = true, desc= ("[Tab] 将tab移动到tab-%s"):format(i) }
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
require("wf").setup({
  theme = "default",
  -- skip_front_duplication = true,
})
