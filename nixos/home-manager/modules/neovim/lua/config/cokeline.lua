local is_picking_focus = require("cokeline/mappings").is_picking_focus
local is_picking_close = require("cokeline/mappings").is_picking_close

local black = "#282A36"
local grey = "#44475A"
local white = "#F8F8F2"
local lightblue = "#6272A4"
local cyan = "#8BE9FD"
local green = "#50FA7B"
local orange = "#FFB86C"
local pink = "#FF79C6"
local purple = "#BD93F9"
local red = "#FF5555"
local yellow = "#F1FA8C"

-- 这一段是为了解决svelte的文件名显示问题
local function get_path_parts(path)
  local dirs = {}
  for dir in string.gmatch(path, "([^/]+)") do
    table.insert(dirs, dir)
  end

  local filename = dirs[#dirs]
  if filename ~= nil and string.sub(filename, 1, 1) == "+" then
    local ext = filename:match("^.+(%..+)$")
    local last_dir = dirs[#dirs - 1]
    if last_dir == '[id]' and path:match('api') and filename == "+server.ts" then
      local id_index = 0
      for i, dir in ipairs(dirs) do
        if dir == "[id]" then
          id_index = i
        end
      end
      local new_dir = dirs[id_index - 1]
      return new_dir .. "/[id]/" .. filename
    elseif last_dir == '[id]' then
      local id_index = 0
      for i, dir in ipairs(dirs) do
        if dir == "[id]" then
          id_index = i
        end
      end
      local new_dir = dirs[id_index - 1]
      return new_dir .. "/[id]/" .. filename
    elseif
        path:match("api") then
      local api_index = 0
      for i, dir in ipairs(dirs) do
        if dir == "api" then
          api_index = i
        end
      end
      local api_next_dir = dirs[api_index + 1]
      return "api/" .. api_next_dir .. '/' .. filename
    elseif ext == nil then
      local dir = dirs[#dirs - 1]
      return dir .. "/" .. filename
    else
      local dir = dirs[#dirs - 1]
      return dir .. "/" .. filename
    end
  end
end

require("cokeline").setup(
  {
    sidebar = {
      filetype = 'neo-tree',
      components = {
        {
          --   󰞰 󰦈   󰚄  󱋱 󱤓 󱘊 󰔌 󰘨 󰫎
          text = " EVANGELION 󱤓󱤓 󰫍󰫍󰫍󰫍󰫍󰫍 ",
          fg = red,
          bg = grey,
          style = 'bold'
        }
      }
    },
    default_hl = {
      fg = function(buffer)
        if buffer.is_focused then
          return black
        end
        return white
      end,
      bg = function(buffer)
        if buffer.is_focused then
          return green
        end
        return lightblue
      end
    },
    components = {
      {
        text = "",
        bg = function(buffer)
          if buffer.is_focused then
            return green
          end
          return lightblue
        end,
        fg = function(buffer)
          if buffer.index ~= 1 then
            return black
          end
          return grey
        end,
      },
      {
        text = function(buffer) return buffer.index .. ' ' end,
      },
      {
        text = function(buffer)
          if is_picking_focus() or is_picking_close() then
            return buffer.pick_letter .. " "
          end

          return buffer.devicon.icon
        end,
        fg = function(buffer)
          if is_picking_focus() then
            return yellow
          end
          if is_picking_close() then
            return red
          end

          if buffer.is_focused then
            return black
          else
            return grey
          end
        end,
        style = function(_)
          return (is_picking_focus() or is_picking_close()) and "italic,bold" or nil
        end
      },
      {
        text = function(buffer)
          if get_path_parts(buffer.path) ~= nil then
            return get_path_parts(buffer.path) .. " "
          else
           return buffer.unique_prefix .. buffer.filename .. " "
          end
        end,
        style = 'bold'
      },
      {
        text = '',
        on_click = function(_, _, _, _, buffer)
        buffer:delete()
        end
      },
      {
        text = "",
        fg = function(buffer)
          if buffer.is_focused then
            return green
          end
          return lightblue
        end,
        bg = black
      }
    }
  }
)
