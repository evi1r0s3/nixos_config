{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
#    extraConfig = lib.fileContents ./init.vim;
    plugins = with pkgs.vimPlugins;[
      # packer 切换到lazy了
      # 使用lazy之后不需要再使用nix预装插件了，因为无论如何lazy首次运行都会安装插件
      lazy-nvim
      # 语法包还要编译，所以直接交由nix安装
      nvim-treesitter.withAllGrammars
    ];
  };
  
  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua" = {
    source = ./lua;
    recursive = true;
  };
}
