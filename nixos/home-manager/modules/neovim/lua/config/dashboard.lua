require('dashboard').setup{
  theme = 'hyper',
  disable_move = true,
  shortcut_type = "number",
  change_to_vcs_root = false,
  config = {
    header = {
      '▓█████ ██▒   █▓ ██▓  █████▒██▓ ██▀███ ▓██   ██▓',
      '▓█   ▀▓██░   █▒▓██▒▓██   ▒▓██▒▓██ ▒ ██▒▒██  ██▒',
      '▒███   ▓██  █▒░▒██▒▒████ ░▒██▒▓██ ░▄█ ▒ ▒██ ██░',
      '▒▓█  ▄  ▒██ █░░░██░░▓█▒  ░░██░▒██▀▀█▄   ░ ▐██▓░',
      '░▒████▒  ▒▀█░  ░██░░▒█░   ░██░░██▓ ▒██▒ ░ ██▒▓░',
      '░░ ▒░ ░  ░ ▐░  ░▓   ▒ ░   ░▓  ░ ▒▓ ░▒▓░  ██▒▒▒ ',
      ' ░ ░  ░  ░ ░░   ▒ ░ ░      ▒ ░  ░▒ ░ ▒░▓██ ░▒░ ',
      '   ░       ░░   ▒ ░ ░ ░    ▒ ░  ░░   ░ ▒ ▒ ░░  ',
      '   ░  ░     ░   ░          ░     ░     ░ ░     ',
      '            ░             evi1_f4iry   ░ ░     ',
    },
    week_header = {
      enable = false
    },
    shortcut = {
      -- action can be a function type
      {
        desc = '󰋚 History files',
        key = 'h',
        action = 'Telescope oldfiles',
      },
      {
        desc = '󰈞 Search File',
        key = 'f',
        action = 'Telescope find_files cwd=/',
      },
    },
    packages = { enable = true }, -- show how many plugins neovim loaded
    -- limit how many projects list, action when you press key or enter it will run this action.
    -- action can be a functino type, e.g.
    -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
    project = { enable = true, limit = 5, action = 'Telescope find_files cwd=' },
    mru = { limit = 4, cwd_only = false }, 
    footer = { '','Be obsessed, or be average.','','帝力于我何有哉; 不疯魔，不成活。' },
  },
  hide = {
    statusline = true,    -- hide statusline default is true
    tabline = true,       -- hide the tabline
    winbar = true,        -- hide winbar
  },
}
