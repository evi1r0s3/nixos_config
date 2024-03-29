{ pkgs-unstable, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs-unstable.vimPlugins; [
      packer-nvim
      dracula-nvim
    ];
  };
  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua" = {
    source = ./lua;
    recursive = true;
  };
}
