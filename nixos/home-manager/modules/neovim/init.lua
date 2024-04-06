-- 基础设置
require('basic')

-- 插件管理
-- require('plugins')
-- 安装lazy，如果不使用nix，应使用此部分
--[=[
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--]=]
-- lazy 加载
require("lazy").setup("plugins")
-- 主题设置
require("colorscheme")
