vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "󰌵", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({
  -- 关闭Neo-Tree，如果它是标签中的最后一个窗口
  close_if_last_window = true,
  popup_border_style = "rounded",
  add_blank_line_at_top = false,
  enable_git_status = true,
  enable_diagnostics = true,
  enable_modified_markers = true, -- Show markers for files with unsaved changes.
  enable_opened_markers = true,   -- Enable tracking of opened files. Required for `components.name.highlight_opened_files`
  enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
  enable_cursor_hijack = false, -- If enabled neotree will keep the cursor on the first letter of the filename when moving in the tree.
  sources = { "filesystem", "buffers", "git_status", "document_symbols" },
  source_selector = {
    winbar = false,
    statusline = true,
    separator = { left = " ", right= " " },
    show_separator_on_edge = false,
    --                       true  : |/    a    \/    b    \/    c    \|
    --                       false : |     a    \/    b    \/    c     |
    sources = {
     { source = "filesystem" },
     { source = "buffers" },
     { source = "remote" },
    },
  },
  default_component_configs = {
    indent = {
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
    },
    name = {
            trailing_slash = true,
            use_git_status_colors = false,
            highlight = "NeoTreeFileName",
    },
    git_status = {
            symbols = {
              -- Change type
              added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖",-- this can only be used in the git_status source
              renamed   = "󰁕",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            }
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
    },
    bind_to_cwd = true,
    follow_current_file = { enabled = true },
  },
})

-- 将 `neotree' 配置为每次打开时开启,但是排除掉dashboard
vim.api.nvim_create_autocmd("BufNew", {
  group = vim.api.nvim_create_augroup("NeotreeOnNewTab", { clear = true }),
  callback = vim.schedule_wrap(function()
    if vim.bo.filetype ~= 'alpha' and vim.bo.filetype ~= 'dashboard' then
      vim.cmd("Neotree show")
    end
  end),
})
