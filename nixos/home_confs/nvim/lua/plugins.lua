local packer = require("packer")
packer.startup(
  function(use)
    -- Packer 可以管理自己本身
    use("wbthomason/packer.nvim")
    -- 你的插件列表...
    -- 主题
    use("Mofiqul/dracula.nvim")
end)

-- 每次保存 plugins.lua 自动安装插件,在使用nix的情况下不需要这个，但是还是先写在这里
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
