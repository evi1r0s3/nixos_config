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
  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
  indent = {
    enable = true
  }
}
-- 开启 Folding 折叠
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
