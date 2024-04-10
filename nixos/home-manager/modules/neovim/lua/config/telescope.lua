local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      local application_type = vim.split(j:result()[1], "/")[2]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        -- esc 直接关闭
        ["<esc>"] = actions.close,
        -- ctrl u 删除输入
        ["<C-u>"] = false,
        -- ctrl+方向 结果栏上下左右
        ["<C-Up>"] = actions.results_scrolling_up,
        ["<C-Down>"] = actions.results_scrolling_down,
        -- ["<C-h>"] = actions.results_scrolling_left,
        -- ["<C-l>"] = actions.results_scrolling_right,
        -- alt+方向 预览栏上下左右
        ["<M-Up>"] = actions.preview_scrolling_up,
        ["<M-Down>"] = actions.preview_scrolling_down,
        -- ["<M-h>"] = actions.preview_scrolling_left,
        -- ["<M-l>"] = actions.preview_scrolling_right,
      },
    },
    preview = {
      -- 不预览大于5MB的文件
      filesize_limit = 5,
    },
    -- 不与预览二进制文件
    -- buffer_previewer_maker = new_maker,
  },
  pickers = {
    -- find_files = {
    --   theme = "dropdown",
    -- }
  },
}
