{ pkgs-unstable, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
   # xtraConfig = lib.fileContents
    plugins = with pkgs-unstable.vimPlugins;[
      # packer 切换到lazy了
      # 使用lazy之后不需要再使用nix预装插件了，因为无论如何lazy首次运行都会安装插件
      lazy-nvim
    ];
  };
  
  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua" = {
    source = ./lua;
    recursive = true;
  };
}
